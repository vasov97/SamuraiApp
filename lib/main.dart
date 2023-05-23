import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:samurai_app/cubit/download/download_cubit.dart';
import 'package:samurai_app/cubit/favorites/favorites_cubit.dart';
import 'package:samurai_app/cubit/samurai/samurai_cubit.dart';
import 'package:samurai_app/di/app_dependecies.dart';
import 'package:samurai_app/pages/welcome_page.dart';
import 'package:samurai_app/res/theme/app_colors.dart';

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
    return MultiBlocProvider(
      providers: AppDependencies.of(context).providers,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            scaffoldBackgroundColor: AppColors.blackColor,
            appBarTheme:
                const AppBarTheme(backgroundColor: AppColors.blackColor)),
        home: const WelcomePage(),
      ),
    );
  }
}
