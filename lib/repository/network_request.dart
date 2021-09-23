import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import '../models/photo.dart';

List<Photo> parsePhotos(String resBody) {
  final list = json.decode(resBody) as List<dynamic>;
  List<Photo> photos = list.map((element) => Photo.fromJson(element)).toList();
  return photos;
}

Future<List<Photo>> fetchPhotos() async {
  final res =
      await http.get(Uri.parse("https://jsonplaceholder.typicode.com/photos"));
  if (res.statusCode == 200) {
    return compute(parsePhotos, res.body);
  } else {
    throw Exception("Can't get photos");
  }
}
