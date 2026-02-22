import 'package:flutter/material.dart';
import '../constants/colors.dart';

/// Pulsing Status Indicator
/// Shows online/offline status with animation
class StatusIndicator extends StatefulWidget {
  final bool isOnline;
  final double size;
  final bool showLabel;
  final String? onlineLabel;
  final String? offlineLabel;

  const StatusIndicator({
    super.key,
    required this.isOnline,
    this.size = 8.0,
    this.showLabel = false,
    this.onlineLabel = 'Online',
    this.offlineLabel = 'Offline',
  });

  @override
  State<StatusIndicator> createState() => _StatusIndicatorState();
}

class _StatusIndicatorState extends State<StatusIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat();

    _animation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final color =
        widget.isOnline ? NexiColors.accentTeal : NexiColors.textMuted;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            return Container(
              width: widget.size,
              height: widget.size,
              decoration: BoxDecoration(
                color: color,
                shape: BoxShape.circle,
                boxShadow: widget.isOnline
                    ? [
                        BoxShadow(
                          color: color
                              .withOpacity(0.4 * (1 - _animation.value)),
                          blurRadius: 6 * _animation.value,
                          spreadRadius: 1 + (3 * _animation.value),
                        ),
                      ]
                    : null,
              ),
            );
          },
        ),
        if (widget.showLabel) ...[
          const SizedBox(width: 6),
          Text(
            widget.isOnline ? widget.onlineLabel! : widget.offlineLabel!,
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  color: color,
                  fontWeight: FontWeight.w600,
                ),
          ),
        ],
      ],
    );
  }
}

/// Typing Indicator
/// Three dots with staggered pulse animation
class TypingIndicator extends StatefulWidget {
  const TypingIndicator({super.key});

  @override
  State<TypingIndicator> createState() => _TypingIndicatorState();
}

class _TypingIndicatorState extends State<TypingIndicator>
    with TickerProviderStateMixin {
  late final List<AnimationController> _controllers;

  @override
  void initState() {
    super.initState();
    _controllers = List.generate(3, (index) {
      return AnimationController(
        duration: const Duration(milliseconds: 600),
        vsync: this,
      );
    });

    // Stagger the animations
    for (int i = 0; i < _controllers.length; i++) {
      Future.delayed(Duration(milliseconds: i * 200), () {
        if (mounted) {
          _controllers[i].repeat(reverse: true);
        }
      });
    }
  }

  @override
  void dispose() {
    for (final controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 32,
          height: 32,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: NexiColors.primary.withOpacity(0.3)),
            color: NexiColors.primary.withOpacity(0.1),
          ),
          child: const Icon(
            Icons.psychology,
            color: NexiColors.primary,
            size: 18,
          ),
        ),
        const SizedBox(width: 12),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            color: NexiColors.glassBase,
            borderRadius: BorderRadius.circular(24),
            border: Border.all(color: NexiColors.glassBorder),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              for (int i = 0; i < 3; i++) ...[
                AnimatedBuilder(
                  animation: _controllers[i],
                  builder: (context, child) {
                    return Container(
                      width: 6,
                      height: 6,
                      decoration: BoxDecoration(
                        color: NexiColors.accentTeal.withOpacity(
                          0.4 + (0.6 * _controllers[i].value),
                        ),
                        shape: BoxShape.circle,
                      ),
                    );
                  },
                ),
                if (i < 2) const SizedBox(width: 4),
              ],
              const SizedBox(width: 8),
              Text(
                'NEXI is thinking...',
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      color: NexiColors.textMuted,
                    ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

/// Connection Status Badge
/// Full badge with icon, label and pulse
class ConnectionStatusBadge extends StatelessWidget {
  final bool isConnected;
  final String label;

  const ConnectionStatusBadge({
    super.key,
    required this.isConnected,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: isConnected
            ? NexiColors.accentTeal.withOpacity(0.1)
            : NexiColors.textMuted.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isConnected
              ? NexiColors.accentTeal.withOpacity(0.2)
              : NexiColors.textMuted.withOpacity(0.2),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          StatusIndicator(
            isOnline: isConnected,
            size: 6,
          ),
          const SizedBox(width: 6),
          Text(
            label,
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  color: isConnected
                      ? NexiColors.accentTeal
                      : NexiColors.textMuted,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                ),
          ),
        ],
      ),
    );
  }
}
