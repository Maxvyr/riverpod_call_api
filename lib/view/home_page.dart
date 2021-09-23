import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_call_api/state/state_manager.dart';

class HomePageView extends HookConsumerWidget {
  const HomePageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final photosProvider = ref.watch(photoStateProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Riverpod Get Data from API"),
        centerTitle: true,
      ),
      body: photosProvider.when(
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
        error: (e, stack) => Center(
          child: Text("Error : $e"),
        ), 
        data: (photos) {
          return ListView.builder(
            itemCount: photos.length,
            itemBuilder: (BuildContext context, int index) {
              final photo = photos[index];

              return ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(photo.thumbnailUrl),
                ),
                title: Text("${photo.id}. ${photo.title}"),
              );
            },
          );
        },
      ),
    );
  }
}
