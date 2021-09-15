import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_call_api/domain/repository/meme_repo.dart';

import 'models/meme.dart';

final callServerProvider = Provider((ref) => MemeRepo());

final callMemeApiProvider = FutureProvider.autoDispose((ref) async {
  final callServer = ref.watch(callServerProvider);
  Meme meme = await callServer.getMeme();

  return meme;
});
