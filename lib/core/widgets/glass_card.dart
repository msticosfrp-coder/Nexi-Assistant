import 'dart:ui';
import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../constants/styles.dart';

/// Glass Card Widget with BackdropFilter blur
class GlassCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final double? width;
  final double? height;
  final BorderRadius? borderRadius;
  final Color? backgroundColor;
  final Border? border;
  final double? blur;

  const GlassCard({
    super.key,
    required this.child,
    this.padding,
    this.margin,
    this.width,
    this.height,
    this.borderRadius,
    this.backgroundColor,
    this.border,
    this.blur,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: borderRadius ?? BorderRadius.circular(NexiStyles.radiusDefault),
        boxShadow: [NexiStyles.shadowCard],
      ),
      child: ClipRRect(
        borderRadius: borderRadius ?? BorderRadius.circular(NexiStyles.radiusDefault),
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: blur ?? NexiStyles.glassBlur,
            sigmaY: blur ?? NexiStyles.glassBlur,
          ),
          child: Container(
            padding: padding ?? const EdgeInsets.all(NexiStyles.spaceM),
            decoration: BoxDecoration(
              color: backgroundColor ?? NexiColors.glassBase,
              borderRadius: borderRadius ?? BorderRadius.circular(NexiStyles.radiusDefault),
              border: border ?? Border.all(color: NexiColors.glassBorder, width: 1),
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}

/// Glass Button with icon support
class GlassButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Widget? child;
  final IconData? icon;
  final String? label;
  final double? size;

  const GlassButton({
    super.key,
    this.onPressed,
    this.child,
    this.icon,
    this.label,
    this.size,
  });

  @override
  Widget build(BuildContext context) {
    final buttonSize = size ?? 48.0;
    
    return GestureDetector(
      onTap: onPressed,
      child: GlassCard(
        width: label != null ? null : buttonSize,
        height: label != null ? null : buttonSize,
        padding: label != null 
          ? const EdgeInsets.symmetric(horizontal: 16, vertical: 8)
          : EdgeInsets.zero,
        borderRadius: BorderRadius.circular(buttonSize / 2),
        child: child ?? (label != null 
          ? Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (icon != null) ...[
                  Icon(icon, color: NexiColors.textSecondary, size: 20),
                  const SizedBox(width: 8),
                ],
                Text(
                  label!,
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            )
          : Icon(icon, color: NexiColors.textSecondary, size: buttonSize * 0.5)),
      ),
    );
  }
}

/// Glass Input Bar with leading/trailing widgets
class GlassInput extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final Widget? leading;
  final Widget? trailing;
  final VoidCallback? onSubmit;

  const GlassInput({
    super.key,
    required this.controller,
    required this.hintText,
    this.leading,
    this.trailing,
    this.onSubmit,
  });

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      padding: const EdgeInsets.symmetric(
        horizontal: NexiStyles.spaceS,
        vertical: 6,
      ),
      borderRadius: BorderRadius.circular(NexiStyles.radiusFull),
      child: Row(
        children: [
          if (leading != null) leading!,
          Expanded(
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                hintText: hintText,
                border: InputBorder.none,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: NexiStyles.spaceS,
                  vertical: NexiStyles.spaceS,
                ),
              ),
              style: const TextStyle(
                color: NexiColors.textPrimary,
                fontSize: 14,
              ),
              onSubmitted: (_) => onSubmit?.call(),
            ),
          ),
          if (trailing != null) trailing!,
        ],
      ),
    );
  }
}
