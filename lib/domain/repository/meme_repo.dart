import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:riverpod_call_api/domain/models/meme.dart';

class MemeRepo {
  Future<Meme> getMeme() async {
    http.Response response =
        await http.get(Uri.parse("https://some-random-api.ml/meme"));
    Map<String, dynamic> singleMemeJson = jsonDecode(response.body);
    return Meme.fromJson(singleMemeJson);
  }
}
