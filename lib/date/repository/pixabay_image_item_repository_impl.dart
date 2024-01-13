import 'package:search_app/date/mapper/pixabay_mapper.dart';

import '../data_source/pixabay_api.dart';
import '../model/image_item.dart';
import 'image_item_repository.dart';

class PixabayImageItemRepository implements ImageItemRepository {
  @override
  Future<List<ImageItem>> getImageItems(String query) async {
    //await Future.delayed(Duration(seconds: 1));
    final _api = PixabayApi();
    final dto = await _api.getImageResult(query);
    if (dto.hits == null) {
      return [];
    }
    return dto.hits!.map((e) => e.toImageItem()).toList();
  }
}
