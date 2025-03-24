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
  final ReceivedFavor? receivedFavor;

  const FavorAddModal({
    super.key,
    required this.type,
    this.receivedFavorId,
    this.receivedFavor,
  });

  @override
  _FavorAddModalState createState() => _FavorAddModalState();
}

class _FavorAddModalState extends ConsumerState<FavorAddModal> {
  final nameTextController = TextEditingController();
  final favorTextController = TextEditingController();
  final memoTextController = TextEditingController();
  DateTime selectedDate = DateTime.now();
  bool showCalendar = false;
  bool isButtonEnabled = false;

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

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    setState(() {
      selectedDate = selectedDay;
    });
  }

  void _onTextChanged() {
    setState(() {
      isButtonEnabled = nameTextController.text.trim().isNotEmpty &&
          favorTextController.text.trim().isNotEmpty;
    });
  }

  String _formatDate(DateTime date) {
    return "${date.year}年${date.month}月${date.day}日";
  }

  @override
  void initState() {
    super.initState();
    nameTextController.addListener(_onTextChanged);
    favorTextController.addListener(_onTextChanged);
  }

  @override
  void dispose() {
    nameTextController.removeListener(_onTextChanged);
    favorTextController.removeListener(_onTextChanged);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final favorDateString =
        "${selectedDate.year}/${selectedDate.month}/${selectedDate.day}";

    return Material(
      color: AppColors.backgroundModal,
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: CupertinoPageScaffold(
          navigationBar: CupertinoNavigationBar(
            backgroundColor: AppColors.backgroundModal,
            middle: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              child: Text(
                widget.type == FavorType.received ? "受けた恩を新規作成" : "返した恩を新規作成",
                style: TextStyle(
                  color: widget.type == FavorType.received
                      ? AppColors.primary
                      : AppColors.secondary,
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
                child: Text(
                  "キャンセル",
                  style: TextStyle(
                    color: widget.type == FavorType.received
                        ? AppColors.primary
                        : AppColors.secondary,
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
                        ? (widget.type == FavorType.received
                            ? Colors.orange
                            : Colors.lightBlue)
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
                    if (widget.type == FavorType.repaid &&
                        widget.receivedFavor != null)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'してもらったこと',
                            style: TextStyle(
                                fontSize: 14, color: AppColors.textGray),
                          ),
                          const SizedBox(height: 12),
                          Row(
                            children: [
                              CircleAvatar(
                                radius: 11,
                                backgroundColor: AppColors.primary,
                                child: const Icon(
                                  Icons.person_outline,
                                  size: 17,
                                  color: AppColors.backgroundWhite,
                                ),
                              ),
                              const SizedBox(width: 6),
                              Text(
                                widget.receivedFavor!.giverName,
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: AppColors.textField,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          Text(
                            widget.receivedFavor!.favorText,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 12),
                          Text(
                            _formatDate(widget.receivedFavor!.favorDate),
                            style: const TextStyle(
                              fontSize: 14,
                              color: AppColors.textField,
                            ),
                          ),
                          const SizedBox(height: 12),
                          const Divider(
                            height: 1,
                            thickness: 1,
                            color: AppColors.strokeGrey,
                          ),
                          const SizedBox(height: 12),
                          const Text(
                            'メモ',
                            style: TextStyle(
                                fontSize: 14, color: AppColors.textGray),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            widget.receivedFavor!.memo ?? '',
                            style: const TextStyle(
                                fontSize: 14, color: AppColors.textField),
                          ),
                        ],
                      ),
                    if (widget.type == FavorType.received) ...[
                      CupertinoTextField(
                        controller: nameTextController,
                        placeholder: "名前",
                        padding: const EdgeInsets.all(12),
                      ),
                      const SizedBox(height: 20),
                    ] else ...[
                      const SizedBox(height: 12),
                    ],
                    Container(
                      decoration: BoxDecoration(
                        color: AppColors.backgroundWhite,
                        borderRadius: BorderRadius.circular(8),
                        border:
                            Border.all(color: AppColors.strokeGrey, width: 0.5),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          CupertinoTextField(
                            controller: favorTextController,
                            placeholder: widget.type == FavorType.received
                                ? "してもらったこと"
                                : "したこと",
                            padding: const EdgeInsets.all(12),
                            decoration: const BoxDecoration(),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            child: Container(
                              height: 0.5,
                              color: AppColors.strokeGrey,
                            ),
                          ),
                          CupertinoTextField(
                            controller: memoTextController,
                            placeholder: "メモ",
                            padding: const EdgeInsets.all(12),
                            decoration: const BoxDecoration(),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
                      decoration: BoxDecoration(
                        color: AppColors.backgroundWhite,
                        borderRadius: BorderRadius.circular(5),
                        border:
                            Border.all(color: AppColors.strokeGrey, width: 0.5),
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Icon(
                                CupertinoIcons.calendar,
                                color: showCalendar
                                    ? (widget.type == FavorType.received
                                        ? AppColors.primary
                                        : AppColors.secondary)
                                    : AppColors.textField,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                widget.type == FavorType.received
                                    ? "してもらった日"
                                    : "した日",
                                style: TextStyle(
                                  color: showCalendar
                                      ? (widget.type == FavorType.received
                                          ? AppColors.primary
                                          : AppColors.secondary)
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
                                activeColor: Colors.green,
                              ),
                            ],
                          ),
                          AnimatedSize(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                            child: showCalendar
                                ? Column(
                                    children: [
                                      const SizedBox(height: 8),
                                      Text(
                                        "選択した日: $favorDateString",
                                        style: const TextStyle(
                                            color: AppColors.textBlack),
                                      ),
                                      const SizedBox(height: 8),
                                      TableCalendar(
                                        firstDay: DateTime.utc(2000, 1, 1),
                                        lastDay: DateTime.utc(2101, 12, 31),
                                        focusedDay: selectedDate,
                                        selectedDayPredicate: (day) =>
                                            isSameDay(day, selectedDate),
                                        onDaySelected: _onDaySelected,
                                      ),
                                    ],
                                  )
                                : const SizedBox.shrink(),
                          ),
                        ],
                      ),
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
    {String? receivedFavorId, ReceivedFavor? receivedFavor}) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: AppColors.backgroundModal,
    builder: (BuildContext context) {
      return FractionallySizedBox(
        heightFactor: 0.93, // 高さの割合（80%）
        child: FavorAddModal(
          type: type,
          receivedFavorId: receivedFavorId,
          receivedFavor: receivedFavor,
        ),
      );
    },
  );
}
