import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_neat_and_clean_calendar/flutter_neat_and_clean_calendar.dart';

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

  Future<void> _openCalendarDialog(BuildContext context) async {
    final picked = await showModalBottomSheet<DateTime>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      barrierColor: Colors.black38,
      isDismissible: true,
      enableDrag: false,
      builder: (ctx) {
        return _CalendarBottomSheet(
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
      onTap: onPressed ?? () => _openCalendarDialog(context),
      child: SizedBox(
        child: Center(
          child: Icon(Icons.calendar_month_rounded, size: size, color: color),
        ),
      ),
    );
  }
}

// 요청하신 헤더 위젯
class CalendarModalHeader extends StatelessWidget {
  const CalendarModalHeader({
    super.key,
    required this.onClose,
    required this.onToday,
  });

  final VoidCallback onClose;
  final VoidCallback onToday;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // 왼쪽 X 버튼
          IconButton(
            onPressed: onClose,
            icon: Image.asset(
              'assets/images/close.png', // 경로 미존재 시 기본 아이콘 대체
              width: 24,
              height: 24,
              errorBuilder: (_, __, ___) => const Icon(Icons.close, size: 24),
            ),
          ),

          // 오른쪽 "오늘" 버튼
          TextButton(
            onPressed: onToday,
            style: TextButton.styleFrom(
              foregroundColor: Colors.blue,
            ),
            child: Text(
              '오늘',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF227EFF),
                fontSize: 20,
                fontFamily: 'Pretendard',
                height: 0.06,
                letterSpacing: -0.50,
              ),
            )
          ),
        ],
      ),
    );
  }
}

class _CalendarBottomSheet extends StatelessWidget {
  _CalendarBottomSheet({
    required this.onPicked,
    this.initialDate,
  });

  final DateTime? initialDate;
  final ValueChanged<DateTime> onPicked;

  static const _headerHeight = 56.0;
  static const _dividerHeight = 1.0;

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      expand: true,
      initialChildSize: 0.92,
      minChildSize: 0.92,
      maxChildSize: 0.92,
      builder: (context, scrollController) {
        return Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24),
              topRight: Radius.circular(24),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 20,
                offset: Offset(0, -6),
              ),
            ],
          ),
          child: LayoutBuilder(
            builder: (context, constraints) {
              final sheetHeight = constraints.maxHeight;
              final calendarHeight =
                  sheetHeight - _headerHeight - _dividerHeight;

              return ListView(
                controller: scrollController,
                padding: EdgeInsets.zero,
                physics: const ClampingScrollPhysics(),
                children: [
                  CalendarModalHeader(
                    onClose: () => Navigator.of(context).pop(),
                    onToday: () {
                      final now = DateTime.now();
                      onPicked(DateTime(now.year, now.month, now.day));
                    },
                  ),
                  const Divider(height: _dividerHeight),

                  // 달력: 정확한 높이로 고정하여 intrinsic 오류 방지
                  SizedBox(
                    height: calendarHeight,
                    child: Calendar(
                      weekDays: const ['일', '월', '화', '수', '목', '금', '토'],
                      eventsList: _eventList,
                      showEvents: true,
                      isExpanded: true,
                      // 잘못된 로케일 오류 방지
                      locale: 'ko_KR',
                      // 초기 오픈을 특정 날짜로 맞추고 싶다면 컨트롤러 사용
                      onDateSelected: (date) {
                        // onPicked(DateTime(date.year, date.month, date.day));
                      },
                    ),
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }

  // todo 날짜에 이벤트 추가 나중엔 API 고려
  final List<NeatCleanCalendarEvent> _eventList = [
    NeatCleanCalendarEvent(
      '고혈압 1기',
      description: '148 / 128 mmHg 70 bpm',
      startTime: DateTime(
          DateTime.now().year, DateTime.now().month, DateTime.now().day-1, 10, 0),
      endTime: DateTime(DateTime.now().year, DateTime.now().month,
          DateTime.now().day-1, 10, 0),
      color: Colors.orange,
      isMultiDay: false,
    ),
    NeatCleanCalendarEvent(
      '고혈압 1기',
      description: '148 / 128 mmHg 70 bpm',
      startTime: DateTime(
          DateTime.now().year, DateTime.now().month, DateTime.now().day-3, 10, 0),
      endTime: DateTime(DateTime.now().year, DateTime.now().month,
          DateTime.now().day-3, 10, 0),
      color: Colors.orange,
      isMultiDay: false,
    ),
  ];
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