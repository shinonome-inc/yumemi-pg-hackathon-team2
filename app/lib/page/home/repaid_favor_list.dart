import 'package:app/model/received_favor.dart';
import 'package:app/provider/received_favor_notifier.dart';
import 'package:app/provider/repaid_favor_notifier.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RepaidFavorList extends ConsumerWidget {
  const RepaidFavorList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final repaidFavors = ref.watch(repaidFavorNotifierProvider);
    final receivedFavors = ref.watch(receivedFavorNotifierProvider);

    return receivedFavors.when(
      data: (receivedData) {
        return repaidFavors.when(
          data: (repaidData) => ListView.builder(
            itemCount: repaidData.length,
            itemBuilder: (context, index) {
              final favor = repaidData[index];
              final linkedReceivedFavor = receivedData.firstWhere(
                (rf) => rf.id == favor.receivedFavorId,
                orElse: () => ReceivedFavor(
                  id: '',
                  giverName: '不明',
                  favorText: '関連する恩なし',
                  favorDate: DateTime.now(),
                ),
              );

              return ListTile(
                title: Text(favor.favorText),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("奉公日: ${favor.favorDate.toLocal()}"),
                    const SizedBox(height: 8),
                    Text("【紐づく御恩】"),
                    Text("恩人: ${linkedReceivedFavor.giverName}"),
                    Text("内容: ${linkedReceivedFavor.favorText}"),
                    Text("受けた日: ${linkedReceivedFavor.favorDate.toLocal()}"),
                  ],
                ),
              );
            },
          ),
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, _) => Center(child: Text('エラー: $error')),
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, _) => Center(child: Text('エラー: $error')),
    );
  }
}
