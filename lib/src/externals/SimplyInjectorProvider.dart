import 'package:cleanarch/injection.dart';
import 'package:simply_injector/simply_injector.dart';

class SimplyInjectorProvider implements IInjector
{
  final _container = SimplyInjector.Container();

  @override
  void addSingleton<TService, TImplementation extends TService>(
    TImplementation instance )
  {
    _container.register<TService, TImplementation>( () => instance,
        Lifestyle.singleton);
  }

  @override
  TService get<TService>() =>
    _container.get<TService>();

}