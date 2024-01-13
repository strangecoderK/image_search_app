import 'package:flutter/material.dart';
import '../date/model/image_item.dart';
import '../date/repository/pixabay_image_item_repository_impl.dart';
import 'image_item_widget.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final _repository = PixabayImageItemRepository();
  List<ImageItem> imageItems = [];
  final searchTextEditingController = TextEditingController();
  bool isLoading = false;

  @override
  void dispose() {
    searchTextEditingController.dispose();
    super.dispose();
  }

  Future<void> searchImages(String query) async {
    setState(() {
      isLoading = true;
    });
    imageItems = await _repository.getImageItems(query);
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [
              TextField(
                controller: searchTextEditingController,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      width: 4,
                      color: Color(0xFF4FB6B2),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      width: 4,
                      color: Color(0xFF4FB6B2),
                    ),
                  ),
                  hintText: 'Search',
                  hintStyle: const TextStyle(
                    color: Color(0xFF4FB6B2),
                  ),
                  suffixIcon: IconButton(
                    onPressed: () =>
                        searchImages(searchTextEditingController.text),
                    icon: const Icon(
                      Icons.search,
                      color: Color(0xFF4FB6B2),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              isLoading
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : Expanded(
                      child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 30,
                                mainAxisSpacing: 30),
                        itemCount: imageItems.length,
                        itemBuilder: (BuildContext context, int index) {
                          final ImageItem imageItem = imageItems[index];
                          return ImageItemWidget(imageItem: imageItem);
                        },
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
