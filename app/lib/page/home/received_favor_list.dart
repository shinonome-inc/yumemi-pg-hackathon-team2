import 'package:app/component/favor_add_modal.dart';
import 'package:app/page/favor_detail/favor_detail_page.dart';
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
            data: (favors) => ListView.builder(
              itemCount: favors.length,
              itemBuilder: (context, index) {
                final favor = favors[index];
                return ListTile(
                  title: Text(favor.favorText),
                  subtitle: Text("by ${favor.giverName}"),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FavorDetailPage(favor: favor),
                      ),
                    );
                  },
                );
              },
            ),
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (error, _) => Center(child: Text('エラー: $error')),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) =>
                      const FavorAddModal(type: FavorType.received),
                );
              },
              child: const Text("受けた恩を追加"),
            ),
          ),
        ),
      ],
    );
  }
}
