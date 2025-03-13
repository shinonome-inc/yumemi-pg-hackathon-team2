// yujiさんに作って欲しい
// https://www.figma.com/board/4OZSx7cQFATeWCgd7sjpIv/yumemi_hackathon_team2?node-id=64-978&t=Fmsfov1FFf4YroGO-0

import 'package:app/component/favor_add_modal.dart';
import 'package:flutter/material.dart';
import 'package:app/model/received_favor.dart';

class FavorDetailPage extends StatelessWidget {
  final ReceivedFavor favor;

  const FavorDetailPage({super.key, required this.favor});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("受けた恩の詳細")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "恩人: ${favor.giverName}",
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              "内容: ${favor.favorText}",
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8),
            Text(
              "メモ: ${favor.memo}",
              style: const TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 8),
            Text(
              "受けた日: ${favor.favorDate.toLocal()}",
              style: const TextStyle(color: Colors.grey),
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => FavorAddModal(
                    type: FavorType.repaid,
                    receivedFavorId: favor.id,
                  ),
                );
              },
              child: const Text("恩を返す"),
            ),
          ],
        ),
      ),
    );
  }
}
