import 'package:flutter/material.dart';

class SearchImageApp extends StatefulWidget {
  const SearchImageApp({super.key});

  @override
  State<SearchImageApp> createState() => _SearchImageAppState();
}

class _SearchImageAppState extends State<SearchImageApp> {
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
              Expanded(
                child: GridView.builder(
                  gridDelegate:
                      SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                  itemCount: 100,
                  itemBuilder: (BuildContext context, int index) {
                    return Image.network('https://cdn.pixabay.com/photo/2018/01/05/16/24/rose-3063284_150.jpg');
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
