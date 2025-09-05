import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:relative_choice/core/services/local_storage_service/local_storage_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/Theme/theme.dart';
import 'features/auth_feature/pages/splashscreen/splashScreen.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await ScreenUtil.ensureScreenSize();
  final prefs = await SharedPreferences.getInstance();
  // SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
  //   statusBarIconBrightness: Brightness.dark,
  //   statusBarBrightness: Brightness.dark,
  //   statusBarColor: Color(0xff3C0203),
  //   systemNavigationBarColor: Color(0xff3C0203),
  //   systemNavigationBarIconBrightness: Brightness.light,
  // ));
  // SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  // runApp( DevicePreview(
  //   enabled: !kReleaseMode,
  //   builder: (context) => ProviderScope(
  //       overrides: [sharedPreferencesProvider.overrideWithValue(prefs)],
  //       child: const MyApp()), // Wrap your app
  // ),);
  runApp(ProviderScope(
      overrides: [sharedPreferencesProvider.overrideWithValue(prefs)],
      child: const MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final themeMode = ref.watch(themeModeProvider);

    return ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (context, child) {
          return GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: MaterialApp(
              builder: DevicePreview.appBuilder,
              navigatorKey: navigatorKey,
              title: 'Relative Choice',
              theme: Themes.lightTheme,
              // themeMode: themeMode,
              home: const Splashscreen(),
              debugShowCheckedModeBanner: false,
            ),
          );
        });
  }
}
