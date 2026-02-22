# NEXI Assistant

Flutter app for the NEXI / OpenClaw-NX chat interface.

## Stack

- **Flutter** 3.16+ (Impeller rendering)
- **Dart** 3.0+ (records, patterns)
- **Riverpod** (state management)
- **go_router** (navigation)
- **Google Fonts** (Space Grotesk)

## Setup

```bash
cd nexi_assistant
flutter pub get

# Crear .env con credenciales (copia .env.example si no existe)
# cp .env.example .env
# Edita .env con tu SUPABASE_URL y SUPABASE_ANON_KEY

flutter run
```

**Importante:** El archivo `.env` contiene credenciales y **no debe subirse a GitHub**. Está en `.gitignore`. Usa `.env.example` como plantilla.

## Architecture

- **Feature-based**: `lib/features/home/`, `lib/features/commands/`
- **Core widgets**: `lib/core/widgets/`
- **Services**: `lib/services/`
- **Models**: freezed + json_serializable

## Design System

- Dark mode only (por ahora)
- **Primary**: `#4b3fe9` (indigo)
- **Accent**: `#2dd4bf` (teal)
- **Glassmorphism**: `BackdropFilter` + semi-transparent
- **Border radius**: 16px (cards), 24px (buttons), full (FAB)
