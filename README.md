# Flutter Wordle

## Overview

Flutter Wordle is a Wordle-style word puzzle game built with Flutter and Dart. You guess a hidden word within a limited number of attempts, using colour feedback to guide each guess. The project was built as a learning exercise and released on GitHub with web and Windows builds.

## Features

* Wordle-style word guessing gameplay
* On-screen keyboard with colour feedback
* Limited guesses per round
* Valid word checking
* Clean, minimal UI
* Keyboard and mouse input support
* Web and Windows builds from one codebase

## Getting Started

### Prerequisites

* Flutter SDK
* Dart SDK
* For web testing:

  * Python 3 installed
* For Windows builds:

  * Windows 10 or 11
  * Visual Studio with C++ desktop workload

### Installation

Clone the repository:

```bash
git clone https://github.com/peterzma/flutter-wordle.git
```

Install dependencies:

```bash
flutter pub get
```

### Running the Game

#### Run in development

Web:

```bash
flutter run -d chrome
```

Windows:

```bash
flutter run -d windows
```

#### Build the game

Web:

```bash
flutter build web
```

Windows:

```bash
flutter build windows
```

### Playing the Web Build

Flutter web builds must be served over HTTP.

Steps:

1. Open a terminal
2. Navigate to:

   ```bash
   cd build/web
   ```
3. Run:

   ```bash
   python -m http.server
   ```
4. Open:

   ```
   http://localhost:8000
   ```

## Releases

You can download prebuilt versions from GitHub Releases:

* Web build: unzip and serve with a local web server
* Windows build: download and run the `.exe`

Latest release:
**[v1.0.0](https://github.com/peterzma/flutter-wordle/releases/tag/v1.0.0)**

## How to Play

* **Type letters:** Click the on-screen keys
* **Submit guess:** Enter
* **Delete letter:** Backspace
* **Green tile:** Correct letter and position
* **Yellow tile:** Correct letter, wrong position
* **Grey tile:** Letter not in the word
* **Win:** Guess the word within the allowed attempts

## TODO

* Add a larger word list for random selection
* Improve UI for game over, restart, and win states
* Add full physical keyboard input support
* Add custom game modes
