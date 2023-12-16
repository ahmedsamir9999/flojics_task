import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'core/network/firebase_options.dart';
import 'core/shared preferences/shared.dart';
import 'movies/presentation/controller/home_provider.dart';
import 'movies/presentation/controller/login_provider.dart';
import 'movies/presentation/controller/movie_provider.dart';
import 'movies/presentation/controller/register_provider.dart';
import 'movies/presentation/screens/logIn_Screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
  WidgetsFlutterBinding.ensureInitialized();
  await MyCache.init();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => LoginProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => RegisterProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => HomeProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => MovieProvider(),
        ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) => MaterialApp(
          debugShowCheckedModeBanner: false,
          home: LoginScreen(),
          // home: HomeScreen(),
        ),
      ),
    );
  }
}
