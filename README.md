# GetJulia

[![HTML5](https://img.shields.io/badge/HTML5-E34F26?style=for-the-badge&logo=html5&logoColor=white)](https://developer.mozilla.org/en-US/docs/Web/HTML)
[![CSS3](https://img.shields.io/badge/CSS3-1572B6?style=for-the-badge&logo=css3&logoColor=white)](https://developer.mozilla.org/en-US/docs/Web/CSS)
[![JavaScript](https://img.shields.io/badge/JavaScript-F7DF1E?style=for-the-badge&logo=javascript&logoColor=black)](https://developer.mozilla.org/en-US/docs/Web/JavaScript)
[![Swift](https://img.shields.io/badge/Swift-FA7343?style=for-the-badge&logo=swift&logoColor=white)](https://swift.org/)
[![iOS](https://img.shields.io/badge/iOS-000000?style=for-the-badge&logo=ios&logoColor=white)](https://www.apple.com/ios/)
[![SASS](https://img.shields.io/badge/Sass-CC6699?style=for-the-badge&logo=sass&logoColor=white)](https://sass-lang.com/)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg?style=for-the-badge)](https://opensource.org/licenses/MIT)

A web-based puzzle game inspired by 2048, developed as part of a Computer Engineering project at Insper. The game challenges players to combine tiles featuring different universities to reach the ultimate goal: "Julia".

## Overview

GetJulia is an interactive tile-merging puzzle game where players combine university logos to progress through increasingly challenging levels. Built with vanilla JavaScript and featuring both web and iOS versions, this project demonstrates proficiency in front-end development, game logic implementation, and cross-platform mobile development.

The game was developed as an academic project for the Computer Engineering program at Instituto de Ensino e Pesquisa (Insper), showcasing skills in software development, UI/UX design, and project management.

## Features

- **Intuitive Gameplay**: Classic 2048-style mechanics with keyboard controls
- **Custom Theming**: University-themed tiles featuring logos from major Brazilian institutions
- **Score Tracking**: Real-time score updates with best score persistence using local storage
- **Responsive Design**: Fully responsive interface that works across different screen sizes
- **Cross-Platform**: Available as both a web application and native iOS app
- **Clean UI**: Modern, minimalist design with smooth animations
- **Progressive Difficulty**: Strategic gameplay that becomes increasingly challenging

## Technologies Used

### Web Version
- **HTML5**: Semantic markup and structure
- **CSS3/SASS**: Styling with preprocessor for maintainable stylesheets
- **JavaScript (ES5)**: Game logic, state management, and DOM manipulation
- **Local Storage API**: Score persistence

### iOS Version
- **Swift**: Native iOS development
- **UIKit**: User interface framework
- **WKWebView**: Embedded web content
- **Xcode**: Development environment

## Installation

### Web Version

1. Clone the repository:
```bash
git clone https://github.com/pedrocivita/GetJulia.git
cd GetJulia
```

2. Open `index.html` in your web browser:
```bash
# On macOS
open index.html

# On Linux
xdg-open index.html

# Or simply drag and drop the file into your browser
```

Alternatively, deploy to any static web hosting service (GitHub Pages, Netlify, Vercel, etc.).

### iOS Version

1. Navigate to the iOS project directory:
```bash
cd GetJulia-iOS
```

2. Open the project in Xcode:
```bash
open GetJulia.xcodeproj
```

3. Build and run on simulator or connected device

For detailed instructions on deploying to TestFlight, see [GUIA-TESTFLIGHT.md](GUIA-TESTFLIGHT.md).

## How to Play

1. Use arrow keys (or swipe on mobile) to move tiles in four directions
2. When two tiles with the same university logo touch, they merge into one
3. Continue merging tiles to progress through the university hierarchy
4. The goal is to reach the final tile: Julia
5. The game ends when the grid is full and no moves are possible

## Project Structure

```
GetJulia/
├── index.html              # Main HTML file
├── style/                  # Stylesheets
│   ├── main.css           # Compiled CSS
│   ├── main.scss          # Main SASS file
│   └── helpers.scss       # SASS helpers and mixins
├── js/                    # JavaScript source files
│   ├── game_manager.js    # Core game logic
│   ├── grid.js           # Grid management
│   ├── tile.js           # Tile entities
│   ├── html_actuator.js  # DOM updates
│   ├── keyboard_input_manager.js  # Input handling
│   ├── local_score_manager.js     # Score persistence
│   └── application.js    # Application initialization
├── img/                   # University logo assets
├── GetJulia-iOS/         # Native iOS application
│   ├── GetJulia.xcodeproj
│   └── GetJulia/
├── CONTRIBUTING.md        # Contribution guidelines
├── GUIA-TESTFLIGHT.md    # TestFlight deployment guide (Portuguese)
└── LICENSE               # MIT License

```

## Demo

Play the game online: [GetJulia Web Version](https://pedrocivita.github.io/GetJulia/)

## Academic Context

This project was developed as part of the Computer Engineering curriculum at Insper (Instituto de Ensino e Pesquisa), one of Brazil's leading engineering schools. The project demonstrates:

- Object-oriented programming principles
- Event-driven architecture
- State management in interactive applications
- Responsive web design
- Cross-platform mobile development
- Version control with Git

## Contributing

Contributions are welcome! Please read [CONTRIBUTING.md](CONTRIBUTING.md) for details on the process for submitting pull requests.

### Development Guidelines

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/improvement`)
3. Make your changes
4. Test thoroughly to ensure the game works correctly
5. Commit your changes (`git commit -m 'Add improvement'`)
6. Push to the branch (`git push origin feature/improvement`)
7. Open a Pull Request to the `master` branch

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Acknowledgments

- Inspired by [GetMIT](https://mitchgu.github.io/GetMIT/) by Mitchell Gu
- Original 2048 game by Gabriele Cirulli
- Developed at Insper - Instituto de Ensino e Pesquisa

## Disclaimer

This project is for educational purposes. No intention to harm any intellectual property. If you feel this game may affect you negatively in any way, please contact the author.

## Author

**Pedro Civita**

Computer Engineering Student at Insper

- LinkedIn: [linkedin.com/in/pedro-civita-b5178b1a7](https://www.linkedin.com/in/pedro-civita-b5178b1a7/)
- Email: pedrovac@al.insper.edu.br
- GitHub: [@pedrocivita](https://github.com/pedrocivita)

---

Made with dedication as part of the Computer Engineering program at Insper
