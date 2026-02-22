import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'app.dart';
import 'core/services/supabase_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Cargar variables de entorno (credenciales desde .env, no en git)
  await dotenv.load(fileName: '.env');

  // Initialize Supabase
  await SupabaseService.initialize();
  
  // Run with Riverpod provider scope
  runApp(
    const ProviderScope(
      child: NexiAssistantApp(),
    ),
  );
}
