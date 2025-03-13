import 'package:app/page/home/received_favor_list.dart';
import 'package:app/page/home/repaid_favor_list.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('御恩と奉公'),
          bottom: const TabBar(
            tabs: [
              Tab(text: '受けた恩'),
              Tab(text: '返した恩'),
            ],
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