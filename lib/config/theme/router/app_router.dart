import 'package:go_router/go_router.dart';

import '../../../presentation/screen/screens.dart';


// GoRouter configuration
final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: 'home_screen',
      builder: (context, state) => HomeScreen(),
    ),
    GoRoute(
      path: '/buttons',
      name: 'buttons_screen',
      builder: (context, state) => ButtonsScreen(),
    ),
    GoRoute(
      path: '/cards',
      name: 'cards_screen',
      builder: (context, state) => CardsScreen(),
    ),
  ],
);