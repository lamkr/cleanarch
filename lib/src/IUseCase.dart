abstract class IUseCase<TParam, TResponse>
{
  Future<TResponse> run(TParam param);
}