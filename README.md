# 🎬 Movies

A native iOS app for browsing and discovering movies, built entirely in Swift using modern Apple frameworks.

<img width="295" height="640" alt="Simulator Screen Recording - iPhone 17 Pro - 2026-04-29 at 15 24 29" src="https://github.com/user-attachments/assets/77492201-dce2-4d68-9e14-dfd931d33759" />

---

## Overview

Movies is a clean, performant iOS application that showcases modern Swift development practices. The project demonstrates end-to-end iOS engineering — from UI design through to unit and UI test coverage — with a focus on maintainability and scalability.

---

## Tech Stack

| Layer | Technology |
|---|---|
| Language | Swift |
| Platform | iOS (Xcode) |
| UI | SwiftUI / UIKit |
| Testing | XCTest (Unit + UI) |

---

## Project Structure

```
Movies/
├── Movies/               # Core app source — views, models, services
├── MoviesTests/          # Unit tests
├── MoviesUITests/        # UI automation tests
└── Movies.xcodeproj/     # Xcode project configuration
```

---

## Features

- Browse and discover movies in a fluid, responsive interface
- Clean architecture separating UI, business logic, and data layers
- Full unit test suite (`MoviesTests`) covering core logic
- UI tests (`MoviesUITests`) for critical user flows
- Optimised for the latest iPhone display sizes

---

## Getting Started

**Requirements:** Xcode 16+, iOS 17+

```bash
git clone https://github.com/yogin-suttroogun/Movies.git
cd Movies
open Movies.xcodeproj
```

Then hit **⌘R** to build and run on the simulator or a physical device.

**Run tests:**
```
⌘U  — runs all unit and UI tests
```

---

## Architecture

The app follows a clear separation of concerns:

- **Views** — SwiftUI screens and components, kept thin and declarative
- **Models** — Plain Swift structs/classes representing domain data
- **Services** — Networking and data-fetching logic, easily mockable for tests

This structure makes the codebase straightforward to extend and onboard new contributors quickly.

---

## What This Demonstrates

- **Native iOS development** with Swift from scratch
- **Test-driven mindset** — both unit and UI tests are first-class citizens
- **Clean project organisation** that scales to a team environment
- **Attention to UX** — smooth animations and intuitive navigation

---

## Author

**Yogin Suttroogun**  
[GitHub](https://github.com/yogin-suttroogun) · [Email](mailto:yo.suttroogun@gmail.com)
