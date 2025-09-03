import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class ExampleCalendarButton extends StatefulWidget {
  const ExampleCalendarButton({super.key});

  @override
  State<ExampleCalendarButton> createState() => _ExampleCalendarButtonState();
}

class _ExampleCalendarButtonState extends State<ExampleCalendarButton> {
  DateTime? _selected;

  // todo 달력 디자인이 필요
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(_selected == null ? '날짜 없음' : _selected!.toIso8601String().split('T').first),
        TextButton(
          child: const Text('달력'), // 달력
          onPressed: () async {
            final picked = await showCompactCalendarDialog(
              context,
              initialDate: _selected,
            );
            if (picked != null) {
              setState(() => _selected = picked);
              // 필요하면 여기서 상위로 전달/콜백 호출 가능
            }
          },
        ),
      ],
    );
  }
}

Future<DateTime?> showCompactCalendarDialog(
    BuildContext context, {
      DateTime? initialDate,
      DateTime? firstDate,
      DateTime? lastDate,
    }) {
  final now = DateTime.now();
  final init = initialDate ?? DateTime(now.year, now.month, now.day);
  DateTime selectedDate = init; // 선택된 날짜를 저장할 변수

  return showDialog<DateTime>(
    context: context,
    barrierDismissible: true,
    builder: (ctx) {
      return Dialog(
        insetPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            minWidth: 280,
            maxWidth: 360,
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(12, 8, 12, 12),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // 헤더
                Row(
                  children: [
                    const SizedBox(width: 8),
                    const Expanded(
                      child: Text(
                        '날짜 선택',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    IconButton(
                      visualDensity: VisualDensity.compact,
                      icon: const Icon(Icons.close),
                      onPressed: () => Navigator.of(ctx).pop(),
                    ),
                  ],
                ),
                const SizedBox(height: 4),

                // 달력
                CalendarDatePicker(
                  initialDate: init,
                  firstDate: firstDate ?? DateTime(2000, 1, 1),
                  lastDate: lastDate ?? DateTime(2100, 12, 31),
                  onDateChanged: (d) {
                    // 날짜 선택시 바로 닫지 않고 선택된 날짜만 저장
                    selectedDate = DateTime(d.year, d.month, d.day);
                  },
                ),

                // 하단 액션 버튼들
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      child: const Text('오늘'),
                      onPressed: () {
                        final t = DateTime.now();
                        Navigator.of(ctx).pop(DateTime(t.year, t.month, t.day));
                      },
                    ),
                    TextButton(
                      child: const Text('확인'),
                      onPressed: () {
                        Navigator.of(ctx).pop(selectedDate);
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}