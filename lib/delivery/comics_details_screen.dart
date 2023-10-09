import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_flutter/delivery/widgets/comics_item.dart';
import 'package:learning_flutter/delivery/widgets/my_app_bar.dart';

import '../application/locator_setup.dart';
import '../blocs/comics_bloc.dart';
import '../domain/comics_domain.dart';
import '../main.dart';
import '../usecase/comics_use_case.dart';

class ComicsDetailScreen extends StatefulWidget {
  ComicsDetailScreen({super.key});

  final ComicsUseCaseInterface comicsUseCase = locator<ComicsUseCase>();

  @override
  State<ComicsDetailScreen> createState() => _ComicsDetailScreen();
}

class _ComicsDetailScreen extends State<ComicsDetailScreen> {
  late ComicsBloc _comicsBloc;
  late int id;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    id = ModalRoute.of(context)!.settings.arguments as int;
    _comicsBloc = ComicsBloc(widget.comicsUseCase);
    _comicsBloc.add(GetByIdComicsEvent(id: id));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const MyAppBar(title: "Detalhe Comics"),
        body: BlocBuilder<ComicsBloc, ComicsState>(
          bloc: _comicsBloc,
          builder: (context, state) {
            switch(state.state){
              case ComicsBlocState.initial:
                return const Center(
                  child: CircularProgressIndicator(),
                );

              case ComicsBlocState.loaded:
                final comics = state.comicsDomain as ComicsDomain;
                final result = comics.data.results[0];
                return ComicsItem(
                  title: result.title,
                  description: result.description,
                  thumbnailModel: result.thumbnail,
                );

              case ComicsBlocState.error:
                return Center(
                  child: Text("Error: ${state.error}"),
                );

              default:
                return const Center(
                  child: CircularProgressIndicator(),
                );
            }
          },
        )
    );
  }
}
