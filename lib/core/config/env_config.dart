import 'package:flutter_dotenv/flutter_dotenv.dart';

/// Configuración desde variables de entorno (.env).
/// Requiere cargar dotenv en main() antes de usar.
class EnvConfig {
  EnvConfig._();

  static String get supabaseUrl {
    final value = dotenv.env['SUPABASE_URL'];
    if (value == null || value.isEmpty) {
      throw _missingEnvError('SUPABASE_URL');
    }
    return value;
  }

  static String get supabaseAnonKey {
    final value = dotenv.env['SUPABASE_ANON_KEY'];
    if (value == null || value.isEmpty) {
      throw _missingEnvError('SUPABASE_ANON_KEY');
    }
    return value;
  }

  static String get organizationId =>
      dotenv.env['ORGANIZATION_ID'] ?? 'MILTON_ORG_ID';

  static String get sessionId =>
      dotenv.env['SESSION_ID'] ?? 'nexi_primary';

  static StateError _missingEnvError(String key) => StateError(
        'Falta $key en .env. Copia .env.example a .env y completa los valores.',
      );
}
