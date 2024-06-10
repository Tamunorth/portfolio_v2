import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:in_app_notification/in_app_notification.dart';
import 'package:portfolio_v2/screens/dashboard.dart';
import 'package:portfolio_v2/screens/streaming_page.dart';
import 'package:portfolio_v2/shared/text_view.dart';
import 'package:url_strategy/url_strategy.dart';

void main() {
  setPathUrlStrategy();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

/// The route configuration.
final GoRouter _router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const DashboardScreen();
      },
      // routes: <RouteBase>[],
    ),
    GoRoute(
      path: '/stream',
      builder: (BuildContext context, GoRouterState state) {
        return const StreamingPage();
      },
    ),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(1440, 877),
      builder: (context, child) {
        return InAppNotification(
          child: MaterialApp.router(
            debugShowCheckedModeBanner: false,
            title: 'Tamunorth Portfolio',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            routerConfig: _router,
            // home: const DashboardScreen(),
          ),
        );
      },
    );
  }
}
