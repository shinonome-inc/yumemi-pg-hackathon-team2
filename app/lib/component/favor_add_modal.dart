import 'package:app/constants/app_colors.dart';
import 'package:app/model/share_favor.dart' as UuidUtils;
import 'package:app/model/share_favor_request.dart';
import 'package:app/provider/favor_count_updater.dart';
import 'package:app/provider/received_favor_notifier.dart';
import 'package:app/provider/repaid_favor_notifier.dart';
import 'package:app/provider/share_favor_uploader.dart';
import 'package:app/provider/user_notifier.dart';
import 'package:flutter/material.dart';
import 'package:app/model/received_favor.dart';
import 'package:app/model/repaid_favor.dart';
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

  Future<void> shareFavor(
      String nameText, String favorText, String memoText, int userId) async {
    final receivedFavorId = widget.receivedFavorId!;
    final receivedFavor = await ref
        .read(receivedFavorNotifierProvider.notifier)
        .getReceivedFavorById(receivedFavorId);

    if (receivedFavor == null) {
      throw Exception('対応する受けた恩が見つかりません');
    }

    await ref.read(repaidFavorNotifierProvider.notifier).addRepaidFavor(
          RepaidFavor(
            id: UuidUtils.generateUuid(),
            receivedFavorId: receivedFavorId,
            favorText: favorText,
            favorDate: selectedDate,
            memo: memoText,
          ),
        );

    final favor = ShareFavorRequest(
      userId: userId,
      receivedFavorText: receivedFavor.favorText,
      receivedFavorDate: receivedFavor.favorDate,
      giverName: nameText,
      repaidFavorText: favorText,
      repaidFavorDate: selectedDate,
      memo: memoText,
    );

    await ref.read(shareFavorUploaderProvider.notifier).upload(favor);
    await ref.read(favorCountUpdaterProvider.notifier).updateFavorCounts();
  }

  // 日付選択処理
  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    setState(() {
      selectedDate = selectedDay; // 選択された日付をセット
    });
  }

  void _onTextChanged() {
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

    return Material(
      color: Colors.transparent,
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: CupertinoPageScaffold(
          navigationBar: CupertinoNavigationBar(
            backgroundColor: AppColors.backgroundModal,
            middle: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              child: Text(
                widget.type == FavorType.received ? "受けた恩を新規作成" : "奉公を登録",
                style: const TextStyle(
                  color: AppColors.primary,
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
                    color: AppColors.primary,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
            trailing: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              child: CupertinoButton(
                padding: EdgeInsets.zero,
                onPressed: () async {
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
                      try {
                        final user = ref.read(userNotifierProvider).value;
                        if (user == null) {
                          throw Exception('ユーザー情報が存在しません');
                        }
                        shareFavor(nameText, favorText, memoText, user.userId);
                      } catch (e) {
                        debugPrint('エラー: $e');
                      }
                    }
                    if (context.mounted) {
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        '/root',
                        (route) => false,
                      );
                    }
                  }
                },
                child: Text(
                  "追加",
                  style: TextStyle(
                    color: isButtonEnabled
                        ? AppColors.primary
                        : AppColors.textField,
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
                      padding: const EdgeInsets.all(12),
                    ),
                    const SizedBox(height: 16),
                    CupertinoTextField(
                      controller: favorTextController,
                      placeholder: "内容",
                      padding: const EdgeInsets.all(12),
                    ),
                    const SizedBox(height: 16),
                    CupertinoTextField(
                      controller: memoTextController,
                      placeholder: "メモ",
                      padding: const EdgeInsets.all(12),
                    ),
                    const SizedBox(height: 16),

                    // 「してもらった日」のテキストとスイッチを表示
                    Row(
                      children: [
                        Icon(
                          CupertinoIcons.calendar,
                          color: showCalendar
                              ? AppColors.primary
                              : AppColors.textField,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          "してもらった日",
                          style: TextStyle(
                            color: showCalendar
                                ? AppColors.primary
                                : AppColors.textField,
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
                            style: const TextStyle(color: AppColors.textBlack),
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
      ),
    );
  }
}

void showFavorAddModal(BuildContext context, FavorType type,
    {String? receivedFavorId}) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true, // スクロール制御を有効にして高さ調整
    backgroundColor: Colors.transparent, // 背景色を透明に
    builder: (BuildContext context) {
      return FavorAddModal(type: type, receivedFavorId: receivedFavorId);
    },
  );
}
