import 'package:flutter/material.dart';
import '../constants/colors.dart';

/// Gradient Text using ShaderMask
class GradientText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final Gradient gradient;

  const GradientText({
    super.key,
    required this.text,
    this.style,
    this.gradient = NexiColors.gradientPrimary,
  });

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) => gradient.createShader(bounds),
      blendMode: BlendMode.srcIn,
      child: Text(
        text,
        style: (style ?? Theme.of(context).textTheme.bodyLarge)?.copyWith(
          color: Colors.white,
        ),
      ),
    );
  }
}

/// AI Message Bubble with gradient background
class AIMessageBubble extends StatelessWidget {
  final String message;
  final String? timestamp;
  final bool showAvatar;

  const AIMessageBubble({
    super.key,
    required this.message,
    this.timestamp,
    this.showAvatar = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            if (showAvatar) ...[
              Container(
                width: 28,
                height: 28,
                margin: const EdgeInsets.only(right: 8),
                decoration: BoxDecoration(
                  color: NexiColors.primary.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(
                    color: NexiColors.primary.withOpacity(0.3),
                  ),
                ),
                child: const Icon(
                  Icons.psychology,
                  color: NexiColors.primary,
                  size: 14,
                ),
              ),
            ],
            Flexible(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration: BoxDecoration(
                  gradient: NexiColors.gradientPrimary,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                    bottomRight: Radius.circular(16),
                    bottomLeft: Radius.circular(4),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: NexiColors.primary.withOpacity(0.3),
                      blurRadius: 15,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Text(
                  message,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    height: 1.5,
                  ),
                ),
              ),
            ),
          ],
        ),
        if (timestamp != null) ...[
          const SizedBox(height: 4),
          Text(
            timestamp!,
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
              color: NexiColors.textMuted,
            ),
          ),
        ],
      ],
    );
  }
}

/// User Message Bubble with glass style
class UserMessageBubble extends StatelessWidget {
  final String message;
  final String? timestamp;

  const UserMessageBubble({
    super.key,
    required this.message,
    this.timestamp,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            color: NexiColors.glassBase,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
              bottomLeft: Radius.circular(16),
              bottomRight: Radius.circular(4),
            ),
            border: Border.all(color: NexiColors.glassBorder),
          ),
          child: Text(
            message,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(height: 1.5),
          ),
        ),
        if (timestamp != null) ...[
          const SizedBox(height: 4),
          Text(
            timestamp!,
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
              color: NexiColors.textMuted,
            ),
          ),
        ],
      ],
    );
  }
}
