// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Ecommerce`
  String get title {
    return Intl.message(
      'Ecommerce',
      name: 'title',
      desc: '',
      args: [],
    );
  }

  /// `Recipe of the Day`
  String get recipeOfTheDay {
    return Intl.message(
      'Recipe of the Day',
      name: 'recipeOfTheDay',
      desc: '',
      args: [],
    );
  }

  /// `Mixed Veges Baked`
  String get mixedVegsBakedText {
    return Intl.message(
      'Mixed Veges Baked',
      name: 'mixedVegsBakedText',
      desc: '',
      args: [],
    );
  }

  /// `Plan`
  String get planText {
    return Intl.message(
      'Plan',
      name: 'planText',
      desc: '',
      args: [],
    );
  }

  /// `Cook Now`
  String get cookNowText {
    return Intl.message(
      'Cook Now',
      name: 'cookNowText',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get homeText {
    return Intl.message(
      'Home',
      name: 'homeText',
      desc: '',
      args: [],
    );
  }

  /// `Learn`
  String get learnText {
    return Intl.message(
      'Learn',
      name: 'learnText',
      desc: '',
      args: [],
    );
  }

  /// `Shop`
  String get shopText {
    return Intl.message(
      'Shop',
      name: 'shopText',
      desc: '',
      args: [],
    );
  }

  /// `Find the recipes`
  String get findRecipesText {
    return Intl.message(
      'Find the recipes',
      name: 'findRecipesText',
      desc: '',
      args: [],
    );
  }

  /// `based on what`
  String get basedOnText {
    return Intl.message(
      'based on what',
      name: 'basedOnText',
      desc: '',
      args: [],
    );
  }

  /// `YOU HAVE AT HOME`
  String get youHaveAtHomeText {
    return Intl.message(
      'YOU HAVE AT HOME',
      name: 'youHaveAtHomeText',
      desc: '',
      args: [],
    );
  }

  /// `Suggested Contents`
  String get suggestedContentText {
    return Intl.message(
      'Suggested Contents',
      name: 'suggestedContentText',
      desc: '',
      args: [],
    );
  }

  /// `View All`
  String get viewAllText {
    return Intl.message(
      'View All',
      name: 'viewAllText',
      desc: '',
      args: [],
    );
  }

  /// `Suggested Meal Plan`
  String get suggestedMealText {
    return Intl.message(
      'Suggested Meal Plan',
      name: 'suggestedMealText',
      desc: '',
      args: [],
    );
  }

  /// `Meal Planner`
  String get mealPlannerText {
    return Intl.message(
      'Meal Planner',
      name: 'mealPlannerText',
      desc: '',
      args: [],
    );
  }

  /// `Popular Recipes`
  String get popularText {
    return Intl.message(
      'Popular Recipes',
      name: 'popularText',
      desc: '',
      args: [],
    );
  }

  /// `All Recipies`
  String get allRecipiesText {
    return Intl.message(
      'All Recipies',
      name: 'allRecipiesText',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
