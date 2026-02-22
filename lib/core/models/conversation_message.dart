import 'package:freezed_annotation/freezed_annotation.dart';

part 'conversation_message.freezed.dart';
part 'conversation_message.g.dart';

@freezed
class ConversationMessage with _$ConversationMessage {
  const factory ConversationMessage({
    required String id,
    required String orgId,
    required String sessionId,
    required String role, // 'user' | 'assistant' | 'system'
    required String content,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(includeIfNull: false) Map<String, dynamic>? metadata,
  }) = _ConversationMessage;
  
  factory ConversationMessage.fromJson(Map<String, dynamic> json) => 
      _$ConversationMessageFromJson(json);
}
