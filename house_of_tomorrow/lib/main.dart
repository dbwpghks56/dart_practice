import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:house_of_tomorrow/src/service/lang_service.dart';
import 'package:house_of_tomorrow/src/service/theme_service.dart';
import 'package:house_of_tomorrow/theme/res/layout.dart';
import 'package:house_of_tomorrow/util/lang/generated/l10n.dart';
import 'package:house_of_tomorrow/util/route_path.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final themeDatas = ref.watch(themeProvider);

        return MaterialApp(
          navigatorKey: navigatorKey,
          builder: (context, child) {
            return Overlay(
              initialEntries: [
                OverlayEntry(
                  builder: (context) => child!,
                ),
              ],
            );
          },
          localizationsDelegates: const [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: S.delegate.supportedLocales,
          debugShowCheckedModeBanner: false,
          locale: ref.watch(langProvider),
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
            bottomSheetTheme: const BottomSheetThemeData(
              backgroundColor: Colors.transparent,
              constraints: BoxConstraints(
                maxWidth: Breakpoints.bottomSheet,
              ),
            ),
          ),
          initialRoute: RoutePath.shopping,
          onGenerateRoute: RoutePath.onGenerateRoute,
        );
      },
    );
  }
}
