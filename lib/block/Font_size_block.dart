import 'package:flutter_bloc/flutter_bloc.dart';

abstract class FontSizeEvent {}

class ToggleFontSize extends FontSizeEvent {}

class FontSizeState {
  final double fontSize;
  FontSizeState({required this.fontSize});
}

class FontSizeBloc extends Bloc<FontSizeEvent, FontSizeState> {
  FontSizeBloc() : super(FontSizeState(fontSize: 24.0)) {
    on<ToggleFontSize>((event, emit) {
      // Увеличиваем или уменьшаем размер шрифта
      final newSize = state.fontSize == 24.0 ? 30.0 : 24.0;
      emit(FontSizeState(fontSize: newSize));
    });
  }
}
