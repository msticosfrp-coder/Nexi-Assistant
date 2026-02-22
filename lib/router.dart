import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'core/constants/colors.dart';
import 'features/commands/commands_screen.dart';
import 'features/contacts/contacts_screen.dart';
import 'features/home/home_screen.dart';
import 'features/settings/settings_screen.dart';
import 'features/workflows/workflows_screen.dart';

class AppRouter {
  AppRouter._();

  static final _rootNavigatorKey = GlobalKey<NavigatorState>();
  static final _shellNavigatorKey = GlobalKey<NavigatorState>();

  static GoRouter get router => _router;

  static final _router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/',
    routes: [
      ShellRoute(
        navigatorKey: _shellNavigatorKey,
        builder: (context, state, child) => ScaffoldWithNav(child: child),
        routes: [
          GoRoute(
            path: '/',
            builder: (context, state) => const HomeScreen(),
          ),
          GoRoute(
            path: '/commands',
            builder: (context, state) => const CommandsScreen(),
          ),
          GoRoute(
            path: '/contacts',
            builder: (context, state) => const ContactsScreen(),
          ),
          GoRoute(
            path: '/workflows',
            builder: (context, state) => const WorkflowsScreen(),
          ),
          GoRoute(
            path: '/settings',
            builder: (context, state) => const SettingsScreen(),
          ),
        ],
      ),
    ],
  );
}

/// Scaffold with bottom navigation and center FAB
class ScaffoldWithNav extends StatelessWidget {
  final Widget child;

  const ScaffoldWithNav({super.key, required this.child});

  int _getCurrentIndex(String location) {
    final path = location.split('?').first;
    switch (path) {
      case '/':
        return 0;
      case '/commands':
        return 1;
      case '/contacts':
        return 2;
      case '/workflows':
        return 3;
      case '/settings':
        return 4;
      default:
        return 0;
    }
  }

  void _onItemTapped(BuildContext context, int index) {
    switch (index) {
      case 0:
        context.go('/');
      case 1:
        context.go('/commands');
      case 2:
        context.go('/contacts');
      case 3:
        context.go('/workflows');
      case 4:
        context.go('/settings');
    }
  }

  @override
  Widget build(BuildContext context) {
    final location = GoRouterState.of(context).matchedLocation;
    final currentIndex = _getCurrentIndex(location);

    return Scaffold(
      body: child,
      floatingActionButton: SizedBox(
        width: 56,
        height: 56,
        child: FloatingActionButton(
          onPressed: () {
            // Quick action - voice command
          },
          backgroundColor: NexiColors.primary,
          elevation: 8,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: const Icon(Icons.mic, color: Colors.white),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 8,
        height: 72, // Increased from 64
        color: NexiColors.cardDark.withOpacity(0.95),
        padding: EdgeInsets.zero,
        child: Row(
          children: [
            _NavItem(
              icon: Icons.chat_bubble,
              label: 'Chat',
              isSelected: currentIndex == 0,
              onTap: () => _onItemTapped(context, 0),
            ),
            _NavItem(
              icon: Icons.grid_view,
              label: 'Commands',
              isSelected: currentIndex == 1,
              onTap: () => _onItemTapped(context, 1),
            ),
            const SizedBox(width: 64), // Space for FAB
            _NavItem(
              icon: Icons.group,
              label: 'Contacts',
              isSelected: currentIndex == 2,
              onTap: () => _onItemTapped(context, 2),
            ),
            _NavItem(
              icon: Icons.bolt,
              label: 'Workflows',
              isSelected: currentIndex == 3,
              onTap: () => _onItemTapped(context, 3),
            ),
            _NavItem(
              icon: Icons.settings,
              label: 'Settings',
              isSelected: currentIndex == 4,
              onTap: () => _onItemTapped(context, 4),
            ),
          ],
        ),
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _NavItem({
    required this.icon,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final color = isSelected ? NexiColors.primary : NexiColors.textSecondary;

    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: color, size: 20),
              const SizedBox(height: 2),
              FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  label,
                  style: TextStyle(
                    color: color,
                    fontSize: 10,
                    fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
