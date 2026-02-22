import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'router.dart';
import 'theme.dart';

class NexiAssistantApp extends StatelessWidget {
  const NexiAssistantApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Force dark mode and system UI overlay
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarColor: Color(0xFF121121),
        systemNavigationBarIconBrightness: Brightness.light,
      ),
    );

    return MaterialApp.router(
      title: 'NEXI Assistant',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      theme: NexiTheme.darkTheme,
      darkTheme: NexiTheme.darkTheme,
      routerConfig: AppRouter.router,
      builder: (context, child) {
        return ScrollConfiguration(
          behavior: const _CustomScrollBehavior(),
          child: child!,
        );
      },
    );
  }
}

/// Custom scroll behavior to hide scrollbars and improve UX
class _CustomScrollBehavior extends ScrollBehavior {
  const _CustomScrollBehavior();

  @override
  ScrollPhysics getScrollPhysics(BuildContext context) {
    return const BouncingScrollPhysics(
      parent: AlwaysScrollableScrollPhysics(),
    );
  }

  @override
  Widget buildScrollbar(
    BuildContext context,
    Widget child,
    ScrollableDetails details,
  ) {
    return child;
  }
}
