# Guia Completo: Deploy do GetJulia no TestFlight

Este guia explica passo a passo como implantar o app GetJulia no seu iPhone pessoal usando o Apple TestFlight.

## Índice

1. [Pré-requisitos](#1-pré-requisitos)
2. [Configurar Conta de Desenvolvedor Apple](#2-configurar-conta-de-desenvolvedor-apple)
3. [Abrir o Projeto no Xcode](#3-abrir-o-projeto-no-xcode)
4. [Configurar Assinatura do App](#4-configurar-assinatura-do-app)
5. [Gerar Ícones do App](#5-gerar-ícones-do-app)
6. [Testar no Simulador](#6-testar-no-simulador)
7. [Testar no iPhone (Cabo USB)](#7-testar-no-iphone-cabo-usb)
8. [Criar Archive para TestFlight](#8-criar-archive-para-testflight)
9. [Enviar para App Store Connect](#9-enviar-para-app-store-connect)
10. [Distribuir via TestFlight](#10-distribuir-via-testflight)
11. [Instalar no iPhone](#11-instalar-no-iphone)
12. [Solução de Problemas](#12-solução-de-problemas)

---

## 1. Pré-requisitos

### Hardware
- **Mac** com macOS Ventura (13.0) ou superior
- **iPhone** com iOS 15.0 ou superior
- Cabo Lightning/USB-C para conectar o iPhone ao Mac

### Software
- **Xcode 15** ou superior (baixe gratuitamente na Mac App Store)
- **ImageMagick** (opcional, para gerar ícones): `brew install imagemagick`

### Contas
- **Apple ID** (gratuito)
- **Conta de Desenvolvedor Apple** (necessário para TestFlight)
  - Programa Individual: US$ 99/ano
  - Programa Empresarial: US$ 299/ano

> **Nota**: Para testar apenas no seu próprio dispositivo via cabo USB, você pode usar uma conta Apple ID gratuita (com limitações).

---

## 2. Configurar Conta de Desenvolvedor Apple

### Opção A: Conta Gratuita (apenas teste local)
1. Abra **Xcode** → **Settings** (⌘,)
2. Vá para **Accounts**
3. Clique em **+** e selecione **Apple ID**
4. Faça login com seu Apple ID

> Limitações: Apps expiram após 7 dias, não pode usar TestFlight

### Opção B: Programa de Desenvolvedor (TestFlight)
1. Acesse [developer.apple.com/programs](https://developer.apple.com/programs)
2. Clique em **Enroll**
3. Siga o processo de inscrição
4. Pague a taxa anual (US$ 99)
5. Aguarde aprovação (pode levar até 48 horas)

---

## 3. Abrir o Projeto no Xcode

1. Navegue até a pasta do projeto:
   ```
   GetJulia/GetJulia-iOS/
   ```

2. Abra o arquivo **GetJulia.xcodeproj** com duplo clique
   - Ou via terminal: `open GetJulia.xcodeproj`

3. Aguarde o Xcode indexar o projeto

---

## 4. Configurar Assinatura do App

### 4.1 Selecionar o Target
1. No Xcode, clique no projeto **GetJulia** no navegador à esquerda
2. Selecione o target **GetJulia** na lista de targets

### 4.2 Configurar Signing & Capabilities
1. Vá para a aba **Signing & Capabilities**
2. Marque **Automatically manage signing**
3. Em **Team**, selecione sua conta de desenvolvedor
4. O **Bundle Identifier** deve ser único:
   - Formato: `com.SEUNOME.getjulia`
   - Exemplo: `com.joaosilva.getjulia`

### 4.3 Verificar Configurações
- ✅ Team: Sua conta de desenvolvedor
- ✅ Bundle Identifier: Único
- ✅ Provisioning Profile: Gerado automaticamente
- ✅ Signing Certificate: Apple Development

---

## 5. Gerar Ícones do App

O app precisa de ícones em vários tamanhos. Use uma das opções:

### Opção A: Script Automático (recomendado)
```bash
cd GetJulia-iOS/Scripts
./generate-icons.sh
```

### Opção B: Usar Ferramenta Online
1. Acesse [appicon.co](https://appicon.co)
2. Faça upload de uma imagem 1024x1024px
3. Baixe os ícones gerados
4. Copie para: `GetJulia/Assets.xcassets/AppIcon.appiconset/`

### Opção C: Gerar Manualmente
Crie imagens PNG nos seguintes tamanhos:
- 40x40, 60x60, 58x58, 87x87, 80x80, 120x120, 180x180 (iPhone)
- 20x20, 29x29, 40x40, 76x76, 152x152, 167x167 (iPad)
- 1024x1024 (App Store)

---

## 6. Testar no Simulador

Antes de enviar para TestFlight, teste no simulador:

1. Na barra superior do Xcode, selecione um simulador:
   - Ex: **iPhone 15 Pro**

2. Clique no botão **▶ Run** (ou ⌘R)

3. Aguarde o build e o simulador abrir

4. Teste o jogo:
   - Use as setas do teclado para mover
   - Verifique se o score salva
   - Teste o botão "Nova Partida"

---

## 7. Testar no iPhone (Cabo USB)

### 7.1 Preparar o iPhone
1. Conecte o iPhone ao Mac via cabo
2. No iPhone, vá em **Ajustes** → **Privacidade e Segurança** → **Modo de Desenvolvedor**
3. Ative o **Modo de Desenvolvedor** e reinicie

### 7.2 Confiar no Desenvolvedor
1. Após instalar o app, se aparecer "Desenvolvedor Não Confiável":
2. Vá em **Ajustes** → **Geral** → **VPN e Gerenciamento de Dispositivos**
3. Toque no seu certificado de desenvolvedor
4. Toque em **Confiar**

### 7.3 Executar no Dispositivo
1. No Xcode, selecione seu iPhone na lista de dispositivos
2. Clique em **▶ Run** (⌘R)
3. Aguarde o build e instalação
4. O app abrirá automaticamente no iPhone

---

## 8. Criar Archive para TestFlight

### 8.1 Configurar para Release
1. Na barra superior, selecione **Any iOS Device (arm64)**
2. Vá em **Product** → **Scheme** → **Edit Scheme**
3. Em **Archive**, confirme que **Build Configuration** é **Release**

### 8.2 Criar Archive
1. Vá em **Product** → **Archive** (ou ⇧⌘B depois ⌘U)
2. Aguarde o processo de build (pode levar alguns minutos)
3. Quando terminar, a janela **Organizer** abrirá automaticamente

---

## 9. Enviar para App Store Connect

### 9.1 No Organizer
1. Selecione o archive recém-criado
2. Clique em **Distribute App**

### 9.2 Escolher Método de Distribuição
1. Selecione **App Store Connect**
2. Clique em **Next**

### 9.3 Configurar Upload
1. Selecione **Upload** (para enviar ao TestFlight)
2. Mantenha todas as opções marcadas:
   - ✅ Upload your app's symbols
   - ✅ Manage Version and Build Number
3. Clique em **Next**

### 9.4 Selecionar Certificado
1. Selecione **Automatically manage signing**
2. Clique em **Next**

### 9.5 Upload
1. Revise as informações
2. Clique em **Upload**
3. Aguarde o upload (pode levar de 5-15 minutos)

---

## 10. Distribuir via TestFlight

### 10.1 Acessar App Store Connect
1. Acesse [appstoreconnect.apple.com](https://appstoreconnect.apple.com)
2. Faça login com seu Apple ID de desenvolvedor

### 10.2 Criar App (primeira vez)
1. Clique em **Apps** → **+** → **New App**
2. Preencha:
   - **Platform**: iOS
   - **Name**: GetJulia
   - **Primary Language**: Portuguese (Brazil)
   - **Bundle ID**: Selecione o que você configurou
   - **SKU**: getjulia-001 (identificador único)

### 10.3 Configurar TestFlight
1. Vá para a aba **TestFlight**
2. O build enviado aparecerá em "Processing" (aguarde 5-30 min)
3. Quando estiver pronto, clique no build

### 10.4 Responder Perguntas de Compliance
1. Na seção **Export Compliance**, responda:
   - "Does your app use encryption?": **No**
   (O app não usa criptografia própria)

### 10.5 Adicionar Testadores

#### Testadores Internos (até 100 usuários)
1. Vá em **Internal Testing** → **+**
2. Crie um grupo (ex: "Equipe GetJulia")
3. Adicione emails dos testadores
4. Os testadores receberão convites por email

#### Testadores Externos (até 10.000 usuários)
1. Vá em **External Testing** → **+**
2. Crie um grupo
3. Adicione testadores por email ou link público
4. **Requer revisão da Apple** (24-48 horas)

---

## 11. Instalar no iPhone

### 11.1 Baixar TestFlight
1. No iPhone, abra a **App Store**
2. Busque por **TestFlight**
3. Baixe e instale o app (gratuito)

### 11.2 Aceitar Convite
1. Abra o email de convite do TestFlight
2. Toque em **View in TestFlight**
3. Ou abra o TestFlight e use o código de convite

### 11.3 Instalar o App
1. No TestFlight, encontre **GetJulia**
2. Toque em **Install**
3. Aguarde o download
4. Toque em **Open** para jogar!

---

## 12. Solução de Problemas

### Erro: "Untrusted Developer"
**Solução**: Vá em Ajustes → Geral → VPN e Gerenciamento de Dispositivos → Confiar

### Erro: "No signing certificate"
**Solução**:
1. Xcode → Settings → Accounts
2. Selecione sua conta → Manage Certificates
3. Clique em + → Apple Development

### Erro: "Bundle ID already exists"
**Solução**: Altere o Bundle Identifier para algo único como `com.SEUNOME.getjulia`

### Build falha no Upload
**Solução**:
1. Verifique se o ícone de 1024x1024 existe
2. Verifique se o Info.plist está correto
3. Limpe o build: Product → Clean Build Folder (⇧⌘K)

### App não abre após instalação
**Solução**:
1. Reinicie o iPhone
2. Reinstale o app
3. Verifique se o iOS é 15.0 ou superior

### Testadores não recebem convite
**Solução**:
1. Verifique se o email está correto
2. Peça para verificar a pasta de spam
3. Reenvie o convite pelo App Store Connect

---

## Resumo Rápido

```
1. Abra GetJulia.xcodeproj no Xcode
2. Configure Team e Bundle ID
3. Gere os ícones do app
4. Teste no simulador (⌘R)
5. Archive (Product → Archive)
6. Distribute App → App Store Connect → Upload
7. Configure no App Store Connect
8. Adicione testadores no TestFlight
9. Instale TestFlight no iPhone
10. Aceite o convite e instale o GetJulia
```

---

## Próximos Passos

Após o sucesso no TestFlight, você pode:

1. **Publicar na App Store**: Configure metadados, screenshots e envie para revisão
2. **Adicionar mais funcionalidades**: Game Center, iCloud sync, notificações
3. **Monetizar**: Adicione compras in-app ou anúncios

---

## Suporte

Se encontrar problemas:
1. Verifique a [documentação oficial da Apple](https://developer.apple.com/documentation/)
2. Consulte os [fóruns de desenvolvedores](https://developer.apple.com/forums/)
3. Abra uma issue no repositório do projeto

**Boa sorte com seu app GetJulia!** 🎮
