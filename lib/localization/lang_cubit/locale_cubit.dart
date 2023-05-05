import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../language_cache_helper.dart';

part 'locale_state.dart';

class LocaleCubit extends Cubit<ChangeLocaleState> {
  LocaleCubit() : super(ChangeLocaleState(locale: const Locale('en')));
  Future<void> getSavedLanguage() async {
    final String cachedLangaugeCode =
        await LanguageCacheHelper().getCachedLanguageCode();
    emit(ChangeLocaleState(locale: Locale(cachedLangaugeCode)));
  }

  Future<void> changeLanguage(String langaugeCode) async {
    await LanguageCacheHelper().cacheLanguageCode(langaugeCode);
    emit(ChangeLocaleState(locale: Locale(langaugeCode)));
  }
}
