
import 'package:get_it/get_it.dart';

import '../repository/comics_repository.dart';
import '../usecase/comics_use_case.dart';

final GetIt locator = GetIt.instance;
void setupLocator() {
  locator.registerSingleton<ComicsRepository>(ComicsRepository());
  locator.registerSingleton<ComicsUseCase>(ComicsUseCase());
}