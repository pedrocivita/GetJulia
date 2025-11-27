//
//  GameViewController.swift
//  GetJulia
//
//  Created by GetJulia Team
//

import UIKit
import WebKit

class GameViewController: UIViewController, WKNavigationDelegate, WKUIDelegate {

    private var webView: WKWebView!
    private var activityIndicator: UIActivityIndicatorView!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupWebView()
        setupActivityIndicator()
        loadGame()
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    private func setupWebView() {
        let configuration = WKWebViewConfiguration()
        configuration.allowsInlineMediaPlayback = true
        configuration.mediaTypesRequiringUserActionForPlayback = []

        // Configurar preferências
        let preferences = WKPreferences()
        preferences.javaScriptEnabled = true
        configuration.preferences = preferences

        // Configurar data store para localStorage funcionar
        let dataStore = WKWebsiteDataStore.default()
        configuration.websiteDataStore = dataStore

        webView = WKWebView(frame: view.bounds, configuration: configuration)
        webView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        webView.navigationDelegate = self
        webView.uiDelegate = self
        webView.scrollView.bounces = false
        webView.scrollView.isScrollEnabled = false
        webView.isOpaque = false
        webView.backgroundColor = UIColor(red: 250/255, green: 248/255, blue: 239/255, alpha: 1.0)

        // Desabilitar zoom
        webView.scrollView.minimumZoomScale = 1.0
        webView.scrollView.maximumZoomScale = 1.0

        // Permitir gestos de swipe
        webView.allowsBackForwardNavigationGestures = false

        view.addSubview(webView)
    }

    private func setupActivityIndicator() {
        activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator.color = UIColor(red: 119/255, green: 110/255, blue: 101/255, alpha: 1.0)
        activityIndicator.center = view.center
        activityIndicator.autoresizingMask = [.flexibleLeftMargin, .flexibleRightMargin, .flexibleTopMargin, .flexibleBottomMargin]
        activityIndicator.hidesWhenStopped = true
        view.addSubview(activityIndicator)
    }

    private func loadGame() {
        activityIndicator.startAnimating()

        // Carregar o index.html do bundle
        if let htmlPath = Bundle.main.path(forResource: "index", ofType: "html", inDirectory: "WebContent") {
            let htmlURL = URL(fileURLWithPath: htmlPath)
            let baseURL = htmlURL.deletingLastPathComponent()
            webView.loadFileURL(htmlURL, allowingReadAccessTo: baseURL)
        } else {
            showErrorAlert(message: "Erro ao carregar o jogo. Por favor, reinstale o aplicativo.")
        }
    }

    private func showErrorAlert(message: String) {
        let alert = UIAlertController(title: "Erro", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }

    // MARK: - WKNavigationDelegate

    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        activityIndicator.stopAnimating()

        // Injetar CSS para ajustar o layout no app
        let css = """
            body {
                padding-top: env(safe-area-inset-top) !important;
                padding-bottom: env(safe-area-inset-bottom) !important;
                -webkit-user-select: none !important;
                -webkit-touch-callout: none !important;
            }
        """
        let js = "var style = document.createElement('style'); style.innerHTML = '\(css)'; document.head.appendChild(style);"
        webView.evaluateJavaScript(js, completionHandler: nil)
    }

    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        activityIndicator.stopAnimating()
        showErrorAlert(message: "Erro ao carregar o jogo: \(error.localizedDescription)")
    }

    // MARK: - WKUIDelegate

    func webView(_ webView: WKWebView, createWebViewWith configuration: WKWebViewConfiguration, for navigationAction: WKNavigationAction, windowFeatures: WKWindowFeatures) -> WKWebView? {
        // Abrir links externos no Safari
        if let url = navigationAction.request.url {
            UIApplication.shared.open(url)
        }
        return nil
    }
}
