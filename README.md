# NexCart

NexCart is a Flutter e-commerce application built for a machine test. The project follows a feature-first Clean Architecture approach, uses Riverpod 3 for state management and dependency injection, applies Atomic Design in the presentation layer, and uses `sqflite` for local persistence.

The original brief referenced Fake Store API. This implementation uses DummyJSON because the Fake Store endpoints were failing during the test period.

API base URL:
`https://dummyjson.com/`

App source directory:
`/Users/AnandhuV/Projects/Own/NexCart/nexcart`

## Features

- Authentication with `POST /auth/login`
- Secure token storage with `flutter_secure_storage`
- Auth header injection through Dio interceptor
- Product catalog with pagination
- Product details view
- Product search pipeline with Riverpod notifier support
- Category-based browsing
- Local cart using `sqflite`
- Optimistic cart updates for immediate UI feedback
- User profile fetch
- Light and dark themes using `ThemeExtension`
- Shimmer loading states
- Empty and error state UI molecules

## Architecture Pattern

This project combines:

- Clean Architecture for separation of concerns
- Feature-first folder organization
- Atomic Design for reusable UI composition
- Riverpod 3 generators for state and dependency graph management

Each feature is divided into:

- `data`
  Handles DTOs, repositories, and local/remote data sources
- `domain`
  Contains entities, repository contracts, and use cases
- `presentation`
  Contains notifiers, screens, and UI components
- `di`
  Contains Riverpod providers for dependency injection

Core shared concerns live under:

- `lib/core/config`
- `lib/core/database`
- `lib/core/network`
- `lib/core/providers`
- `lib/core/router`
- `lib/core/theme`
- `lib/core/ui`

## Project Structure

```text
NexCart/
  README.md
  nexcart/
    lib/
      core/
      features/
        authentication/
        cart/
        products/
        profile/
        splash/
    assets/
    test/
```

## Single Source Of Truth Approach

The app is structured around a remote-first data flow with local persistence support:

- Authentication tokens are stored securely in `flutter_secure_storage`
- Product data is fetched from the API and cached locally in `sqflite`
- Product detail requests can fall back to local cache
- Cart operations are maintained locally for responsiveness and offline persistence

## Packages Used

Main packages used in this project:

Runtime dependencies:

- `flutter_riverpod`
- `riverpod_annotation`
- `go_router`
- `dio`
- `flutter_secure_storage`
- `sqflite`
- `path`
- `dart_either`
- `freezed_annotation`
- `json_annotation`
- `cached_network_image`
- `shimmer`
- `connectivity_plus`
- `flutter_localizations`
- `intl`
- `cupertino_icons`

Development dependencies:

- `build_runner`
- `riverpod_generator`
- `freezed`
- `json_serializable`
- `custom_lint`
- `riverpod_lint`
- `flutter_lints`
- `flutter_launcher_icons`

## Setup Instructions

1. Clone the repository.
2. Open the Flutter app directory:

```bash
cd nexcart
```

3. Install dependencies:

```bash
flutter pub get
```

4. Generate code:

```bash
dart run build_runner build --delete-conflicting-outputs
```

5. Run the application:

```bash
flutter run
```

## Build Runner Commands

Generate files once:

```bash
dart run build_runner build --delete-conflicting-outputs
```

Watch for changes during development:

```bash
dart run build_runner watch --delete-conflicting-outputs
```

## Useful Development Commands

Analyze the project:

```bash
flutter analyze
```

Run tests:

```bash
flutter test
```

## Design System Notes

- Custom typography uses the Poppins font family
- Reusable atoms and molecules are placed under `lib/core/ui`
- Theming is centralized using `ThemeExtension`
- Light and dark modes are both configured

## Implemented Modules

### Authentication

- Login flow
- Secure token persistence
- Auth-aware API requests

### Product Catalog

- Product listing
- Pagination with `limit` and `skip`
- Category selection
- Product detail screen
- Cached remote product images
- Pull-to-refresh support in product list screen

### Cart

- Local cart storage with `sqflite`
- Optimistic add and remove actions
- Reactive cart badge updates

### Profile

- Authenticated user profile fetch
- Logout flow with token clearing and local database cleanup

## Notes On API Choice

This project targets DummyJSON instead of Fake Store API.

Reason:

- The original brief referenced Fake Store API
- During the machine test, DummyJSON was used instead because Fake Store was failing

This affected the implementation scope:

- Products, auth, carts, and users were built against DummyJSON
- Orders were not implemented because they are not part of the provided machine-test rubric and are not available as a dedicated DummyJSON resource
- User /POST is not implemented since DummyJSON does not support server edits

## Current Status

Implemented:

- Core architecture and DI
- Auth flow
- Product catalog and details
- Local persistence for products and cart
- Optimistic cart UX
- Theming and reusable UI system
- Localization with Flutter localizations and `.arb` files
- Splash-first app startup flow
- Real-time connectivity guard and offline banner handling
- Debounced search

## Submission Summary

This submission demonstrates:

- Clean Architecture with clear layer separation
- Riverpod 3 generator usage
- Atomic Design based UI composition
- Secure auth token handling
- Local database persistence with `sqflite`
- Modern Flutter UI patterns with reusable components

## Repository Notes

If generated files are stale after pulling the project, run:

```bash
dart run build_runner build --delete-conflicting-outputs
```
