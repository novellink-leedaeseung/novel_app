// lib/screen/bp/date_widgets.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CalendarIconButton extends StatelessWidget {
  const CalendarIconButton({
    super.key,
    this.onPressed,
    this.initialDate,
    this.onDatePicked,
    this.color = const Color(0xFF0B1E38),
    this.size = 24,
  });

  final VoidCallback? onPressed;
  final DateTime? initialDate;
  final ValueChanged<DateTime>? onDatePicked;
  final Color color;
  final double size;

  Future<void> _openPicker(BuildContext context) async {
    final now = DateTime.now();
    final picked = await showDatePicker(
      context: context,
      initialDate: initialDate ?? now,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null && onDatePicked != null) onDatePicked!(picked);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed ?? () => _openPicker(context),
      child: SizedBox(
        child: Center(
          child: Icon(Icons.calendar_month_rounded, size: size, color: color),
        ),
      ),
    );
  }
}

class DateCenterWithCalendar extends StatelessWidget {
  const DateCenterWithCalendar({
    super.key,
    required this.dateText,
    this.initialDate,
    this.onDatePicked,
    this.color = const Color(0xFF0B1E38),
  });

  final String dateText;
  final DateTime? initialDate;
  final ValueChanged<DateTime>? onDatePicked;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          dateText,
          style: const TextStyle(
            color: Color(0xFF0D1B34),
            fontSize: 16,
            fontWeight: FontWeight.w600,
            fontFamily: 'Pretendard',
            height: 1.2,
            letterSpacing: -0.40,
          ),
        ),
        SizedBox(width: 6.w),
        CalendarIconButton(
          initialDate: initialDate,
          onDatePicked: onDatePicked,
          color: color,
        ),
      ],
    );
  }
}
