# GraphQL_practice

A new Flutter project.

# Project Structure

lib/
├── app.dart
├── main.dart
├── routes/                       # Localization ARB files
│   ├── app_routes.dart
│   ├── route_generator.dart

├── core/                       # ONE single core folder
│   ├── /constants
│   │   ├── app_colors.dart
│   │   ├── app_strings.dart
│   │   └── app_assets.dart
│   │
│   ├── localization/
│   │   └── app_localizations.dart
│   │
│   ├── services/
│   │   └── local_storage_service.dart
│   │
│   ├── utils/
│   │   ├── helpers.dart
│   │   └── extensions.dart
│   │
│   ├── network/
│   │   └── graphql_client.dart
│   │
│   └── models/                 # Reusable/global models
│       ├── character.dart
│       ├── episode_info.dart
│       └── location_info.dart

├── features/
│   ├── home/
│   │   ├── view/
│   │   ├── viewmodel/
│   │   ├── widgets/
│   │   └── models/
│   │       └── home_filter.dart
