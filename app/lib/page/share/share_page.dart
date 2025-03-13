import 'package:app/provider/share_notifier.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:riverpod_paging_utils/riverpod_paging_utils.dart';

class SharePage extends StatelessWidget {
  const SharePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('みんなの恩返し'),
      ),
      body: PagingHelperView(
        provider: shareNotifierProvider,
        futureRefreshable: shareNotifierProvider.future,
        notifierRefreshable: shareNotifierProvider.notifier,
        contentBuilder: (data, widgetCount, endItemView) => ListView.builder(
          itemCount: widgetCount,
          itemBuilder: (context, index) {
            if (index == widgetCount - 1) {
              return endItemView;
            }
            final item = data.items[index];
            final formattedDate =
                DateFormat('yyyy/MM/dd HH:mm').format(item.repaiedFavorDate);
            return ListTile(
              title: Text(
                  '${item.userId}さんが${item.receivedFavorText}のに対して${item.repaidFavorText}'),
              subtitle: Text(formattedDate),
            );
          },
        ),
      ),
    );
  }
}
