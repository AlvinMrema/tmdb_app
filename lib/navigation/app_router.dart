import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tmdb_app/screens/movies_screen.dart';

class AppRouter {
  late final router = GoRouter(
    debugLogDiagnostics: true,
    // refreshListenable: appStateManager,
    initialLocation: '/movies', //'/login',
    routes: [
      GoRoute(
        name: 'movies',
        path: '/movies',
        builder: (context, state) => MoviesScreen(),
      ),
    ],
    errorPageBuilder: (context, state) {
      return MaterialPage(
        key: state.pageKey,
        child: Scaffold(
          body: Center(
            child: Text(
              state.error.toString(),
            ),
          ),
        ),
      );
    },
    // redirect: (context, state) {
    //   // log(state.fullPath ?? 'Hamna kitu'); // Was debugging from 'state.path'
    //   final loggedIn = appStateManager.isLoggedIn;
    //   final loggingIn =
    //       state.fullPath == '/login'; // state.subloc -> state.fullPath
    //   if (!loggedIn) return loggingIn ? null : '/login';

    //   final isOnBoardingComplete = appStateManager.isOnboardingComplete;
    //   final onboarding =
    //       state.fullPath == '/onboarding'; // state.subloc -> state.fullPath
    //   if (!isOnBoardingComplete) {
    //     return onboarding ? null : '/onboarding';
    //   }

    //   if (loggingIn || onboarding) return '/${FooderlichTab.explore}';
    //   return null;
    // },
  );
}
