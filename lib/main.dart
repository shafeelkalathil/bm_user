import 'package:bm_user/features/home/controller/home_controller.dart';
import 'package:bm_user/features/home/views/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'core/providers/location_provider.dart';
import 'core/theme/theme.dart';
import 'features/splash/views/splash_screen.dart';

late SharedPreferences storage;
Future<void> main() async {
  runApp(const MyApp());
  storage = await SharedPreferences.getInstance();
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LocationProvider()),
        // Add other providers here
      ],
      child: ProviderScope(
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          home: SplashScreen(),
          builder: FToastBuilder(),
        ),
      ),
    );
  }
}
