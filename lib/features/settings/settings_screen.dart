import 'package:flutter/material.dart';

import '../../core/constants/colors.dart';
import '../../core/constants/styles.dart';
import '../../core/widgets/glass_card.dart';
import '../../core/widgets/status_indicator.dart' show ConnectionStatusBadge;

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: NexiColors.backgroundDark,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(NexiStyles.spaceM),
          children: [
            // Profile Header
            Row(
              children: [
                Stack(
                  children: [
                    Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: const LinearGradient(
                          colors: [NexiColors.primary, NexiColors.accentTeal],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: NexiColors.primary.withOpacity(0.3),
                            blurRadius: 12,
                          ),
                        ],
                      ),
                      padding: const EdgeInsets.all(4),
                      child: Container(
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: NexiColors.backgroundDark,
                        ),
                        child: const Icon(
                          Icons.person,
                          size: 40,
                          color: NexiColors.textSecondary,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        width: 24,
                        height: 24,
                        decoration: BoxDecoration(
                          color: NexiColors.accentTeal,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: NexiColors.backgroundDark,
                            width: 4,
                          ),
                        ),
                        child: const Icon(
                          Icons.bolt,
                          size: 12,
                          color: NexiColors.backgroundDark,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: NexiStyles.spaceM),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Milsan',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    Text(
                      'Arquitecto 3M',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: NexiColors.primary.withOpacity(0.7),
                          ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: NexiStyles.spaceL),
            // Connection Status Card
            Container(
              padding: const EdgeInsets.all(NexiStyles.spaceL),
              decoration: BoxDecoration(
                color: NexiColors.primary.withOpacity(0.1),
                borderRadius:
                    BorderRadius.circular(NexiStyles.radiusDefault),
                border: Border.all(
                  color: NexiColors.primary.withOpacity(0.2),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'BRAIN INFRASTRUCTURE',
                            style: Theme.of(context).textTheme.labelSmall?.copyWith(
                                  color: NexiColors.primary,
                                  letterSpacing: 2,
                                ),
                          ),
                          Text(
                            'OpenClaw-NX',
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                        ],
                      ),
                      const ConnectionStatusBadge(
                        isConnected: true,
                        label: 'ONLINE',
                      ),
                    ],
                  ),
                  const SizedBox(height: NexiStyles.spaceM),
                  Container(
                    padding: const EdgeInsets.all(NexiStyles.spaceM),
                    decoration: BoxDecoration(
                      color: NexiColors.backgroundDark.withOpacity(0.5),
                      borderRadius:
                          BorderRadius.circular(NexiStyles.radiusDefault),
                      border: Border.all(
                        color: Colors.white.withOpacity(0.05),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'vps-7721.nexi-cloud.io',
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                fontFamily: 'monospace',
                                color: NexiColors.primary,
                              ),
                        ),
                        Icon(
                          Icons.copy_all,
                          size: 18,
                          color: NexiColors.primary.withOpacity(0.6),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: NexiStyles.spaceXL),
            // Voice & Audio
            Text(
              'VOICE & AUDIO',
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    letterSpacing: 1,
                  ),
            ),
            const SizedBox(height: NexiStyles.spaceS),
            GlassCard(
              padding: EdgeInsets.zero,
              child: ListTile(
                leading: Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    color: NexiColors.primary.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: const Icon(
                    Icons.mic,
                    color: NexiColors.primary,
                    size: 18,
                  ),
                ),
                title: const Text('Wake Word'),
                subtitle: Text(
                  'Currently: "Hey NEXI"',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                trailing: const Icon(
                  Icons.chevron_right,
                  color: NexiColors.textMuted,
                ),
              ),
            ),
            const SizedBox(height: NexiStyles.spaceL),
            // System
            Text(
              'SYSTEM',
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    letterSpacing: 1,
                  ),
            ),
            const SizedBox(height: NexiStyles.spaceS),
            GlassCard(
              padding: const EdgeInsets.symmetric(
                horizontal: NexiStyles.spaceM,
                vertical: NexiStyles.spaceS,
              ),
              child: Row(
                children: [
                  Container(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                      color: NexiColors.info.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const Icon(
                      Icons.notifications,
                      color: NexiColors.info,
                      size: 18,
                    ),
                  ),
                  const SizedBox(width: NexiStyles.spaceM),
                  const Expanded(child: Text('Push Notifications')),
                  Switch(
                    value: true,
                    onChanged: (_) {},
                  ),
                ],
              ),
            ),
            const SizedBox(height: NexiStyles.spaceXL),
            // Footer links
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'Documentation',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
                const Text(
                  '•',
                  style: TextStyle(color: NexiColors.textMuted),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'Privacy Policy',
                    style: Theme.of(context).textTheme.bodySmall,
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
