import 'package:cleanarch/log.dart';

class ConsoleLogger implements ILogger
{
  const ConsoleLogger();

  @override
  void error(String message, Object error) {
    print('$message: $error');
  }
}