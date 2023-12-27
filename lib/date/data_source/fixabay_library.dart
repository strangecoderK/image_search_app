import 'dart:convert';

import 'package:http/http.dart' as http;

import '../dto/pixabay_dto.dart';

class PixabayApi {
  Future<PixabayDto> getImageResult() async {
    final response = await http.get(Uri.parse(
        'https://pixabay.com/api/?key=41482986-9b8db281c117219c7503a3520&q=tomato&image_type=photo'));
    return PixabayDto.fromJson(jsonDecode(response.body));
  }
}
