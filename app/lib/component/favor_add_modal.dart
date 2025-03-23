import 'package:app/model/share_favor.dart' as UuidUtils;
import 'package:app/provider/received_favor_notifier.dart';
import 'package:app/provider/repaid_favor_notifier.dart';
import 'package:flutter/material.dart';
import 'package:app/model/received_favor.dart';
import 'package:app/model/repaid_favor.dart';
import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter/cupertino.dart';
import 'package:table_calendar/table_calendar.dart'; 
enum FavorType { received, repaid }

class FavorAddModal extends ConsumerStatefulWidget {
  final FavorType type;
  final String? receivedFavorId;

  const FavorAddModal({super.key, required this.type, this.receivedFavorId});

  @override
  _FavorAddModalState createState() => _FavorAddModalState();
}

class _FavorAddModalState extends ConsumerState<FavorAddModal> {
  final nameTextController = TextEditingController();
  final favorTextController = TextEditingController();
  final memoTextController = TextEditingController();
  DateTime selectedDate = DateTime.now();
  bool showCalendar = false;
  bool isButtonEnabled = false; // ボタンが有効かどうか

  // 日付選択処理
  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    setState(() {
      selectedDate = selectedDay; // 選択された日付をセット
    });
  }

  void _onTextChanged(){
    setState(() {
      // 名前と内容が両方入力されている場合、ボタンを有効にする
      isButtonEnabled = nameTextController.text.trim().isNotEmpty &&
          favorTextController.text.trim().isNotEmpty;
    });
  }

  @override
  void initState() {
    super.initState();
    // 入力内容が変わるたびにボタンの状態を更新
    nameTextController.addListener(_onTextChanged);
    favorTextController.addListener(_onTextChanged);
  }

  @override
  void dispose() {
    // リスナーを解除
    nameTextController.removeListener(_onTextChanged);
    favorTextController.removeListener(_onTextChanged);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // 日付のフォーマットを指定
    final favorDateString =
        "${selectedDate.year}/${selectedDate.month}/${selectedDate.day}";

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          backgroundColor: const Color(0xFFF5F5F5),
          middle: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            child: Text(
              widget.type == FavorType.received ? "受けた恩を新規作成" : "奉公を登録",
              style: const TextStyle(
                color: Colors.orange,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          leading: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            child: CupertinoButton(
              padding: EdgeInsets.zero,
              onPressed: () => Navigator.pop(context),
              child: const Text(
                "キャンセル",
                style: TextStyle(
                  color: Colors.orange,
                  fontSize: 14,
                ),
              ),
            ),
          ),
          trailing: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            child: CupertinoButton(
              padding: EdgeInsets.zero,
              onPressed: () {
                final nameText = nameTextController.text.trim();
                final favorText = favorTextController.text.trim();
                final memoText = memoTextController.text.trim();
                if (favorText.isNotEmpty) {
                  if (widget.type == FavorType.received) {
                    ref
                        .read(receivedFavorNotifierProvider.notifier)
                        .addReceivedFavor(
                          ReceivedFavor(
                            id: UuidUtils.generateUuid(),
                            giverName: nameText,
                            favorText: favorText,
                            favorDate: selectedDate,
                            memo: memoText,
                          ),
                        );
                  } else {
                    ref
                        .read(repaidFavorNotifierProvider.notifier)
                        .addRepaidFavor(
                          RepaidFavor(
                            id: UuidUtils.generateUuid(),
                            receivedFavorId: widget.receivedFavorId!,
                            favorText: favorText,
                            favorDate: selectedDate,
                            memo: memoText,
                          ),
                        );
                  }
                  Navigator.pop(context);
                }
              },
              child: Text(
                "追加",
                style: TextStyle(
                  color: isButtonEnabled ? Colors.orange : Colors.grey,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          border: null,
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            child: Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  CupertinoTextField(
                    controller: nameTextController,
                    placeholder: "名前",
                    padding: const EdgeInsets.all(16),
                  ),
                  const SizedBox(height: 16),
                  CupertinoTextField(
                    controller: favorTextController,
                    placeholder: "内容",
                    padding: const EdgeInsets.all(16),
                  ),
                  const SizedBox(height: 16),
                  CupertinoTextField(
                    controller: memoTextController,
                    placeholder: "メモ",
                    padding: const EdgeInsets.all(16),
                  ),
                  const SizedBox(height: 16),

                  // 「してもらった日」のテキストとスイッチを表示
                  Row(
                    children: [
                      Icon(
                        CupertinoIcons.calendar,
                        color: showCalendar ? Colors.orange : Colors.grey,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        "してもらった日",
                        style: TextStyle(
                          color: showCalendar ? Colors.orange : Colors.grey,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(),
                      CupertinoSwitch(
                        value: showCalendar,
                        onChanged: (value) {
                          setState(() {
                            showCalendar = value;
                          });
                        },
                        activeColor:
                            Colors.green, // Green color when switched on
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),

                  if (showCalendar)
                    Column(
                      children: [
                        const SizedBox(height: 4),
                        Text(
                          "選択された日: ${favorDateString}",
                          style: const TextStyle(color: Colors.black),
                        ),
                        const SizedBox(height: 4),
                        TableCalendar(
                          firstDay: DateTime.utc(2000, 1, 1),
                          lastDay: DateTime.utc(2101, 12, 31),
                          focusedDay: selectedDate,
                          selectedDayPredicate: (day) =>
                              isSameDay(day, selectedDate),
                          onDaySelected: _onDaySelected,
                        ),
                        const SizedBox(height: 16),
                      ],
                    ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

void showFavorAddModal(BuildContext context, FavorType type,
    {String? receivedFavorId}) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (BuildContext context) {
      return FavorAddModal(type: type, receivedFavorId: receivedFavorId);
    },
  );
}
