import 'package:easy_localization/easy_localization.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/core/theme/theme_palette.dart';
import 'package:weather_app/route/app_routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
      supportedLocales: const <Locale>[Locale('tr')],
      path: 'assets/translations',
      fallbackLocale: Locale('tr'),
      child: ProviderScope(child: const MyApp()),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return MaterialApp.router(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      routerConfig: appRoutes,
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: FlexThemeData.light(
        colors: myLightColors, // Light renk paleti
        subThemesData: const FlexSubThemesData(
          elevatedButtonRadius: 12, // Buton köşe yuvarlatma
          inputDecoratorRadius: 12, // Input köşe yuvarlatma
          useMaterial3Typography: true, // Material 3 tipografi
        ),
      ),

      // Dark tema
      darkTheme: FlexThemeData.dark(
        colors: myDarkColors, // Dark renk paleti
        subThemesData: const FlexSubThemesData(
          elevatedButtonRadius: 12,
          inputDecoratorRadius: 12,
          useMaterial3Typography: true,
        ),
      ),
     /*  themeMode: ref.watch(themeModeControllerProvider), */
    );
  }
}
