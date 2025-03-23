import 'package:app/provider/share_notifier.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:riverpod_paging_utils/riverpod_paging_utils.dart';

// final rankColors = [
//   Colors.yellow,
//   Colors.grey,
//   Colors.deepOrange,
// ];
//
// Color rankColorFunction(int index) {
//   if ((index + 1) >= 4) {
//     return Colors.black;
//   } else {
//     return rankColors[index];
//   }
// }

class rankingFavorList extends StatefulWidget {
  const rankingFavorList({super.key});

  @override
  State<rankingFavorList> createState() => _rankingFavorListState();
}

class _rankingFavorListState extends State<rankingFavorList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PagingHelperView(
        provider: shareNotifierProvider,
        futureRefreshable: shareNotifierProvider.future,
        notifierRefreshable: shareNotifierProvider.notifier,
        contentBuilder: (data, widgetCount, endItemView) => ListView.separated(
          itemCount: widgetCount,
          itemBuilder: (context, index) {
            if (index == widgetCount - 1) {
              return endItemView;
            }
            final item = data.items[index];
            final formattedRepaidDate =
                DateFormat('yyyy/MM/dd').format(item.repaiedFavorDate);
            final formattedReceivedDate =
                DateFormat('yyyy/MM/dd').format(item.receivedFavorDate);

            return ListTile(
              tileColor: Colors.white,
              leading: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      (index + 1).toString(),
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.account_circle,
                    color: Colors.blue,
                    size: 50,
                  ),
                ],
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Text(
                        item.userName,
                        style: TextStyle(
                          fontSize: 15,
                          color: Color(0xFF7C7C7C),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          formattedRepaidDate,
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.black.withValues(alpha: 0.3),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    item.repaidFavorText,
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    item.receivedFavorText + "⇨" + formattedReceivedDate,
                    style: TextStyle(
                      fontSize: 15,
                      color: Color(0xFFBCBCBC),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return Divider(
              height: 0,
            );
          },
        ),
      ),
    );
  }
}
