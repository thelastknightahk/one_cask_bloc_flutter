import 'package:clevit_flutter_bloc/domain/entities/theme_mode_type.dart';
import 'package:equatable/equatable.dart';

class ThemeState extends Equatable {
  final ThemeModeType mode;

  const ThemeState({required this.mode});

  @override
  List<Object?> get props => [mode];
}