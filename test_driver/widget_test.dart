import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('Auth Test | ', () {
    FlutterDriver driver;
    // Connect to the Flutter driver before running any tests.
    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    // Close the connection to the driver after the tests have completed.
    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });

    final emailTextInput = find.byValueKey("emailTextInput");
    final passwordTextInput = find.byValueKey("passwordTextInput");
    final loginButton = find.byValueKey("loginButton");
    final errorMessage = find.byValueKey("dialogMessage");
    final closeDialogButton = find.byValueKey("closeDialogButton");

    test('Login Page - Error', () async {
      await driver.tap(emailTextInput);
      await driver.enterText("error@error.com");
      await driver.waitFor(find.text('error@error.com'));

      await driver.tap(passwordTextInput);
      await driver.enterText("123456");
      await driver.waitFor(find.text('123456'));

      await driver.tap(loginButton);
      expect(await driver.getText(errorMessage), "A server error occurred");
      await driver.tap(closeDialogButton);
    });

    test('Login Page - Success', () async {
      await driver.tap(emailTextInput);
      await driver.enterText("test@test.com");
      await driver.waitFor(find.text('test@test.com'));

      await driver.tap(passwordTextInput);
      await driver.enterText("123456");
      await driver.waitFor(find.text('123456'));

      await driver.tap(loginButton);
      expect(await driver.getText(errorMessage), "Everything Works!");
    });
  });
}
