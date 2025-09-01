import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'bp_calendar_dialog.dart';

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
