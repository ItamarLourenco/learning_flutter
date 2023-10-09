
import '../application/locator_setup.dart';
import '../domain/comics_domain.dart';
import '../main.dart';
import '../repository/comics_repository.dart';

class ComicsUseCase implements ComicsUseCaseInterface{

  final ComicsRepositoryInterface comicsRepository = locator<ComicsRepository>();

  @override
  Future<ComicsDomain> execute(){
    return comicsRepository.getAll();
  }

  @override
  Future<ComicsDomain> getById(int id) {
    return comicsRepository.getById(id);
  }

}