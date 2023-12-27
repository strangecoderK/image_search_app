import 'package:search_app/date/dto/pixabay_dto.dart';
import 'package:search_app/date/model/image_item.dart';

extension DtoToModel on Hits {
  ImageItem toImageItem() {
    return ImageItem(
      imageUrl: previewURL ??
          'https://cdn.pixabay.com/photo/2011/12/14/12/21/orion-nebula-11107_150.jpg',
      tags: tags ?? '',
    );
  }
}
