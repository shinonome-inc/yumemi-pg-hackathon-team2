import 'package:app/component/button_component.dart';
import 'package:app/component/favor_add_modal.dart';
import 'package:app/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:app/model/received_favor.dart';

class FavorDetailPage extends StatelessWidget {
  final ReceivedFavor favor;

  const FavorDetailPage({super.key, required this.favor});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black, size: 20),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          '受けた恩の詳細',
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: () {
              // 編集機能の実装
            },
            child: const Text(
              '編集',
              style: TextStyle(
                color: Colors.orange,
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // プロフィール部分
            Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.orange[200],
                  child: const Icon(
                    Icons.person_outline,
                    size: 40,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(width: 16),
                Text(
                  favor.giverName,
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),

            // 「してもらったこと」ラベル
            const Text(
              'してもらったこと',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 8),

            // 恩の内容
            Text(
              favor.favorText,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),

            // 日付
            Text(
              _formatDate(favor.favorDate),
              style: const TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 24),

            // 区切り線
            const Divider(
              height: 1,
              thickness: 1,
              color: Color(0xFFEEEEEE),
            ),
            const SizedBox(height: 24),

            // メモ
            const Text(
              'メモ',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              favor.memo,
              style: const TextStyle(
                fontSize: 16,
              ),
            ),

            // 下部のスペースを埋める
            const Spacer(),
            ButtonComponent(
              buttonColor: AppColors.secondary,
              textColor: Colors.white,
              buttonText: '恩返しする',
              onPressed: () => showFavorAddModal(
                context,
                FavorType.repaid,
                receivedFavorId: favor.id,
                receivedFavor: favor,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 日付のフォーマット関数
  String _formatDate(DateTime date) {
    final List<String> weekdays = ['月', '火', '水', '木', '金', '土', '日'];
    final int weekdayIndex = date.weekday - 1; // 月曜が0、日曜が6

    return '${date.year}年 ${date.month}月${date.day}日 ${weekdays[weekdayIndex]}曜日';
  }
}
