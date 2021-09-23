import 'package:flutter/material.dart';
import 'package:riverpod_call_api/models/photo.dart';

class ViewImage extends StatelessWidget {
  final Photo photo;
  const ViewImage({required this.photo, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.network(photo.url),
      ),
    );
  }
}
