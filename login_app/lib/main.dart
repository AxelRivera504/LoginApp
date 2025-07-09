import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:login_app/config/router/app_router.dart';
import 'package:login_app/config/theme/app_theme.dart';

void main() {
   WidgetsFlutterBinding.ensureInitialized();

  //bloquear la orientación del dispositivo
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
      theme: AppTheme().getTheme(),
    );
  }
}
