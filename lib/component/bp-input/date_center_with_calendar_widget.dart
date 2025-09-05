import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart'; // SvgPicture 사용을 위한 import
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_neat_and_clean_calendar/flutter_neat_and_clean_calendar.dart';

// CalendarBottomSheet가 선언된 파일 import
import 'package:novel/component/bp-input/date_center_with_calendar_widget.dart'; // DateCenterWithCalendar 사용을 위해 추가

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

  void _openCalendarDialog(BuildContext context) {
    // 닫히지 않으므로 await하지 않습니다.
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      barrierColor: Colors.black38,
      isDismissible: false, // 창 닫힘 방지
      enableDrag: false,    // 드래그 닫힘 방지
      builder: (ctx) {
        return CalendarBottomSheet(
          initialDate: initialDate,
          // 선택 이벤트만 상위로 전달, 닫지는 않음
          onPicked: (d) => onDatePicked?.call(d),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed ?? () => _openCalendarDialog(context),
      child: SizedBox(
        child: Center(
          child: SvgPicture.asset("assets/icon/calendar.svg"),
        ),
      ),
    );
  }
}

// todo 날짜에 이벤트 추가 나중엔 API 고려
final List<NeatCleanCalendarEvent> _eventList = [
  NeatCleanCalendarEvent(
    '고혈압 1기',
    description: '148 / 128 mmHg 70 bpm',
    startTime: DateTime(
      DateTime
          .now()
          .year,
      DateTime
          .now()
          .month,
      DateTime
          .now()
          .day - 1,
      00,
      0,
    ),
    endTime: DateTime(
      DateTime
          .now()
          .year,
      DateTime
          .now()
          .month,
      DateTime
          .now()
          .day - 1,
      00,
      0,
    ),
    color: Colors.orange,
    isMultiDay: false,
    metadata: {"type": "edit"},
  ),
  NeatCleanCalendarEvent(
    '고혈압 1기',
    description: '148 / 128 mmHg 70 bpm',
    startTime: DateTime(
      DateTime
          .now()
          .year,
      DateTime
          .now()
          .month,
      DateTime
          .now()
          .day - 3,
      10,
      0,
    ),
    endTime: DateTime(
      DateTime
          .now()
          .year,
      DateTime
          .now()
          .month,
      DateTime
          .now()
          .day - 3,
      10,
      0,
    ),
    color: Colors.orange,
    isMultiDay: false,
  ),
];

class CalendarBottomSheet extends StatefulWidget {
  const CalendarBottomSheet({required this.onPicked, this.initialDate, super.key});

  final DateTime? initialDate;
  final ValueChanged<DateTime> onPicked;

  @override
  State<CalendarBottomSheet> createState() => _CalendarBottomSheetState();
}

class _CalendarBottomSheetState extends State<CalendarBottomSheet> {
  late DateTime _selectedDate;

  static const _headerHeight = 56.0;
  static const _dividerHeight = 1.0;

  @override
  void initState() {
    super.initState();
    final init = widget.initialDate ?? DateTime.now();
    _selectedDate = DateTime(init.year, init.month, init.day);
  }

  void _selectDate(DateTime d) {
    final onlyDate = DateTime(d.year, d.month, d.day);
    setState(() => _selectedDate = onlyDate);
    widget.onPicked(onlyDate); // 외부에 알림 (창은 닫지 않음)
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false, // 뒤로가기 닫힘 방지
      child: DraggableScrollableSheet(
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
                final calendarHeight = sheetHeight - _headerHeight - _dividerHeight;

                return ListView(
                  controller: scrollController,
                  padding: EdgeInsets.zero,
                  physics: const ClampingScrollPhysics(),
                  children: [
                    // CalendarModalHeader 대체: 동일 스타일 인라인
                    SizedBox(
                      width: double.infinity,
                      height: 56,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            onPressed: () {
                              // 스타일 유지: X 버튼 동작 막음 (창 닫히지 않게)
                            },
                            icon: Image.asset(
                              'assets/images/close.png',
                              width: 24,
                              height: 24,
                              errorBuilder: (_, __, ___) => const Icon(Icons.close, size: 24),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              final now = DateTime.now();
                              _selectDate(DateTime(now.year, now.month, now.day)); // 오늘 선택
                            },
                            style: TextButton.styleFrom(foregroundColor: Colors.blue),
                            child: const Text(
                              '오늘',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color(0xFF227EFF),
                                fontSize: 20,
                                fontFamily: 'Pretendard',
                                height: 0.06,
                                letterSpacing: -0.50,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Divider(height: _dividerHeight),

                    SizedBox(
                      height: calendarHeight,
                      child: Calendar(
                        todayButtonText: "",
                        showEventListViewIcon: false,
                        allDayEventText: 'test',
                        weekDays: const ['일', '월', '화', '수', '목', '금', '토'],
                        eventListBuilder: (
                          BuildContext context,
                          List<NeatCleanCalendarEvent> selectedEvents,
                        ) {
                          return Column(
                            children: [
                              Container(
                                width: 375.w,
                                height: 24.h,
                                color: const Color(0xff227EFF),
                                child: SizedBox(
                                  width: 311.w,
                                  height: 22.h,
                                  child: Text(
                                    style: const TextStyle(color: Colors.white),
                                    textAlign: TextAlign.center,
                                    "${_selectedDate.year}년 ${_selectedDate.month}월 ${_selectedDate.day}일",
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 15),
                                child: (selectedEvents.isNotEmpty)
                                    ? Container(
                                        width: 375,
                                        height: 56,
                                        decoration: BoxDecoration(
                                          color: const Color(0xffF4F4F4),
                                          borderRadius: BorderRadius.circular(8),
                                        ),
                                        child: Row(
                                          children: [
                                            Container(
                                              width: 10,
                                              height: 56,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(999),
                                                color: const Color(0xffe5621c),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(left: 6),
                                              child: Row(
                                                children: [
                                                  Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: [
                                                      SizedBox(
                                                        width: 80,
                                                        height: 20,
                                                        child: Row(
                                                          mainAxisSize: MainAxisSize.min,
                                                          mainAxisAlignment: MainAxisAlignment.start,
                                                          crossAxisAlignment: CrossAxisAlignment.center,
                                                          children: [
                                                            Padding(
                                                              padding: const EdgeInsets.only(top: 4, bottom: 4.5),
                                                              child: SizedBox(
                                                                width: 54,
                                                                height: 20,
                                                                child: const Text(
                                                                  '고혈압1기',
                                                                  style: TextStyle(
                                                                    color: Color(0xFFE5621C),
                                                                    fontSize: 14,
                                                                    fontFamily: 'Pretendard',
                                                                    height: 0.12,
                                                                    letterSpacing: -0.35,
                                                                    fontWeight: FontWeight.w500,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        width: 97,
                                                        height: 16,
                                                        child: Text(
                                                          '측정 필요',
                                                          style: TextStyle(
                                                            color: Color(0xFF333333),
                                                            fontSize: 12,
                                                            fontFamily: 'Pretendard',
                                                            height: 0.13,
                                                            letterSpacing: -0.30,
                                                            fontWeight: FontWeight.w500,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    : Container(),
                              ),
                            ],
                          );
                        },
                        eventsList: _eventList,
                        showEvents: true,
                        isExpanded: true,
                        locale: 'ko_KR',
                        onDateSelected: (DateTime date) {
                          _selectDate(date); // 오늘 버튼/날짜 선택 시 상단 날짜와 콜백만 갱신(창은 닫히지 않음)
                        },
                      ),
                    ),
                  ],
                );
              },
            ),
          );
        },
      ),
    );

  }

}

