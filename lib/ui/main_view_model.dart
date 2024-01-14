import 'package:flutter/material.dart';
import 'package:search_app/date/repository/image_item_repository.dart';
import '../date/model/image_item.dart';

class MainViewModel extends ChangeNotifier {
  ImageItemRepository repository;

  MainViewModel({
    required this.repository,
  });

  List<ImageItem> imageItems = [];
  bool isLoading = false;

  Future<void> searchImages(String query) async {
    isLoading = true;
    notifyListeners();
    imageItems = await repository.getImageItems(query);
    isLoading = false;
    notifyListeners();
  }
}
