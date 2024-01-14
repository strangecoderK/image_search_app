import 'package:get_it/get_it.dart';
import 'package:search_app/date/repository/image_item_repository.dart';
import 'package:search_app/date/repository/pixabay_image_item_repository_impl.dart';
import 'package:search_app/ui/main_view_model.dart';

final getIt = GetIt.instance;

void diSetup() {
  getIt
      .registerSingleton<ImageItemRepository>(PixabayImageItemRepositoryImpl());
  getIt.registerFactory<MainViewModel>(
      () => MainViewModel(repository: getIt<ImageItemRepository>()));
}
