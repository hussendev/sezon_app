import 'package:sezon_app/app/utils/storage/cach_helper.dart';

import 'db_controller.dart';


abstract class DbOperations<Model> {
  final CacheHelper  cacheHelper = CacheHelper();


  Future<int> create(Model model);

  Future<List<Model>> read();

  Future<Model?> show(int id);

  Future<bool> update(Model model);

  Future<bool> delete(int id);

  Future<void> clear() async {

  }
}