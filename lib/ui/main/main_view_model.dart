import 'package:flutter/material.dart';
import 'package:search_app/date/repository/image_item_repository.dart';
import 'package:search_app/ui/main/main_state.dart';


class MainViewModel extends ChangeNotifier {
  ImageItemRepository repository;

  MainViewModel({
    required this.repository,
  });

  MainState state = MainState();

  Future<void> searchImages(String query) async {
    state = state.copyWith(isLoading: true);
    notifyListeners();
    final result = await repository.getImageItems(query);

    state = state.copyWith(isLoading: false, imageItems: result);
    notifyListeners();
  }
}
