import 'package:flutter/material.dart';

import '../../core/constants/colors.dart';
import '../../core/constants/styles.dart';
import '../../core/widgets/glass_card.dart';
import '../../core/widgets/status_indicator.dart';

class CommandsScreen extends StatelessWidget {
  const CommandsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: NexiColors.backgroundDark,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(NexiStyles.spaceM),
          children: [
            // Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'CD-3M Center',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    Text(
                      'OpenClaw-NX Linked',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: NexiColors.primary.withOpacity(0.8),
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                  ],
                ),
                const Stack(
                  children: [
                    CircleAvatar(
                      radius: 24,
                      backgroundColor: NexiColors.primary,
                      child: Icon(Icons.person, color: Colors.white),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: StatusIndicator(isOnline: true, size: 12),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: NexiStyles.spaceM),
            // Search
            TextField(
              decoration: InputDecoration(
                hintText: 'Search commands...',
                prefixIcon: const Icon(Icons.search, color: NexiColors.textMuted),
                filled: true,
                fillColor: NexiColors.surfaceDark.withOpacity(0.5),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(NexiStyles.radiusFull),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: NexiStyles.spaceL),
            // Command Grid
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              mainAxisSpacing: NexiStyles.spaceM,
              crossAxisSpacing: NexiStyles.spaceM,
              childAspectRatio: 1,
              children: const [
                _CommandCard(
                  icon: Icons.router,
                  title: 'Roturas NX',
                  subtitle: 'Synced 2m ago',
                  isActive: true,
                ),
                _CommandCard(
                  icon: Icons.account_balance_wallet,
                  title: 'Billing Dashboard',
                  subtitle: 'Updated 1h ago',
                ),
                _CommandCard(
                  icon: Icons.business,
                  title: 'Organizations',
                  subtitle: '12 Entities Active',
                ),
                _CommandCard(
                  icon: Icons.chat,
                  title: 'WhatsApp Proxy',
                  subtitle: 'Gateway Secure',
                  iconColor: NexiColors.success,
                ),
                _CommandCard(
                  icon: Icons.memory,
                  title: 'System Health',
                  subtitle: '42%',
                  showProgress: true,
                  progress: 0.42,
                ),
                _CommandCard(
                  icon: Icons.terminal,
                  title: 'System Logs',
                  subtitle: 'Streaming Live',
                  showBars: true,
                ),
              ],
            ),
            const SizedBox(height: NexiStyles.spaceL),
            // Recent Commands
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Recent Commands',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'View All',
                    style: TextStyle(
                      color: NexiColors.primary,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: NexiStyles.spaceS),
            GlassCard(
              padding: const EdgeInsets.all(NexiStyles.spaceM),
              child: Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: NexiColors.accentTeal.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Icon(
                      Icons.restart_alt,
                      color: NexiColors.accentTeal,
                      size: 20,
                    ),
                  ),
                  const SizedBox(width: NexiStyles.spaceM),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Rebooted Proxy',
                          style: Theme.of(context).textTheme.bodyMedium,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          'Gateway #091-Alpha',
                          style: Theme.of(context).textTheme.bodySmall,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                  Text(
                    '14:20',
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                ],
              ),
            ),
            const SizedBox(height: NexiStyles.spaceS),
            GlassCard(
              padding: const EdgeInsets.all(NexiStyles.spaceM),
              child: Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: NexiColors.primary.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Icon(
                      Icons.sync,
                      color: NexiColors.primary,
                      size: 20,
                    ),
                  ),
                  const SizedBox(width: NexiStyles.spaceM),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Sync Organizations',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        Text(
                          'Batch update successful',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                    ),
                  ),
                  Text(
                    '12:05',
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CommandCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final bool isActive;
  final Color? iconColor;
  final bool showProgress;
  final double? progress;
  final bool showBars;

  const _CommandCard({
    required this.icon,
    required this.title,
    required this.subtitle,
    this.isActive = false,
    this.iconColor,
    this.showProgress = false,
    this.progress,
    this.showBars = false,
  });

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      padding: const EdgeInsets.all(NexiStyles.spaceM),
      backgroundColor: isActive ? NexiColors.primary.withOpacity(0.15) : null,
      border: isActive
          ? Border.all(color: NexiColors.primary.withOpacity(0.3))
          : null,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: (iconColor ?? NexiColors.primary).withOpacity(0.2),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Icon(
                  icon,
                  color: iconColor ?? NexiColors.textSecondary,
                  size: 20,
                ),
              ),
              if (showProgress && progress != null)
                Text(
                  '${(progress! * 100).toInt()}%',
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        color: NexiColors.accentTeal,
                        fontWeight: FontWeight.bold,
                      ),
                )
              else if (showBars)
                const Row(
                  children: [
                    _Bar(height: 12),
                    SizedBox(width: 2),
                    _Bar(height: 20),
                    SizedBox(width: 2),
                    _Bar(height: 8),
                  ],
                )
              else if (!isActive)
                Container(
                  width: 8,
                  height: 8,
                  decoration: const BoxDecoration(
                    color: NexiColors.textMuted,
                    shape: BoxShape.circle,
                  ),
                )
              else
                const StatusIndicator(isOnline: true, size: 8),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
              ),
              if (showProgress && progress != null) ...[
                const SizedBox(height: 8),
                ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: LinearProgressIndicator(
                    value: progress,
                    backgroundColor: NexiColors.surfaceDark,
                    valueColor: const AlwaysStoppedAnimation(NexiColors.accentTeal),
                  ),
                ),
              ] else
                Text(
                  subtitle,
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        letterSpacing: 1,
                      ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}

class _Bar extends StatelessWidget {
  final double height;

  const _Bar({required this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 4,
      height: height,
      decoration: BoxDecoration(
        color: NexiColors.primary,
        borderRadius: BorderRadius.circular(2),
      ),
    );
  }
}
