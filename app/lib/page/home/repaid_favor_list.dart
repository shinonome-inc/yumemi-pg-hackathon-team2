import 'package:app/constants/app_colors.dart';
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
          data: (repaidData) => Scaffold(
            backgroundColor: AppColors.backgroundBlue,
            body: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              itemCount: repaidData.length,
              itemBuilder: (context, index) {
                final favor = repaidData[index];
                final repaidFavorDateString =
                    "${favor.favorDate.year}/${favor.favorDate.month}/${favor.favorDate.day}";
                final linkedReceivedFavor = receivedData.firstWhere(
                  (rf) => rf.id == favor.receivedFavorId,
                  orElse: () => ReceivedFavor(
                    id: '',
                    giverName: '不明',
                    favorText: '関連する恩なし',
                    favorDate: DateTime.now(),
                  ),
                );
                final receivedFavorDateString =
                    "${linkedReceivedFavor.favorDate.year}/${linkedReceivedFavor.favorDate.month}/${linkedReceivedFavor.favorDate.day}";

                // return Card(
                //   color: Colors.white,
                //   shape: RoundedRectangleBorder(
                //       borderRadius: BorderRadius.circular(5)),
                //   child: ListTile(
                //     title: Text(favor.favorText),
                //     subtitle: Column(
                //       crossAxisAlignment: CrossAxisAlignment.start,
                //       children: [
                //         Text("奉公日: ${favor.favorDate.toLocal()}"),
                //         const SizedBox(height: 8),
                //         Text("【紐づく御恩】"),
                //         Text("恩人: ${linkedReceivedFavor.giverName}"),
                //         Text("内容: ${linkedReceivedFavor.favorText}"),
                //         Text("受けた日: ${linkedReceivedFavor.favorDate.toLocal()}"),
                //       ],
                //     ),
                //   ),
                // );
                return Card(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  elevation: 0,
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
                              linkedReceivedFavor.giverName,
                              style: TextStyle(
                                fontSize: 15,
                                color: Color(0xFF7C7C7C),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerRight,
                              child: Text(
                                repaidFavorDateString,
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black.withValues(alpha: 0.3),
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
                          style: TextStyle(
                            fontSize: 15,
                            color: Color(0xFFBCBCBC),
                            fontWeight: FontWeight.bold,
                          ),
                          favor.memo + "⇨" + repaidFavorDateString,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, _) => Center(child: Text('エラーが発生しました。')),
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, _) => Center(child: Text('エラーが発生しました。')),
    );
  }
}
