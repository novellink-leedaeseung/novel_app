import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_neat_and_clean_calendar/flutter_neat_and_clean_calendar.dart'
    as nc;

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

  Future<void> _openCalendarSheet(BuildContext context) async {
    final picked = await showModalBottomSheet<DateTime>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (ctx) {
        return _CalendarSheet(
          initialDate: initialDate,
          onPicked: (d) => Navigator.of(ctx).pop(d),
        );
      },
    );

    if (picked != null && onDatePicked != null) {
      onDatePicked!(picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed ?? () => _openCalendarSheet(context),
      child: SizedBox(
        child: Center(
          child: Icon(Icons.calendar_month_rounded, size: size, color: color),
        ),
      ),
    );
  }
}

class _CalendarSheet extends StatelessWidget {
  const _CalendarSheet({
    required this.onPicked,
    this.initialDate,
  });

  final DateTime? initialDate;
  final ValueChanged<DateTime> onPicked;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 0.65;

    return SafeArea(
      top: false,
      child: Container(
        height: height,
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
        child: Column(
          children: [
            // 상단 헤더
            Row(
              children: [
                const Expanded(
                  child: Text(
                    '날짜 선택',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF0D1B34),
                    ),
                  ),
                ),
                IconButton(
                  visualDensity: VisualDensity.compact,
                  icon: const Icon(Icons.close),

                  onPressed: () => Navigator.of(context).pop(),
                ),
              ],
            ),
            const SizedBox(height: 8),
            // 달력만 표시 (이벤트 리스트/불필요 옵션 제거)
            Expanded(
              child: nc.Calendar(
                // 최소 옵션만 사용
                startOnMonday: true,
                // 한국어 주간 표기
                weekDays: const ['월', '화', '수', '목', '금', '토', '일'],
                // 이벤트 필요 없으면 빈 리스트
                eventsList: const <nc.NeatCleanCalendarEvent>[],
                // 달력만 보이도록
                showEvents: false,
                isExpanded: true,
                // 선택 즉시 전달 후 닫기
                onDateSelected: (date) {
                  // initialDate 기준 월로 최초 오픈을 맞추고 싶다면 패키지 컨트롤러 사용 고려
                  // onPicked(DateTime(date.year, date.month, date.day));
                },
              ),
            ),
          ],
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