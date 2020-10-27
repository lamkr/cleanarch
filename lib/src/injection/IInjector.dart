abstract class IInjector
{
  TService get<TService>();

  void addSingleton<TService, TImplementation extends TService>(
      TImplementation instance );
}