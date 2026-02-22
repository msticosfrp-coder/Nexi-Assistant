import 'package:flutter/material.dart';

import '../../core/constants/colors.dart';
import '../../core/constants/styles.dart';
import '../../core/widgets/status_indicator.dart';

class ContactsScreen extends StatelessWidget {
  const ContactsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: NexiColors.backgroundDark,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(NexiStyles.spaceM),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Contacts',
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: NexiColors.primary.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: NexiColors.primary.withOpacity(0.3),
                          ),
                        ),
                        child: const Icon(
                          Icons.hub,
                          color: NexiColors.primary,
                          size: 20,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: NexiStyles.spaceM),
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Search contacts...',
                      prefixIcon: const Icon(
                        Icons.search,
                        color: NexiColors.textMuted,
                      ),
                      filled: true,
                      fillColor: NexiColors.surfaceDark.withOpacity(0.5),
                      border: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(NexiStyles.radiusFull),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  const SizedBox(height: NexiStyles.spaceM),
                  // Segmented control
                  Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: NexiColors.surfaceDark.withOpacity(0.8),
                      borderRadius:
                          BorderRadius.circular(NexiStyles.radiusFull),
                      border: Border.all(
                        color: NexiColors.textMuted.withOpacity(0.3),
                      ),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: NexiStyles.spaceS),
                            decoration: BoxDecoration(
                              color: NexiColors.primary,
                              borderRadius:
                                  BorderRadius.circular(NexiStyles.radiusFull),
                            ),
                            child: FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text(
                                'Phone',
                                textAlign: TextAlign.center,
                                style: Theme.of(context)
                                    .textTheme
                                    .labelMedium
                                    ?.copyWith(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(
                              'Favorites',
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.labelMedium,
                            ),
                          ),
                        ),
                        Expanded(
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'CD-3M',
                                  style: Theme.of(context).textTheme.labelMedium,
                                ),
                                const SizedBox(width: 4),
                                const StatusIndicator(isOnline: true, size: 6),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: NexiStyles.spaceM),
                children: [
                  _ContactCard(
                    name: 'Marcus Thorne',
                    role: 'CD-3M System Administrator',
                    isOnline: true,
                    onChat: () {},
                    onCall: () {},
                    onEmail: () {},
                  ),
                  const _ContactCard(
                    name: 'Sarah Jenkins',
                    role: 'Family • Personal Device',
                    isOnline: false,
                  ),
                  const SizedBox(height: NexiStyles.spaceM),
                  Padding(
                    padding: const EdgeInsets.only(bottom: NexiStyles.spaceS),
                    child: Text(
                      'DEVICE CONTACTS (84)',
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                            letterSpacing: 2,
                          ),
                    ),
                  ),
                  const SizedBox(height: NexiStyles.spaceM),
                  ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.sync),
                    label: const Text('Sync with Phone'),
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
                  const SizedBox(height: NexiStyles.spaceXL),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ContactCard extends StatelessWidget {
  final String name;
  final String role;
  final bool isOnline;
  final VoidCallback? onChat;
  final VoidCallback? onCall;
  final VoidCallback? onEmail;

  const _ContactCard({
    required this.name,
    required this.role,
    this.isOnline = false,
    this.onChat,
    this.onCall,
    this.onEmail,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: NexiStyles.spaceS),
      padding: const EdgeInsets.all(NexiStyles.spaceM),
      decoration: BoxDecoration(
        color: NexiColors.surfaceDark.withOpacity(0.4),
        borderRadius: BorderRadius.circular(NexiStyles.radiusDefault),
        border: Border.all(
          color: NexiColors.textMuted.withOpacity(0.2),
        ),
      ),
      child: Row(
        children: [
          Stack(
            children: [
              const CircleAvatar(
                radius: 28,
                backgroundColor: NexiColors.primary,
                child: Icon(Icons.person, color: Colors.white, size: 32),
              ),
              if (isOnline)
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    width: 16,
                    height: 16,
                    decoration: BoxDecoration(
                      color: NexiColors.accentTeal,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: NexiColors.backgroundDark,
                        width: 2,
                      ),
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(width: NexiStyles.spaceM),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                Text(
                  role,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                const SizedBox(height: NexiStyles.spaceS),
                Row(
                  children: [
                    IconButton(
                      onPressed: onChat,
                      icon: Icon(
                        Icons.chat,
                        color: isOnline ? NexiColors.primary : NexiColors.textMuted,
                        size: 20,
                      ),
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                    ),
                    const SizedBox(width: NexiStyles.spaceM),
                    IconButton(
                      onPressed: onCall,
                      icon: Icon(
                        Icons.call,
                        color: isOnline ? NexiColors.primary : NexiColors.textMuted,
                        size: 20,
                      ),
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                    ),
                    const SizedBox(width: NexiStyles.spaceM),
                    IconButton(
                      onPressed: onEmail,
                      icon: Icon(
                        Icons.alternate_email,
                        color: isOnline ? NexiColors.primary : NexiColors.textMuted,
                        size: 20,
                      ),
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
