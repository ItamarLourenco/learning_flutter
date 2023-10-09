
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_flutter/domain/comics_domain.dart';

enum ComicsBlocState {
  initial,
  loaded,
  error,
}

abstract class ComicsEvent {}
class FetchComicsEvent extends ComicsEvent {}
class GetByIdComicsEvent extends ComicsEvent {
  final int id;

  GetByIdComicsEvent({required this.id});
}

class ComicsState {
  final ComicsBlocState state;
  final ComicsDomain? comicsDomain;
  final String? error;

  ComicsState(this.state, {this.comicsDomain, this.error});
}


class ComicsListBloc extends Bloc<ComicsEvent, ComicsState>{
  final ComicsUseCaseInterface comicsUseCase;

  ComicsListBloc(this.comicsUseCase): super(ComicsState(ComicsBlocState.initial));

  @override
  Stream<ComicsState> mapEventToState(ComicsEvent event) async* {
    if(event is FetchComicsEvent){
      try {
        final ComicsDomain comicsDomain = await comicsUseCase.execute();
        yield ComicsState(ComicsBlocState.loaded, comicsDomain: comicsDomain);
      } catch (e) {
        yield ComicsState(ComicsBlocState.error, error: e.toString());
      }
    }

    if(event is GetByIdComicsEvent){
      try {
        final ComicsDomain comicsDomain = await comicsUseCase.getById(event.id);
        yield ComicsState(ComicsBlocState.loaded, comicsDomain: comicsDomain);
      } catch (e) {
        yield ComicsState(ComicsBlocState.error, error: e.toString());
      }
    }
  }
}