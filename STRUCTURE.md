# Project Structure

---

## 1. Responsive Layout Strategy

Because **OverTune** targets both mobile and desktop platforms, each feature provides dedicated user interfaces optimized for different screen sizes.

### Navigation Pattern
When navigating between screens, always target the page's entrypoint widget (for example, `example_page.dart`).

Inside this file, the `build` method should only return a `ResponsiveLayout()` widget:

```dart
@override
Widget build(BuildContext context) {
  return const ResponsiveLayout(
    mobileLayout: ExampleMobileLayout(),
    desktopLayout: ExampleDesktopLayout(),
  );
}
```

> **What is `ResponsiveLayout()`?**  
> Located in `lib/helpers/responsive_layouts.dart`, `ResponsiveLayout` wraps Flutter's `LayoutBuilder` to eliminate layout boilerplate across your feature pages.

---

## 2. Theming System

OverTune ships with two default fallback themes out of the box:
* 🌙 `defaultDark`
* ☀️ `defaultLight`

When styling individual components or custom widgets, always consume the active dynamic theme managed by the `CurrentTheme` class rather than hardcoding values.

> 📝 **Naming Convention Note:**  
> Files and classes prefixed with `ot_` or `OT` stand for **OverTune** (e.g., `ot_theme_data.dart`).