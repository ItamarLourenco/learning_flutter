import 'package:flutter/material.dart';
import 'package:learning_flutter/domain/thumbnail_model.dart';

class ComicsListItem extends StatelessWidget {
  final String title;
  final String description;
  final ThumbnailModel image;

  const ComicsListItem({
    super.key,
    required this.title,
    required this.description,
    required this.image
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0, left: 10.0),
      child: Container(
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Colors.grey,
              width: 1.0,
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: SizedBox(
                  width: 150,
                  height: 150,
                  child: Image.network(
                    "${image.path}.${image.extension}",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Column(
                children: [
                  SizedBox(
                    width: 180,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Text(
                        title,
                        style: const TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 180,
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
