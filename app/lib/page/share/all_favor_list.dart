//import 'package:app/model/share_favor.dart';
import 'package:app/provider/share_notifier.dart';
import 'package:flutter/material.dart';
//import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:riverpod_paging_utils/riverpod_paging_utils.dart';

class AllFavorList extends StatefulWidget {
  const AllFavorList({super.key});

  @override
  State<AllFavorList> createState() => _AllFavorListState();
}

class _AllFavorListState extends State<AllFavorList> {
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
