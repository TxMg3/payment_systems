import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:payment_system/features/auth/presentation/login_screen.dart';
import 'package:payment_system/features/auth/presentation/registration_screen.dart';
import 'package:payment_system/features/auth/presentation/password_recovery_screen.dart';
import 'package:payment_system/features/auth/presentation/security_confirmation_screen.dart';
import 'package:payment_system/features/home/presentation/home_screen.dart';
import 'package:payment_system/features/home/presentation/updated_home_screen.dart';
import 'package:payment_system/features/home/presentation/add_card_screen.dart';
import 'package:payment_system/features/navigation/presentation/main_nav_scaffold.dart';
import 'package:payment_system/features/payments/presentation/payments_screen.dart';
import 'package:payment_system/features/payments/presentation/amount_entry_screen.dart';
import 'package:payment_system/features/payments/presentation/payment_receipt_screen.dart';
import 'package:payment_system/features/payments/presentation/utility_payments_screen.dart';
import 'package:payment_system/features/monitoring/presentation/payment_history_screen.dart';
import 'package:payment_system/features/profile/presentation/profile_screen.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _sectionANavigatorKey = GlobalKey<NavigatorState>();
final _sectionBNavigatorKey = GlobalKey<NavigatorState>();
final _sectionCNavigatorKey = GlobalKey<NavigatorState>();
final _sectionDNavigatorKey = GlobalKey<NavigatorState>();

final appRouter = GoRouter(
  initialLocation: '/login',
  navigatorKey: _rootNavigatorKey,
  routes: [
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: '/register',
      builder: (context, state) => const RegistrationScreen(),
    ),
    GoRoute(
      path: '/recovery',
      builder: (context, state) => const PasswordRecoveryScreen(),
    ),
    GoRoute(
      path: '/confirm',
      builder: (context, state) => const SecurityConfirmationScreen(),
    ),
    GoRoute(
      path: '/receipt',
      builder: (context, state) => const PaymentReceiptScreen(),
    ),
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return MainNavScaffold(navigationShell: navigationShell);
      },
      branches: [
        StatefulShellBranch(
          navigatorKey: _sectionANavigatorKey,
          routes: [
            GoRoute(
              path: '/',
              builder: (context, state) => const UpdatedHomeScreen(),
              routes: [
                GoRoute(
                  path: 'v1',
                  builder: (context, state) => const HomeScreen(),
                ),
                GoRoute(
                  path: 'add-card',
                  builder: (context, state) => const AddCardScreen(),
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _sectionBNavigatorKey,
          routes: [
            GoRoute(
              path: '/payments',
              builder: (context, state) => const PaymentsScreen(),
              routes: [
                GoRoute(
                  path: 'amount',
                  builder: (context, state) => const AmountEntryScreen(),
                ),
                GoRoute(
                  path: 'utility',
                  builder: (context, state) => const UtilityPaymentsScreen(),
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _sectionCNavigatorKey,
          routes: [
            GoRoute(
              path: '/monitoring',
              builder: (context, state) => const PaymentHistoryScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _sectionDNavigatorKey,
          routes: [
            GoRoute(
              path: '/profile',
              builder: (context, state) => const ProfileScreen(),
            ),
          ],
        ),
      ],
    ),
  ],
);
