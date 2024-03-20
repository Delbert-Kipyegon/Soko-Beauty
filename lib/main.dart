import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:soko_beauty/config/theme/themes/dark.dart';
import 'package:soko_beauty/config/theme/themes/light.dart';
import 'home/views/screens/splashscreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lightMode,
      darkTheme: darkMode,
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
