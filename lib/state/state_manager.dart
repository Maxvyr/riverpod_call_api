import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/photo.dart';
import '../repository/network_request.dart';

final photoStateProvider = FutureProvider.autoDispose<List<Photo>>((ref) async {
  return fetchPhotos();
});
