import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:house_of_tomorrow/src/service/theme_service.dart';
import 'package:house_of_tomorrow/src/view/shopping/shopping_view.dart';
import 'package:house_of_tomorrow/util/lang/generated/l10n.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: Consumer(
        builder: (context, ref, child) {
          final themeDatas = ref.watch(themeProvider);

          return MaterialApp(
            localizationsDelegates: const [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              /// Scaffold
              scaffoldBackgroundColor: themeDatas.color.surface,

              /// AppBar
              appBarTheme: AppBarTheme(
                backgroundColor: themeDatas.color.surface,
                elevation: 0,
                centerTitle: false,
                iconTheme: IconThemeData(
                  color: themeDatas.color.text,
                ),
                titleTextStyle: themeDatas.typo.headline2.copyWith(
                  color: themeDatas.color.text,
                ),
              ),
            ),
            home: const ShoppingView(),
          );
        },
      ),
    );
  }
}
