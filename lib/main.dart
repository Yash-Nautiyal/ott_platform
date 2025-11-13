import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ott_platform/core/theme/app_theme.dart' show buildTheme;
import 'package:ott_platform/core/theme/bloc/theme_bloc.dart';
import 'package:ott_platform/features/layout/presentation/pages/layout.dart';
import 'package:sizer/sizer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  PlatformDispatcher.instance.onPlatformConfigurationChanged = () {};
  final themeBloc = await ThemeBloc.create();
  runApp(
    Sizer(
      builder: (context, orientation, deviceType) {
        return MultiBlocProvider(
          providers: [BlocProvider.value(value: themeBloc)],
          child: const MyApp(),
        );
      },
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder:
          (context, state) => AnimatedTheme(
            data: buildTheme(
              preset: state.preset,
              brightness: state.brightness,
            ),
            duration: const Duration(milliseconds: 100),
            child: MaterialApp(
              title: 'OTT Platform',
              debugShowCheckedModeBanner: false,
              theme: state.themeData,

              home: const Layout(), // your root screen
            ),
          ),
    );
  }
}
