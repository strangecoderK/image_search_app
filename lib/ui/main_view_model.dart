import 'package:flutter/material.dart';
import '../date/model/image_item.dart';
import '../date/repository/pixabay_image_item_repository_impl.dart';

class MainViewModel extends ChangeNotifier {
  final _repository = PixabayImageItemRepository();
  List<ImageItem> imageItems = [];
  bool isLoading = false;

  Future<void> searchImages(String query) async {
    isLoading = true;
    notifyListeners();
    imageItems = await _repository.getImageItems(query);
    isLoading = false;
    notifyListeners();
  }
}
