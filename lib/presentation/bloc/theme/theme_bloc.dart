import 'package:clevit_flutter_bloc/domain/entities/theme_mode_type.dart';
import 'package:clevit_flutter_bloc/domain/usecases/switch_theme_mode.dart';
import 'package:clevit_flutter_bloc/presentation/bloc/theme/theme_event.dart';
import 'package:clevit_flutter_bloc/presentation/bloc/theme/theme_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  final SwitchThemeModeUseCase useCase;

  ThemeBloc(this.useCase) : super(const ThemeState(mode: ThemeModeType.light)) {
    on<ToggleThemeEvent>((event, emit) {
      final newMode = useCase.toggle(state.mode);
      emit(ThemeState(mode: newMode));
    });
  }
}