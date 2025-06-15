import '../entities/liquor.dart';

abstract class LiquorRepository {
  Future<void> loadLiquorDataFromAssets();
  Future<List<Liquor>> getAllLiquors();
}
