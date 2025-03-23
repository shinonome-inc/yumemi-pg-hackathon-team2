import 'package:app/page/home/received_favor_list.dart';
import 'package:app/page/home/repaid_favor_list.dart';
import 'package:app/page/setting/setting_page.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final StateProvider<int> giveTakeProvider = StateProvider<int>((ref) {
  return 0;
});

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final int topBarIndex = ref.watch(giveTakeProvider);
    final Color topBarColor = [Colors.orange, Colors.blue][topBarIndex];

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Stack(
            children: [
              Column(children: [
                SizedBox(
                  height: 15,
                ),
                Center(
                  child: Text(
                    "受恩と報恩",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                ),
              ]),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  IconButton(
                    icon: Icon(
                      Icons.notifications_none,
                      size: 30,
                      color: Colors.grey,
                    ),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.settings_outlined,
                      size: 30,
                      color: Colors.grey,
                    ),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) {
                            return const SettingPage();
                          },
                        ),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
          bottom: TabBar(
            tabs: [
              Tab(text: '受けた恩'),
              Tab(text: '返した恩'),
            ],
            labelColor: topBarColor,
            indicatorColor: topBarColor,
            indicator: UnderlineTabIndicator(
              borderSide: BorderSide(width: 4.0, color: topBarColor),
              insets: EdgeInsets.symmetric(horizontal: 90),
            ),
            onTap: (index) {
              ref.read(giveTakeProvider.notifier).state = index;
            },
          ),
        ),
        body: const TabBarView(
          children: [
            ReceivedFavorList(),
            RepaidFavorList(),
          ],
        ),
      ),
    );
  }
}

// wataruさんに作って欲しい
// https://www.figma.com/board/4OZSx7cQFATeWCgd7sjpIv/yumemi_hackathon_team2?node-id=64-978&t=Fmsfov1FFf4YroGO-0
