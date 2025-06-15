
import 'package:clevit_flutter_bloc/domain/entities/liquor.dart';
import 'package:clevit_flutter_bloc/domain/repositories/liquor_repository.dart';

class LoadAndSaveLiquorDataUseCase {
  final LiquorRepository repository;

  LoadAndSaveLiquorDataUseCase(this.repository);

  Future<void> loadAndSave() async {
    await repository.loadLiquorDataFromAssets();
  }

  Future<List<Liquor>> getAll() async {
    return await repository.getAllLiquors();
  }
}