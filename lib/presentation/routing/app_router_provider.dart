import 'package:go_router/go_router.dart';
import 'package:riverpod/riverpod.dart';

import 'package:expira/screens/analytics_screen.dart';
import 'package:expira/screens/barcode_scanner_screen.dart';
import 'package:expira/screens/friends_screen.dart';
import 'package:expira/screens/home_screen.dart';
import 'package:expira/screens/inventory_screen.dart';
import 'package:expira/screens/item_form_screen.dart';
import 'package:expira/screens/notification_center_screen.dart';
import 'package:expira/screens/product_review_screen.dart';
import 'package:expira/screens/settings_screen.dart';

/// Manual router provider to avoid riverpod_generator analyzer bug with go_router inline builders.
final appRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        name: 'home',
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: '/inventory',
        name: 'inventory',
        builder: (context, state) => const InventoryScreen(),
      ),
      GoRoute(
        path: '/analytics',
        name: 'analytics',
        builder: (context, state) => const AnalyticsScreen(),
      ),
      GoRoute(
        path: '/friends',
        name: 'friends',
        builder: (context, state) => const FriendsScreen(),
      ),
      GoRoute(
        path: '/notifications',
        name: 'notifications',
        builder: (context, state) => const NotificationCenterScreen(),
      ),
      GoRoute(
        path: '/settings',
        name: 'settings',
        builder: (context, state) => const SettingsScreen(),
      ),
      GoRoute(
        path: '/scan',
        name: 'scan',
        builder: (context, state) => const BarcodeScannerScreen(),
      ),
      GoRoute(
        path: '/item/new',
        name: 'item-form-new',
        builder: (context, state) => const ItemFormScreen(),
      ),
      GoRoute(
        path: '/item/:id',
        name: 'item-form-edit',
        builder: (context, state) {
          final id = state.pathParameters['id']!;
          return ItemFormScreen(itemId: id);
        },
      ),
      GoRoute(
        path: '/product-review/:barcode',
        name: 'product-review',
        builder: (context, state) {
          final barcode = state.pathParameters['barcode']!;
          return ProductReviewScreen(barcode: barcode);
        },
      ),
    ],
    errorBuilder: (context, state) => Scaffold(
      body: Center(
        child: Text('Page not found: ${state.uri}'),
      ),
    ),
  );
});