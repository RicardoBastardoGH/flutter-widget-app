import 'package:go_router/go_router.dart';
import 'package:widgets_app/presentation/screen/counter/counter_screen.dart';

import '../../../presentation/screen/screens.dart';


// GoRouter configuration
final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: HomeScreen.routeName,
      builder: (context, state) => HomeScreen(),
    ),
    GoRoute(
      path: '/buttons',
      name: ButtonsScreen.routeName,
      builder: (context, state) => ButtonsScreen(),
    ),
    GoRoute(
      path: '/cards',
      name: CardsScreen.routeName,
      builder: (context, state) => CardsScreen(),
    ),
    GoRoute(
      path: '/progress',
      name: ProgressScreen.routeName,
      builder: (context, state) => ProgressScreen(),
    ),
    GoRoute(
      path: '/snackbars',
      name: SnackbarScreen.routeName,
      builder: (context, state) => SnackbarScreen(),
    ),
    GoRoute(
      path: '/animated',
      name: AnimatedScreen.routeName,
      builder: (context, state) => AnimatedScreen(),
    ),
    GoRoute(
      path: '/ui-controls',
      name: UiControlScreen.routeName,
      builder: (context, state) => UiControlScreen(),
    ),
    GoRoute(
      path: '/tutorial',
      name: AppTutorialScreen.routeName,
      builder: (context, state) => AppTutorialScreen(),
    ),
    GoRoute(
      path: '/infinite-scroll',
      name: InfiniteScroll.routeName,
      builder: (context, state) => InfiniteScroll(),
    ),
    GoRoute(
      path: '/counter-river',
      name: CounterScreen.routeName,
      builder: (context, state) => CounterScreen(),
    ),
    GoRoute(
      path: '/theme-changer',
      name: ThemeChangerScreen.routeName,
      builder: (context, state) => ThemeChangerScreen(),
    ),
  ],
);