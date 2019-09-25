import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// ignore_for_file: non_constant_identifier_names
// ignore_for_file: camel_case_types
// ignore_for_file: prefer_single_quotes

//This file is automatically generated. DO NOT EDIT, all your changes would be lost.

String getLang(Locale l) => l.countryCode != null && l.countryCode.isEmpty
    ? l.languageCode
    : l.toString();

class en extends S {
  const en();
}

class GeneratedLocalizationsDelegate
    extends LocalizationsDelegate<WidgetsLocalizations> {
  const GeneratedLocalizationsDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      const Locale("en", ""),
    ];
  }

  @override
  bool isSupported(Locale locale) => supportedLocales.contains(locale);

  @override
  Future<WidgetsLocalizations> load(Locale locale) {
    final String lang = getLang(locale);
    switch (lang) {
      case "en":
        return new SynchronousFuture<WidgetsLocalizations>(const en());

      default:
        return new SynchronousFuture<WidgetsLocalizations>(const S());
    }
  }

  LocaleResolutionCallback resolution({Locale fallback}) {
    return (Locale locale, Iterable<Locale> supported) {
      final Locale languageLocale = new Locale(locale.languageCode, "");
      if (supported.contains(locale))
        return locale;
      else if (supported.contains(languageLocale))
        return languageLocale;
      else {
        final Locale fallbackLocale = fallback ?? supported.first;
        return fallbackLocale;
      }
    };
  }

  @override
  bool shouldReload(GeneratedLocalizationsDelegate old) => false;
}

class S implements WidgetsLocalizations {
  static const GeneratedLocalizationsDelegate delegate =
      const GeneratedLocalizationsDelegate();

  const S();

  @override
  TextDirection get textDirection => TextDirection.ltr;

  static S of(BuildContext context) =>
      Localizations.of<S>(context, WidgetsLocalizations);
}
