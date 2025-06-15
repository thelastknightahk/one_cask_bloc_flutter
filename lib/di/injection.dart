import 'package:clevit_flutter_bloc/data/datasources/liquor_json_data_source.dart';
import 'package:clevit_flutter_bloc/data/datasources/liquor_local_data_source.dart';
import 'package:clevit_flutter_bloc/data/repositories/liquor_repository_impl.dart';
import 'package:clevit_flutter_bloc/domain/repositories/liquor_repository.dart';
import 'package:clevit_flutter_bloc/domain/usecases/load_and_save_liquor_data.dart';
import 'package:clevit_flutter_bloc/domain/usecases/switch_theme_mode.dart';
import 'package:clevit_flutter_bloc/presentation/bloc/auth/auth_bloc.dart';
import 'package:clevit_flutter_bloc/presentation/bloc/liquor/liquor_bloc.dart';
import 'package:clevit_flutter_bloc/presentation/bloc/theme/theme_bloc.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Bloc
  sl.registerFactory(() => LiquorBloc(sl()));

  // UseCase
  sl.registerLazySingleton(() => LoadAndSaveLiquorDataUseCase(sl()));

  // Repository
  sl.registerLazySingleton<LiquorRepository>(
    () => LiquorRepositoryImpl(sl(), sl()),
  );

  // DataSources
  sl.registerLazySingleton(() => LiquorJsonDataSource());
  sl.registerLazySingleton(() => LiquorLocalDataSource());

  //theme

  sl.registerLazySingleton(() => SwitchThemeModeUseCase());
  sl.registerFactory(() => ThemeBloc(sl()));
  sl.registerFactory(() => AuthBloc());
}
