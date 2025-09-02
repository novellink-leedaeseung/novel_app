import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TimePickerBox extends StatefulWidget {
  final String placeholder;       // 초기 안내 문구
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
        final picked = await showTimePickerModal(context, minuteInterval: 5);
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

Future<TimeOfDay?> showTimePickerModal(
    BuildContext context, {
      TimeOfDay? initialTime,
      int minuteInterval = 1,
      bool use24hFormat = true,
    }) async {
  final now = DateTime.now();
  final init = initialTime ?? TimeOfDay.now();

  DateTime temp = DateTime(
    now.year,
    now.month,
    now.day,
    init.hour,
    init.minute,
  );

  return await showModalBottomSheet<TimeOfDay>(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.white,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
    ),
    builder: (ctx) {
      return SafeArea(
        top: false,
        child: Column(
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
                minuteInterval: minuteInterval,
                initialDateTime: temp,
                onDateTimeChanged: (dt) => temp = dt,
              ),
            ),
            const SizedBox(height: 12),
          ],
        ),
      );
    },
  );
}
