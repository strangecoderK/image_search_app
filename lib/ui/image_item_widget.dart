import 'package:flutter/material.dart';
import 'package:search_app/date/model/image_item.dart';

class ImageItemWidget extends StatelessWidget {
  const ImageItemWidget({
    super.key,
    required this.imageItem,
  });

  final ImageItem imageItem;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: Image.network(
        imageItem.imageUrl,
        fit: BoxFit.cover,
      ),
    );
  }
}
