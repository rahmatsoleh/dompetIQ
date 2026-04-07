import 'package:dompet_iq/pages/login_page.dart';
import 'package:dompet_iq/pages/onboarding_page.dart';
import 'package:go_router/go_router.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: "/",
  routes: [
    GoRoute(
      path: "/",
      name: OnboardingPage.routeName,
      builder: (context, state) => const OnboardingPage(),
    ),
    GoRoute(
      path: "/login",
      name: LoginPage.routeName,
      builder: (context, state) => const LoginPage(),
    ),
  ],
);
