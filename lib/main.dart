import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:my_portfolio_app/home_scree.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en', 'US'), Locale('ru', 'RU')],
      path: 'translations',
      fallbackLocale: const Locale('en', 'US'),
      assetLoader: const RootBundleAssetLoader(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      title: 'Nursultan',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        fontFamily: 'SF-Pro-Display',
      ),
      home: const HomeScreen(),
    );
  }
}
