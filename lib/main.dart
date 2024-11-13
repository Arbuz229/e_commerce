import 'package:e_commerce_setup/config/theme.dart';
import 'package:e_commerce_setup/ui/my_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart';
import 'block/Font_size_block.dart';
import 'block/locale_bloc.dart';
import 'block/theme_bloc.dart';
import 'generated/l10n.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => LocaleBloc()),
        BlocProvider(create: (_) => ThemeBloc()),
        BlocProvider(create: (_) => FontSizeBloc()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocaleBloc, LocaleState>(
      builder: (context, localeState) {
        return BlocBuilder<ThemeBloc, ThemeState>(
          builder: (context, themeState) {
            return BlocBuilder<FontSizeBloc, FontSizeState>(
              builder: (context, fontSizeState) {
                return MaterialApp(
                  debugShowCheckedModeBanner: false,
                  theme: lightTheme.copyWith(
                    textTheme: lightTheme.textTheme.copyWith(
                      bodyLarge: TextStyle(
                        fontSize: fontSizeState.fontSize,
                      ),
                    ),
                  ),
                  darkTheme: darkTheme.copyWith(
                    textTheme: darkTheme.textTheme.copyWith(
                      bodyLarge: TextStyle(
                        fontSize: fontSizeState.fontSize,
                      ),
                    ),
                  ),
                  themeMode: themeState.isDarkMode ? ThemeMode.dark : ThemeMode.light,
                  locale: localeState.locale,
                  supportedLocales: const [
                    Locale('en', ''), // English
                    Locale('ru', ''), // Russian
                  ],
                  localizationsDelegates: const [
                    S.delegate,
                    GlobalMaterialLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate,
                    GlobalCupertinoLocalizations.delegate,
                  ],
                  home: MyHomePage(),
                );
              },
            );
          },
        );
      },
    );
  }
}


class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            MyText(
              text: S.of(context).message, // Локализированное сообщение
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                context.read<LocaleBloc>().add(ToggleLocale());
              },
              child: MyText(
                text: 'Toggle Language',
              ),
            ),
            ElevatedButton(
              onPressed: () {
                context.read<ThemeBloc>().add(ToggleTheme());
              },
              child: MyText(text: 'Переключить тему'),
            ),
            ElevatedButton(
              onPressed: () {
                context.read<FontSizeBloc>().add(ToggleFontSize());
              },
              child: MyText(text: 'Change font size'),
            ),
          ],
        ),
      ),
    );
  }
}

