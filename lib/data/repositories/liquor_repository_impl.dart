import 'package:clevit_flutter_bloc/data/datasources/liquor_json_data_source.dart';
import 'package:clevit_flutter_bloc/data/datasources/liquor_local_data_source.dart';
import 'package:clevit_flutter_bloc/domain/entities/liquor.dart';
import 'package:clevit_flutter_bloc/domain/repositories/liquor_repository.dart';

class LiquorRepositoryImpl implements LiquorRepository {
  final LiquorJsonDataSource jsonDataSource;
  final LiquorLocalDataSource localDataSource;

  LiquorRepositoryImpl(this.jsonDataSource, this.localDataSource);

  @override
  Future<void> loadLiquorDataFromAssets() async {
    final liquors = await jsonDataSource.loadLiquorsFromJson();
    await localDataSource.saveLiquors(liquors);
  }

@override
Future<List<Liquor>> getAllLiquors() async {
  final models = await localDataSource.getLiquors();
  return models.map((model) => model.toEntity()).toList();
}
}