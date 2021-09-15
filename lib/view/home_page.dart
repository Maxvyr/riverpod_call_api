import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_call_api/domain/meme_controller.dart';
import 'package:riverpod_call_api/domain/models/meme.dart';

class HomePageView extends HookConsumerWidget {
  const HomePageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final memeProvider = ref.watch(callMemeApiProvider);
    const imageNO =
        "https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/No_image_available.svg/600px-No_image_available.svg.png";
    debugPrint("call API by Provider");

    Meme loadingMeme = Meme(0, imageNO, "Loading....", "");

    String category = memeProvider.when(
      data: (data) => data.category,
      loading: () => loadingMeme.category,
      error: (e, stack) => e.toString(),
    );

    String caption = memeProvider.when(
      data: (data) => data.caption,
      loading: () => loadingMeme.caption,
      error: (e, stack) => imageNO,
    );

    String imageUrl = memeProvider.when(
      data: (data) => data.imageUrl,
      loading: () => imageNO,
      error: (e, stack) => imageNO,
    );
    return Scaffold(
      body: Center(
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Category $category",
                  style: const TextStyle(fontSize: 36),
                ),
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                  ),
                  child: Image.network(imageUrl),
                ),
                const SizedBox(height: 8),
                Text("Caption: $caption"),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.skip_next),
        onPressed: () async {
          debugPrint("CLIKC");
          await ref.refresh(callMemeApiProvider);
          debugPrint("Refresh");
        },
      ),
    );
  }
}


// class HomePageView extends StatefulWidget {
//   @override
//   _HomePageViewState createState() => _HomePageViewState();
// }

// class _HomePageViewState extends State<HomePageView> {
//   Meme? visibleMeme;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         child: visibleMeme != null
//             ? Center(
//                 child: Card(
//                   child: Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Column(
//                       mainAxisSize: MainAxisSize.min,
//                       children: [
//                         Text(
//                           "Category ${visibleMeme!.category}",
//                           style: const TextStyle(fontSize: 36),
//                         ),
//                        const SizedBox(height: 8),
//                         Container(
//                           padding:const EdgeInsets.all(8),
//                           decoration: BoxDecoration(
//                             border: Border.all(color: Colors.black),
//                           ),
//                           child: Image.network(visibleMeme!.imageUrl),
//                         ),
//                         const SizedBox(height: 8),
//                         Text("Caption: ${visibleMeme!.caption}"),
//                       ],
//                     ),
//                   ),
//                 ),
//               )
//             : const Center(child: Text("No Meme loaded yet"),),
//       ),
//       floatingActionButton: FloatingActionButton(
//         child: const Icon(Icons.skip_next),
//         onPressed: () async {
//           // TODO

          
//         },
//       ),
//     );
//   }
// }
