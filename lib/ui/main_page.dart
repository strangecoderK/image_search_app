import 'package:flutter/material.dart';

import '../date/model/image_item.dart';
import 'image_item_widget.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      width: 4,
                      color: Color(0xFF4FB6B2),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      width: 4,
                      color: Color(0xFF4FB6B2),
                    ),
                  ),
                  hintText: 'Search',
                  hintStyle: TextStyle(
                    color: Color(0xFF4FB6B2),
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.search,
                      color: Color(0xFF4FB6B2),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 30,
                      mainAxisSpacing: 30),
                  itemCount: 100,
                  itemBuilder: (BuildContext context, int index) {
                    final ImageItem imageItem = ImageItem(
                        imageUrl:
                            'https://cdn.pixabay.com/photo/2018/01/05/16/24/rose-3063284_150.jpg',
                        tags: 'rose, flower, petal');
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
