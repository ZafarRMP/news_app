import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:news_app/domain/provider/locale_provider/locale_provider.dart';
import 'package:news_app/domain/provider/news_provider/news_provider.dart';
import 'package:news_app/generated/l10n.dart';
import 'package:news_app/l10n/l10n.dart';
import 'package:news_app/ui/pages/home_page/home_page.dart';
import 'package:provider/provider.dart';

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => NewsProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => LocaleProvider(),
        ),
      ],
      child: const AppContent(),
    );
  }
}

class AppContent extends StatelessWidget {
  const AppContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final localeModel = Provider.of<LocaleProvider>(context);

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        systemNavigationBarColor: Color(0xff003366),
      ),
      child: MaterialApp(
        locale: localeModel.locale,
        supportedLocales: L10n.all,
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        theme: ThemeData(useMaterial3: true),
        home: const HomePage(),
      ),
    );
  }
}
