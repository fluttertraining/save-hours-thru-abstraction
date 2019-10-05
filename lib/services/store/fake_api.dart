import 'package:abstraction_demo/models/store.dart';
import 'package:abstraction_demo/services/store/api.dart';

class FakeStoreApi implements AbstractStoreApi {
  @override
  Future<Store> fetchStoreDetail(int id) async {
    await Future.delayed(Duration(seconds: 2));
    return Store(name: "Hello", deliveryFee: 2.0);
  }

  @override
  Future<List<Store>> fetchStoreList() {
    // TODO: implement fetchStoreList
    return null;
  }
}
