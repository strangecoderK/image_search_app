import 'package:search_app/date/data_source/pixabay_api.dart';
import '../mapper/pixabay_mapper.dart';
import '../model/image_item.dart';

abstract interface class ImageItemPerository {
  Future<List<ImageItem>> getImageItems(String query);
}

class PixabayImageItemRepository implements ImageItemPerository {
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

class MockImageItemRepository implements ImageItemPerository {
  @override
  Future<List<ImageItem>> getImageItems(String query) async {
    await Future.delayed(const Duration(seconds: 1));

    if (query == 'flower') {
      return [
        ImageItem(
          imageUrl:
              'https://cdn.pixabay.com/photo/2018/01/05/16/24/rose-3063284_150.jpg',
          tags: 'rose, flower, petal',
        ),
        ImageItem(
          imageUrl:
              'https://cdn.pixabay.com/photo/2015/08/13/20/06/flower-887443_150.jpg',
          tags: 'flower, life, yellow flower',
        ),
        ImageItem(
          imageUrl:
              'https://cdn.pixabay.com/photo/2017/05/08/13/15/spring-bird-2295434_150.jpg',
          tags: 'spring bird, bird, tit',
        )
      ];
    } else {
      return [
        ImageItem(
          imageUrl:
              'https://cdn.pixabay.com/photo/2016/12/26/17/28/spaghetti-1932466_150.jpg',
          tags: 'spaghetti, tomatoes, basil',
        ),
        ImageItem(
          imageUrl:
              'https://cdn.pixabay.com/photo/2016/02/17/19/26/tomato-1205699_150.jpg',
          tags: 'tomato, fresh, red tomato',
        ),
      ];
    }
  }
}
