import 'package:supabase_flutter/supabase_flutter.dart';

import '../config/env_config.dart';

class SupabaseService {
  static late final SupabaseClient _client;

  static Future<void> initialize() async {
    await Supabase.initialize(
      url: EnvConfig.supabaseUrl,
      anonKey: EnvConfig.supabaseAnonKey,
      realtimeClientOptions: const RealtimeClientOptions(
        eventsPerSecond: 10,
      ),
    );
    _client = Supabase.instance.client;
  }

  static SupabaseClient get client => _client;
}
