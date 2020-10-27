abstract class IUseCase<Param, Response>
{
  Future<Response> run(Param param);
}