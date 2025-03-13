import 'package:app/model/share_favor.dart' as UuidUtils;
import 'package:app/provider/received_favor_notifier.dart';
import 'package:app/provider/repaid_favor_notifier.dart';
import 'package:flutter/material.dart';
import 'package:app/model/received_favor.dart';
import 'package:app/model/repaid_favor.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

enum FavorType { received, repaid }

class FavorAddModal extends ConsumerWidget {
  final FavorType type;
  final String? receivedFavorId; // 奉公登録時のみ使用

  const FavorAddModal({super.key, required this.type, this.receivedFavorId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favorTextController = TextEditingController();
    final memoTextController = TextEditingController();

    return AlertDialog(
      title: Text(type == FavorType.received ? "受けた恩を登録" : "奉公を登録"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: favorTextController,
            decoration: const InputDecoration(labelText: "内容"),
          ),
          TextField(
            controller: memoTextController,
            decoration: const InputDecoration(labelText: "メモ"),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text("キャンセル"),
        ),
        TextButton(
          onPressed: () {
            final favorText = favorTextController.text.trim();
            final memoText = memoTextController.text.trim();
            if (favorText.isNotEmpty) {
              if (type == FavorType.received) {
                ref
                    .read(receivedFavorNotifierProvider.notifier)
                    .addReceivedFavor(
                      ReceivedFavor(
                        id: UuidUtils.generateUuid(),
                        giverName: "Unknown",
                        favorText: favorText,
                        favorDate: DateTime.now(),
                        memo: memoText,
                      ),
                    );
              } else {
                ref.read(repaidFavorNotifierProvider.notifier).addRepaidFavor(
                      RepaidFavor(
                        id: UuidUtils.generateUuid(),
                        receivedFavorId: receivedFavorId!,
                        favorText: favorText,
                        favorDate: DateTime.now(),
                        memo: memoText,
                      ),
                    );
              }
              Navigator.pop(context);
            }
          },
          child: const Text("登録"),
        ),
      ],
    );
  }
}
