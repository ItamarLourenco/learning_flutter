import 'package:flutter/material.dart';
import 'package:learning_flutter/domain/thumbnail_model.dart';

class ComicsItem extends StatelessWidget{
  final String title;
  final String description;
  final ThumbnailModel thumbnailModel;

  const ComicsItem({
    super.key,
    required this.title,
    required this.description,
    required this.thumbnailModel
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Center(
              child: Image.network(
                "${thumbnailModel.path}.${thumbnailModel.extension}",
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: SizedBox(
                      child: Text(
                        title,
                        textAlign: TextAlign.left,
                        softWrap: true,
                        style: const TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    child: Text(
                      description,
                      textAlign: TextAlign.left,
                      softWrap: true,
                      style: const TextStyle(
                        fontSize: 12.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Voltar'),
            ),
          ],
        ),
      ),
    );
  }

}