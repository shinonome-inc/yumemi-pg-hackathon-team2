import 'package:app/component/favor_add_modal.dart';
import 'package:app/page/favor_detail/favor_detail_page.dart';
import 'package:app/page/home/home_page.dart';
import 'package:app/provider/received_favor_notifier.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ReceivedFavorList extends ConsumerWidget {
  const ReceivedFavorList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final receivedFavors = ref.watch(receivedFavorNotifierProvider);

    return Column(
      children: [
        Expanded(
          child: receivedFavors.when(
            data: (favors) => Scaffold(
              backgroundColor: Colors.orange.withValues(alpha: 0.05),
              body: ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 7, vertical: 7),
                itemCount: favors.length,
                itemBuilder: (context, index) {
                  final favor = favors[index];
                  final favorDateString =
                      "${favor.favorDate.year}/${favor.favorDate.month}/${favor.favorDate.day}";
                  return Dismissible(
                    key: Key(favors[index].toString()),
                    direction: DismissDirection.endToStart,
                    background: Container(
                      color: Colors.greenAccent,
                      child: const Align(
                          alignment: Alignment.centerLeft,
                          child: Icon(Icons.check)),
                    ),
                    secondaryBackground: Container(
                      color: Colors.red,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "削除",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                        ],
                      ),
                    ),
                    onDismissed: (DismissDirection direction) {
                      if (direction == DismissDirection.endToStart) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("削除されました。")));
                        favors.removeAt(index);
                      }
                    },
                    child: Card(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                      elevation: 4,
                      child: ListTile(
                        leading: Icon(
                          Icons.account_circle,
                          color: Colors.blue,
                          size: 50,
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(
                              children: [
                                Text(
                                  favor.giverName,
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Color(0xFF7C7C7C),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                    favorDateString,
                                    style: TextStyle(
                                      fontSize: 15,
                                      color:
                                          Colors.black.withValues(alpha: 0.3),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              favor.favorText,
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              favor.memo,
                              style: TextStyle(
                                fontSize: 15,
                                color: Color(0xFFBCBCBC),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  FavorDetailPage(favor: favor),
                            ),
                          );
                        },
                      ),
                    ),
                  );
                },
              ),
              floatingActionButton: FloatingActionButton(
                backgroundColor: Colors.orange,
                mini: true,
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) =>
                        const FavorAddModal(type: FavorType.received),
                  );
                }, //ここに関数を入れる
                shape: CircleBorder(),
                tooltip: "Increment",
                child: const Icon(color: Colors.white, Icons.add, size: 25),
              ),
            ),
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (error, _) => Center(child: Text('エラー: $error')),
          ),
        ),
        // Padding(
        //   padding: const EdgeInsets.all(16.0),
        //   child: SizedBox(
        //     width: double.infinity,
        //     child: ElevatedButton(
        //       onPressed: () {
        //         showDialog(
        //           context: context,
        //           builder: (context) =>
        //               const FavorAddModal(type: FavorType.received),
        //         );
        //       },
        //       child: const Text("受けた恩を追加"),
        //     ),
        //   ),
        // ),
      ],
    );
  }
}
