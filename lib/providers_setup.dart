import 'package:abstraction_demo/services/auth/api.dart';
import 'package:abstraction_demo/services/auth/fake.dart';
import 'package:abstraction_demo/services/auth/http.dart';
import 'package:abstraction_demo/services/store/fake_api.dart';
import 'package:abstraction_demo/services/store/http_api.dart';
import 'package:abstraction_demo/services/store/api.dart';
import 'package:provider/provider.dart';

const bool USE_FAKE_IMPLEMENTATION = true;

List<SingleChildCloneableWidget> providers = [
  ...independentServices,
  ...dependentServices,
  ...uiConsumable
];

List<SingleChildCloneableWidget> independentServices = [
  Provider<AbstractStoreApi>.value(
    value: USE_FAKE_IMPLEMENTATION ? FakeStoreApi() : StoreApi(),
  )
];

List<SingleChildCloneableWidget> dependentServices = [];

List<SingleChildCloneableWidget> uiConsumable = [
  Provider<AbstractAuthService>.value(
    value: USE_FAKE_IMPLEMENTATION ? AuthService() : FakeAuthService(),
  )
];
