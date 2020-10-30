import 'applicationContext_appInfo_test.dart' as applicationContext_appInfo_test;
import 'applicationContext_configuration_test.dart' as applicationContext_configuration_test;
import 'applicationContext_intl_dart_test.dart' as applicationContext_intl_dart_test;
import 'network/flutter_http_builder_test.dart' as flutter_http_builder_test;
import 'network/dart_http_builder_test.dart' as dart_http_builder_test;
import 'validation/validations_test.dart' as validations_test;

void main()
{
  applicationContext_appInfo_test.main();

  applicationContext_configuration_test.main();

  applicationContext_intl_dart_test.main();

  dart_http_builder_test.main();

  flutter_http_builder_test.main();

  validations_test.main();
}