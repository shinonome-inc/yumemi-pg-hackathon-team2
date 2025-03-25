import 'package:app/component/error_page.dart';
import 'package:app/constants/app_colors.dart';
import 'package:app/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:app/provider/ranking_provider.dart';

class RankingFavorList extends ConsumerWidget {
  const RankingFavorList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final rankingAsync = ref.watch(rankingUsersProvider);

    return Scaffold(
      body: rankingAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, stack) => ErrorView(
          err: e,
          stack: stack,
          refreshCallback: () => ref.refresh(rankingUsersProvider),
          backgroundColor: AppColors.backgroundBlue,
        ),
        data: (users) => ListView.separated(
          itemCount: users.length,
          separatorBuilder: (_, __) => const Divider(height: 0),
          itemBuilder: (context, index) {
            final user = users[index];
            return ListTile(
              tileColor: Colors.white,
              leading: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '${index + 1}',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 10),
                  const Icon(Icons.account_circle,
                      color: AppColors.secondary, size: 40),
                ],
              ),
              title: Text(
                user.username,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                '恩返し率: ${user.unreturnedRatio.toStringAsFixed(1)}%',
                style: const TextStyle(color: AppColors.textGray),
              ),
            );
          },
        ),
      ),
    );
  }
}

// import 'package:app/provider/share_notifier.dart';
// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:riverpod_paging_utils/riverpod_paging_utils.dart';

// // final rankColors = [
// //   Colors.yellow,
// //   Colors.grey,
// //   Colors.deepOrange,
// // ];
// //
// // Color rankColorFunction(int index) {
// //   if ((index + 1) >= 4) {
// //     return Colors.black;
// //   } else {
// //     return rankColors[index];
// //   }
// // }

// class RankingFavorList extends StatefulWidget {
//   const RankingFavorList({super.key});

//   @override
//   State<RankingFavorList> createState() => _RankingFavorListState();
// }

// class _RankingFavorListState extends State<RankingFavorList> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: PagingHelperView(
//         provider: shareNotifierProvider,
//         futureRefreshable: shareNotifierProvider.future,
//         notifierRefreshable: shareNotifierProvider.notifier,
//         contentBuilder: (data, widgetCount, endItemView) => ListView.separated(
//           itemCount: widgetCount,
//           itemBuilder: (context, index) {
//             if (index == widgetCount - 1) {
//               return endItemView;
//             }
//             final item = data.items[index];
//             final formattedRepaidDate =
//                 DateFormat('yyyy/MM/dd').format(item.repaiedFavorDate);
//             final formattedReceivedDate =
//                 DateFormat('yyyy/MM/dd').format(item.receivedFavorDate);

//             return ListTile(
//               tileColor: Colors.white,
//               leading: Row(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   Align(
//                     alignment: Alignment.topLeft,
//                     child: Text(
//                       (index + 1).toString(),
//                       style: TextStyle(
//                         fontSize: 20,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.black,
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                     width: 10,
//                   ),
//                   Icon(
//                     Icons.account_circle,
//                     color: Colors.blue,
//                     size: 50,
//                   ),
//                 ],
//               ),
//               subtitle: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Stack(
//                     children: [
//                       Text(
//                         item.userName,
//                         style: TextStyle(
//                           fontSize: 15,
//                           color: Color(0xFF7C7C7C),
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       Align(
//                         alignment: Alignment.centerRight,
//                         child: Text(
//                           formattedRepaidDate,
//                           style: TextStyle(
//                             fontSize: 15,
//                             color: Colors.black.withValues(alpha: 0.3),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                   Text(
//                     item.repaidFavorText,
//                     style: TextStyle(
//                       fontSize: 15,
//                       color: Colors.black,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   Text(
//                     item.receivedFavorText + "⇨" + formattedReceivedDate,
//                     style: TextStyle(
//                       fontSize: 15,
//                       color: Color(0xFFBCBCBC),
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ],
//               ),
//             );
//           },
//           separatorBuilder: (BuildContext context, int index) {
//             return Divider(
//               height: 0,
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
