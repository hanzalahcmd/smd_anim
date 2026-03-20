# 🌅 Fade In Logo — Flutter Animation Demo

A Flutter demo app that visually compares **explicit** and **implicit** animation techniques side by side. Both panels animate the Flutter logo with a fade-in/fade-out effect, but use fundamentally different approaches — making this a great reference for learning Flutter animations.

---

## ✨ Features

- **Side-by-side comparison** — Screen is split into two halves divided by a `Divider`, one for each animation style
- **Explicit Animation** — Full manual control using `AnimationController`, `Tween`, `CurvedAnimation`, and `FadeTransition`
- **Implicit Animation** — Simpler state-driven approach using `AnimatedOpacity` and `AnimatedContainer`
- **Fade In / Fade Out buttons** — Each panel has its own controls to trigger the animation in both directions
- **Easing curve** — Both use `Curves.easeIn` over a 2-second duration for a smooth, natural feel

---

## 🎓 Key Concepts Demonstrated

| Concept | Explicit | Implicit |
|---------|----------|----------|
| Widget used | `FadeTransition` | `AnimatedOpacity` |
| Controller | `AnimationController` | None (state-driven) |
| Animation object | `Tween + CurvedAnimation` | Built into widget |
| Trigger | `.forward()` / `.reverse()` | `setState()` bool toggle |
| Best for | Complex, sequenced animations | Simple one-off transitions |

---

## 🚀 Getting Started

### Prerequisites

- [Flutter SDK](https://flutter.dev/docs/get-started/install) `>=3.0.0`
- Dart `>=3.0.0`

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/your-username/flutter-fadein-logo.git
   cd flutter-fadein-logo
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the app**
   ```bash
   flutter run
   ```

No external packages required.

---

## 🏗️ Project Structure

```
lib/
└── main.dart
    ├── MyApp              # App entry point (no theme customization)
    ├── HomePage           # Scaffold splitting screen into two panels
    ├── ExplicitFadeIn     # Uses AnimationController + FadeTransition
    │   ├── _controller    # AnimationController (2s duration)
    │   └── _animation     # Tween<double> with CurvedAnimation
    └── ImplicitFadeIn     # Uses AnimatedOpacity + AnimatedContainer
        └── _visible       # Boolean flag driving the animation state
```

---

## 🔮 Possible Extensions

- Add more animation types (scale, slide, rotation) for comparison
- Chain multiple explicit animations in sequence
- Add a slider to manually control animation progress
- Demonstrate `AnimationBuilder` vs `AnimatedWidget` patterns

---

## 👨‍💻 Authors

22k-4156 · 22k-4574 · 22k-4431 · 22k-4494

---

## 📄 License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.
