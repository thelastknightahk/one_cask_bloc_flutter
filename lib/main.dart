import 'package:clevit_flutter_bloc/core/routers/app_routers.dart';
import 'package:clevit_flutter_bloc/core/theme/app_theme.dart';
import 'package:clevit_flutter_bloc/di/injection.dart';
import 'package:clevit_flutter_bloc/domain/usecases/switch_theme_mode.dart';
import 'package:clevit_flutter_bloc/presentation/bloc/theme/theme_bloc.dart';
import 'package:clevit_flutter_bloc/presentation/bloc/theme/theme_state.dart';
import 'package:clevit_flutter_bloc/presentation/providers/bloc_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'di/injection.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return AppBlocWrapper(
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          final mode = sl<SwitchThemeModeUseCase>()
              .getFlutterThemeMode(state.mode);
          return MaterialApp.router(
            themeMode: mode,
            theme: AppTheme.light,
            darkTheme: AppTheme.dark,
            debugShowCheckedModeBanner: false,
            routerConfig: _appRouter.config(),
          );
        },
      ),
    );
  }
}