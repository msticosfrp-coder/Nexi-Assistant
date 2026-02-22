import 'package:flutter/material.dart';

import '../../core/constants/colors.dart';
import '../../core/constants/styles.dart';
import '../../core/widgets/glass_card.dart';

class WorkflowsScreen extends StatelessWidget {
  const WorkflowsScreen({super.key});

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
                      'NEXI Workflows',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Container(
                          width: 8,
                          height: 8,
                          decoration: const BoxDecoration(
                            color: NexiColors.success,
                            shape: BoxShape.circle,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'OpenClaw-NX Connected',
                          style: Theme.of(context).textTheme.labelSmall?.copyWith(
                                letterSpacing: 1,
                              ),
                        ),
                      ],
                    ),
                  ],
                ),
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: NexiColors.glassBase,
                    borderRadius: BorderRadius.circular(24),
                    border: Border.all(
                      color: NexiColors.primary.withOpacity(0.2),
                    ),
                  ),
                  child: const Icon(
                    Icons.dns,
                    color: NexiColors.primary,
                    size: 24,
                  ),
                ),
              ],
            ),
            const SizedBox(height: NexiStyles.spaceL),
            // Active Workflow Card
            GlassCard(
              padding: const EdgeInsets.all(NexiStyles.spaceM),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8,
                                    vertical: 4,
                                  ),
                                  decoration: BoxDecoration(
                                    color: NexiColors.primary.withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(
                                      color: NexiColors.primary.withOpacity(0.2),
                                    ),
                                  ),
                                  child: Text(
                                    'TIME: 08:00',
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelSmall
                                        ?.copyWith(
                                          color: NexiColors.primary,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8,
                                    vertical: 4,
                                  ),
                                  decoration: BoxDecoration(
                                    color: NexiColors.success.withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(
                                      color: NexiColors.success.withOpacity(0.2),
                                    ),
                                  ),
                                  child: Text(
                                    'DAILY',
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelSmall
                                        ?.copyWith(
                                          color: NexiColors.success,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Send daily roturas report',
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            Text(
                              'Target: WhatsApp Operations',
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ],
                        ),
                      ),
                      Switch(
                        value: true,
                        onChanged: (_) {},
                      ),
                    ],
                  ),
                  const Divider(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.history,
                            size: 16,
                            color: NexiColors.textMuted,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            'Last run: 2h ago',
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ],
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Row(
                          children: [
                            Text(
                              'LOGS',
                              style: TextStyle(
                                color: NexiColors.primary,
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(width: 4),
                            Icon(
                              Icons.chevron_right,
                              color: NexiColors.primary,
                              size: 16,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: NexiStyles.spaceM),
            // Analytics Card
            GlassCard(
              padding: const EdgeInsets.all(NexiStyles.spaceL),
              backgroundColor: NexiColors.primary.withOpacity(0.1),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'VPS ANALYTICS',
                          style: Theme.of(context).textTheme.labelSmall?.copyWith(
                                color: NexiColors.primary,
                                letterSpacing: 2,
                              ),
                        ),
                        FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            '248',
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                        ),
                        Text(
                          'Total tasks this month',
                          style: Theme.of(context).textTheme.bodySmall,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 64,
                    height: 64,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        const CircularProgressIndicator(
                          value: 0.75,
                          strokeWidth: 4,
                          backgroundColor: NexiColors.surfaceDark,
                          valueColor: AlwaysStoppedAnimation(NexiColors.primary),
                        ),
                        Text(
                          '75%',
                          style: Theme.of(context).textTheme.labelSmall?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: NexiStyles.spaceL),
            // Add buttons
            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.add, size: 20),
                    label: const Text('Add Automation'),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        vertical: NexiStyles.spaceM,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(NexiStyles.radiusFull),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: NexiStyles.spaceM),
                Container(
                  width: 56,
                  height: 56,
                  decoration: BoxDecoration(
                    color: NexiColors.glassBase,
                    borderRadius: BorderRadius.circular(28),
                    border: Border.all(color: NexiColors.primary),
                  ),
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.bolt, color: NexiColors.primary),
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
