import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

abstract class LocaleEvent {}

class ToggleLocale extends LocaleEvent {}

class LocaleState {
  final Locale locale;
  LocaleState({required this.locale});
}

class LocaleBloc extends Bloc<LocaleEvent, LocaleState> {
  LocaleBloc() : super(LocaleState(locale: const Locale('en'))) {
    on<ToggleLocale>((event, emit) {
      final newLocale = state.locale.languageCode == 'en' ? Locale('ru') : Locale('en');
      emit(LocaleState(locale: newLocale));
    });
  }
}
