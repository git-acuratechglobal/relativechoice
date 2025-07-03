import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:relative_choice/core/services/local_storage_service/local_storage_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/Theme/theme.dart';
import 'features/auth_feature/pages/splashscreen/splashScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  final prefs = await SharedPreferences.getInstance();
  runApp(ProviderScope(
      overrides: [sharedPreferencesProvider.overrideWithValue(prefs)],
      child:
          //   DevicePreview(
          //   enabled: !kReleaseMode,
          //   builder: (context) => MyApp(), // Wrap your app
          // ),
          MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final themeMode = ref.watch(themeModeProvider);
    return ScreenUtilInit(
        designSize: Size(375, 812),
        builder: (context, child) {
          return MaterialApp(
            title: 'Relative Choice',
            theme: Themes.lightTheme,
            // themeMode: themeMode,
            home: Splashscreen(),
            debugShowCheckedModeBanner: false,
          );
        });
  }
}
