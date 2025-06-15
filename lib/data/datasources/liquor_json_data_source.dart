import 'dart:convert';

import 'package:clevit_flutter_bloc/data/models/liquor_model.dart';
import 'package:flutter/services.dart';

class LiquorJsonDataSource {
  Future<List<LiquorModel>> loadLiquorsFromJson() async {
    final jsonString = await rootBundle.loadString('assets/json/liquor_data.json');
    final data = json.decode(jsonString) as List;
    return data.map((e) => LiquorModel.fromJson(e)).toList();
  }
}