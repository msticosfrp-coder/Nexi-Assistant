import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/widgets/glass_card.dart';
import '../../core/widgets/gradient_text.dart';
import '../../core/widgets/status_indicator.dart';
import '../../core/constants/colors.dart';
import '../../core/constants/styles.dart';
import '../../core/models/conversation_message.dart';
import '../chat/providers/chat_provider.dart';

/// Home Screen - Chat Interface
/// Main entry point with message list and input
class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  final TextEditingController _messageController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  bool _isTyping = false;
  final bool _isConnected = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _messageController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  String _formatTime(DateTime time) {
    return '${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}';
  }

  void _sendMessage() {
    final text = _messageController.text.trim();
    if (text.isEmpty) return;

    _messageController.clear();
    ref.read(chatProvider.notifier).sendMessage(text);

    // Scroll to bottom
    _scrollToBottom();
  }

  void _scrollToBottom() {
    Future.delayed(const Duration(milliseconds: 100), () {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            // Background glow effects
            Positioned(
              top: -60,
              right: -60,
              child: Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  color: NexiColors.primary.withOpacity(0.2),
                  shape: BoxShape.circle,
                ),
              ),
            ),
            Positioned(
              bottom: -60,
              left: -60,
              child: Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  color: NexiColors.accentTeal.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
              ),
            ),
            // Main content
            Column(
              children: [
                // Header
                GlassCard(
                  margin: const EdgeInsets.all(NexiStyles.spaceM),
                  child: Row(
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: NexiColors.primary.withOpacity(0.3),
                          ),
                          color: NexiColors.primary.withOpacity(0.1),
                        ),
                        child: const Icon(
                          Icons.auto_awesome,
                          color: NexiColors.primary,
                          size: 20,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const GradientText(
                              text: 'NEXI',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Row(
                              children: [
                                StatusIndicator(
                                  isOnline: _isConnected,
                                  size: 8,
                                ),
                                const SizedBox(width: 6),
                                Expanded(
                                  child: Text(
                                    'OpenClaw-NX Connected',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelSmall
                                        ?.copyWith(
                                          color: NexiColors.textMuted,
                                          letterSpacing: 1,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      GlassButton(
                        icon: Icons.settings,
                        size: 40,
                        onPressed: () {
                          // Navigate to settings
                        },
                      ),
                    ],
                  ),
                ),
                // Chat area
                Expanded(
                  child: ref.watch(chatProvider).when(
                        loading: () => const Center(
                          child: CircularProgressIndicator(),
                        ),
                        error: (err, stack) => Center(
                          child: Text('Error: $err'),
                        ),
                        data: (messages) => ListView.builder(
                          controller: _scrollController,
                          padding: const EdgeInsets.symmetric(
                            horizontal: NexiStyles.spaceM,
                          ),
                          itemCount: messages.length + (_isTyping ? 1 : 0) + 1,
                          itemBuilder: (context, index) {
                            // Welcome date
                            if (index == 0) {
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 16),
                                child: Center(
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 12,
                                      vertical: 4,
                                    ),
                                    decoration: BoxDecoration(
                                      color: NexiColors.surfaceDark
                                          .withOpacity(0.5),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Text(
                                      'Today',
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelSmall
                                          ?.copyWith(
                                            color: NexiColors.textMuted,
                                          ),
                                    ),
                                  ),
                                ),
                              );
                            }

                            final messageIndex = index - 1;

                            // Typing indicator
                            if (_isTyping && messageIndex == messages.length) {
                              return const Padding(
                                padding: EdgeInsets.only(bottom: 16),
                                child: TypingIndicator(),
                              );
                            }

                            // Regular message
                            if (messageIndex < messages.length) {
                              final message = messages[messageIndex];
                              final isUser = message.role == 'user';
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 16),
                                child: Align(
                                  alignment: isUser
                                      ? Alignment.centerRight
                                      : Alignment.centerLeft,
                                  child: SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.85,
                                    child: isUser
                                        ? UserMessageBubble(
                                            message: message.content,
                                            timestamp:
                                                _formatTime(message.createdAt),
                                          )
                                        : AIMessageBubble(
                                            message: message.content,
                                            timestamp:
                                                _formatTime(message.createdAt),
                                            showAvatar: messageIndex == 0 ||
                                                messages[messageIndex - 1]
                                                        .role ==
                                                    'user',
                                          ),
                                  ),
                                ),
                              );
                            }

                            return const SizedBox.shrink();
                          },
                        ),
                      ),
                ),
                // Quick actions
                const SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.symmetric(
                    horizontal: NexiStyles.spaceM,
                    vertical: NexiStyles.spaceS,
                  ),
                  child: Row(
                    children: [
                      _QuickActionChip(
                        icon: Icons.visibility,
                        label: 'Check roturas',
                        isActive: true,
                      ),
                      SizedBox(width: 8),
                      _QuickActionChip(
                        icon: Icons.chat,
                        label: 'Send WhatsApp',
                      ),
                      SizedBox(width: 8),
                      _QuickActionChip(
                        icon: Icons.lightbulb,
                        label: 'Light Scene',
                      ),
                      SizedBox(width: 8),
                      _QuickActionChip(
                        icon: Icons.terminal,
                        label: 'Logs',
                      ),
                    ],
                  ),
                ),
                // Input bar
                Padding(
                  padding: const EdgeInsets.all(NexiStyles.spaceM),
                  child: GlassInput(
                    controller: _messageController,
                    hintText: 'Type a command...',
                    leading: GlassButton(
                      icon: Icons.add,
                      size: 36,
                      onPressed: () {},
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        GlassButton(
                          icon: Icons.mic,
                          size: 36,
                          onPressed: () {},
                        ),
                        const SizedBox(width: 8),
                        GestureDetector(
                          onTap: _sendMessage,
                          child: Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: NexiColors.primary,
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: NexiColors.primary.withOpacity(0.4),
                                  blurRadius: 12,
                                  offset: const Offset(0, 4),
                                ),
                              ],
                            ),
                            child: const Icon(
                              Icons.arrow_upward,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                        ),
                      ],
                    ),
                    onSubmit: _sendMessage,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

/// Quick action chip widget
class _QuickActionChip extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isActive;

  const _QuickActionChip({
    required this.icon,
    required this.label,
    this.isActive = false,
  });

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      padding: const EdgeInsets.symmetric(
        horizontal: NexiStyles.spaceM,
        vertical: NexiStyles.spaceS,
      ),
      backgroundColor: isActive
          ? NexiColors.accentTeal.withOpacity(0.1)
          : null,
      border: Border.all(
        color: isActive
            ? NexiColors.accentTeal.withOpacity(0.3)
            : NexiColors.glassBorder,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: 16,
            color: isActive ? NexiColors.accentTeal : NexiColors.textSecondary,
          ),
          const SizedBox(width: 6),
          Text(
            label,
            style: Theme.of(context).textTheme.labelMedium?.copyWith(
                  color: isActive
                      ? NexiColors.accentTeal
                      : NexiColors.textSecondary,
                  fontWeight: FontWeight.w600,
                ),
          ),
        ],
      ),
    );
  }
}

