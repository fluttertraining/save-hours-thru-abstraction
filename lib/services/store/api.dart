import 'package:abstraction_demo/models/store.dart';

abstract class AbstractStoreApi {
  Future<List<Store>> fetchStoreList();

  Future<Store> fetchStoreDetail(int id);
}
