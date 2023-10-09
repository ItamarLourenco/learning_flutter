import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_flutter/delivery/widgets/comics_list_item.dart';
import 'package:learning_flutter/delivery/widgets/my_app_bar.dart';

import '../application/locator_setup.dart';
import '../blocs/comics_bloc.dart';
import '../domain/comics_domain.dart';
import '../domain/result_model.dart';
import '../main.dart';
import '../usecase/comics_use_case.dart';

class ComicsListScreen extends StatefulWidget {
  ComicsListScreen({super.key});

  final ComicsUseCaseInterface comicsUseCase = locator<ComicsUseCase>();

  @override
  State<ComicsListScreen> createState() => _ComicsListScreenState();
}

class _ComicsListScreenState extends State<ComicsListScreen> {
  late ComicsListBloc _comicsBloc;

  @override
  void initState() {
    super.initState();
    _comicsBloc = ComicsListBloc(widget.comicsUseCase);
    _comicsBloc.add(FetchComicsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const MyAppBar(title: "Comics"),
        body: BlocBuilder<ComicsListBloc, ComicsState>(
          bloc: _comicsBloc,
          builder: (context, state) {
            switch (state.state) {
              case ComicsBlocState.initial:
                return const Center(
                  child: CircularProgressIndicator(),
                );

              case ComicsBlocState.loaded:
                final ComicsDomain comicsDomain = state.comicsDomain as ComicsDomain;
                final List<ResultModel> results = comicsDomain.data.results;
                return ListView.builder(
                  itemCount: results.length,
                  itemBuilder: (context, i) {
                    final result = results[i];
                    return InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, "detail_comics",
                            arguments: result.id);
                      },
                      child: ComicsListItem(
                        title: result.title,
                        description: result.description,
                        image: result.thumbnail,
                      ),
                    );
                  },
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
          }
        )
    );
  }

  @override
  void dispose() {
    _comicsBloc.close();
    super.dispose();
  }
}
