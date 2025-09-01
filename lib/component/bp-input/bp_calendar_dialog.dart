import 'package:flutter/material.dart';

Future<DateTime?> showCompactCalendarDialog(
  BuildContext context, {
  DateTime? initialDate,
  DateTime? firstDate,
  DateTime? lastDate,
}) {
  final now = DateTime.now();
  final init = initialDate ?? DateTime(now.year, now.month, now.day);

  return showDialog<DateTime>(
    context: context,
    barrierDismissible: true, // 다이얼로그 바깥 탭으로 닫기 허용
    builder: (ctx) {
      return Dialog(
        insetPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            minWidth: 280,
            maxWidth: 360, // 조그만한 창 크기
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
                    // 날짜 탭하면 즉시 반환(다이얼로그 닫힘)
                    Navigator.of(ctx).pop(DateTime(d.year, d.month, d.day));
                  },
                ),

                // 하단 빠른 액션
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
