import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TimePickerBox extends StatefulWidget {
  final String placeholder; // 초기 안내 문구
  final double width;
  final double height;

  const TimePickerBox({
    super.key,
    this.placeholder = "시간 선택",
    this.width = 158,
    this.height = 60,
  });

  @override
  State<TimePickerBox> createState() => _TimePickerBoxState();
}

class _TimePickerBoxState extends State<TimePickerBox> {
  TimeOfDay? _selectedTime;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        // 휠에서 시간만 바꿔도 즉시 값이 반환되어 텍스트가 갱신되도록 설정
        final picked = await showTimePickerModal(
          context,
          minuteInterval: 5,
          autoCloseOnPick: false,
        );
        if (picked != null) {
          setState(() {
            _selectedTime = picked;
          });
        }
      },
      child: Container(
        margin: const EdgeInsets.only(top: 8),
        width: widget.width,
        height: widget.height,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: const Color(0xFF505050),
            width: 0.5,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        alignment: Alignment.center,
        child: Text(
          _selectedTime != null
              ? _selectedTime!.format(context) // 선택된 시간 표시
              : widget.placeholder,            // 초기 안내 문구
          style: const TextStyle(fontSize: 16, color: Colors.black),
        ),
      ),
    );
  }
}

// 분을 interval에 맞게 정렬(내림)
DateTime _alignMinuteToInterval(DateTime dt, int interval) {
  final i = (interval >= 1 && interval <= 30 && 60 % interval == 0) ? interval : 1;
  final alignedMinute = (dt.minute ~/ i) * i;
  return DateTime(dt.year, dt.month, dt.day, dt.hour, alignedMinute);
}

Future<TimeOfDay?> showTimePickerModal(
  BuildContext context, {
  TimeOfDay? initialTime,
  int minuteInterval = 1,
  bool use24hFormat = true,
  bool autoCloseOnPick = false, // 시간을 바꾸는 즉시 반환할지 여부
}) async {
  // minuteInterval 안전 보정(60의 약수만 허용)
  final safeInterval =
      (minuteInterval >= 1 && minuteInterval <= 30 && 60 % minuteInterval == 0)
          ? minuteInterval
          : 1;

  final now = DateTime.now();
  final init = initialTime ?? TimeOfDay.now();

  // 초기 DateTime 생성 후 interval에 맞춰 분 보정 → assertion 에러 방지
  DateTime temp = DateTime(now.year, now.month, now.day, init.hour, init.minute);
  temp = _alignMinuteToInterval(temp, safeInterval);

  bool popped = false; // autoCloseOnPick 중복 pop 방지

  return await showModalBottomSheet<TimeOfDay>(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.white,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
    ),
    builder: (ctx) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // 상단 액션바
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: const BoxDecoration(
              border: Border(bottom: BorderSide(color: Color(0xFFEAEAEA))),
            ),
            child: Row(
              children: [
                TextButton(
                  onPressed: () => Navigator.pop(ctx),
                  child: const Text('취소'),
                ),
                const Spacer(),
                const Text(
                  '시간 선택',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                const Spacer(),
                TextButton(
                  onPressed: () {
                    final t = TimeOfDay(hour: temp.hour, minute: temp.minute);
                    Navigator.pop(ctx, t);
                  },
                  child: const Text('완료'),
                ),
              ],
            ),
          ),

          // 피커
          SizedBox(
            height: 216,
            child: CupertinoDatePicker(
              mode: CupertinoDatePickerMode.time,
              use24hFormat: use24hFormat,
              minuteInterval: safeInterval,
              initialDateTime: temp, // 보정된 초기값
              onDateTimeChanged: (dt) {
                temp = dt;
                if (autoCloseOnPick && !popped) {
                  popped = true;
                  final t = TimeOfDay(hour: dt.hour, minute: dt.minute);
                  Navigator.pop(ctx, t); // 시간을 바꾸는 즉시 반환
                }
              },
            ),
          ),
          const SizedBox(height: 12),
        ],
      );
    },
  );
}