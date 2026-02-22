import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/config/env_config.dart';
import '../../../core/models/conversation_message.dart';
import '../../../core/services/supabase_service.dart';

final chatProvider =
    StateNotifierProvider<ChatNotifier, AsyncValue<List<ConversationMessage>>>(
  (ref) => ChatNotifier(),
);

class ChatNotifier
    extends StateNotifier<AsyncValue<List<ConversationMessage>>> {
  ChatNotifier() : super(const AsyncValue.loading()) {
    _init();
  }

  StreamSubscription? _subscription;

  void _init() {
    // 1. Cargar historial
    loadHistory();

    // 2. Suscribirse a nuevos mensajes en tiempo real
    _subscription = SupabaseService.client
        .from('conversation_memory')
        .stream(primaryKey: ['id'])
        .eq('organization_id', EnvConfig.organizationId)
        .order('created_at')
        .listen((data) {
          final messages =
              data.map((m) => ConversationMessage.fromJson(m)).toList();
          state = AsyncValue.data(messages);
        });
  }

  Future<void> sendMessage(String content) async {
    try {
      // 1. Guardar en Supabase (esto triggera respuesta de NEXI)
      await SupabaseService.client.rpc('store_conversation_message', params: {
        'p_organization_id': EnvConfig.organizationId,
        'p_session_id': EnvConfig.sessionId,
        'p_role': 'user',
        'p_content': content,
      });
    } catch (e) {
      // Manejo básico de errores
      print('Error sending message: $e');
    }
  }

  Future<void> loadHistory() async {
    try {
      final response =
          await SupabaseService.client.rpc('get_session_context', params: {
        'p_organization_id': EnvConfig.organizationId,
        'p_session_id': EnvConfig.sessionId,
        'p_limit': 50,
      });

      final messages = (response as List)
          .map((m) => ConversationMessage.fromJson(m))
          .toList();

      // El historial suele venir ordenado por fecha, pero rpc puede variar
      state = AsyncValue.data(messages.reversed.toList());
    } catch (e, stack) {
      state = AsyncValue.error(e, stack);
    }
  }

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }
}
