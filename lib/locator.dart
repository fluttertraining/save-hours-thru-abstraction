import 'package:abstraction_demo/services/store/fake_api.dart';
import 'package:abstraction_demo/services/store/http_api.dart';
import 'package:abstraction_demo/services/store/api.dart';

import 'package:abstraction_demo/services/auth/fake.dart';
import 'package:abstraction_demo/services/auth/http.dart';
import 'package:abstraction_demo/services/auth/api.dart';

import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

const bool USE_FAKE_IMPLEMENTATION = true;

void setupLocator() {
  locator.registerLazySingleton<AbstractStoreApi>(
    () => USE_FAKE_IMPLEMENTATION ? FakeStoreApi() : StoreApi(),
  );
  locator.registerLazySingleton<AbstractAuthService>(
    () => USE_FAKE_IMPLEMENTATION ? FakeAuthService() : AuthService(),
  );
}
