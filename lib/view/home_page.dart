import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_call_api/state/state_manager.dart';
import 'package:riverpod_call_api/view/view_image_page.dart';

class HomePageView extends ConsumerWidget {
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

              return InkWell(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ViewImage(photo: photo),
                  ),
                ),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(photo.thumbnailUrl),
                  ),
                  title: Text("${photo.id}. ${photo.title}"),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
