import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import '../models/photo.dart';

List<Photo> parsePhotos(List<dynamic> resBody) {
  // final list = json.decode(resBody) as List<dynamic>;
  List<Photo> photos = resBody
      .map(
        (element) => Photo.fromJson(element),
      )
      .toList();
  return photos;
}

Future<List<Photo>> fetchPhotos() async {
  final res = await Dio().getUri(
    Uri.parse(
      "https://jsonplaceholder.typicode.com/photos",
    ),
  );
  if (res.statusCode == 200) {
    final test = res.data;
    Photo photo = Photo(
      albumId: 12,
      id: 12,
      title: "title",
      url: "url",
      thumbnailUrl:
          "https://konachan.com/sample/83278c0e183fd19232290e3ee443004b/Konachan.com%20-%20340361%20sample.jpg",
    );
    // return [photo];
    return compute(parsePhotos, res.data as List<dynamic>);
  } else {
    throw Exception("Can't get photos");
  }
}
