import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:in_app_notification/in_app_notification.dart';
import 'package:portfolio_v2/screens/dashboard.dart';
import 'package:portfolio_v2/shared/text_view.dart';
import 'package:url_strategy/url_strategy.dart';

void main() {
  setPathUrlStrategy();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(1440, 877),
      builder: (context, child) {
        return InAppNotification(
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Tamunnorth Portfolio',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: const DashboardScreen(),
          ),
        );
      },
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: TextViewAlt(
            text: 'JAmes ',
            size: 300,
            // fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
