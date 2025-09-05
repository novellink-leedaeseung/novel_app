// dart
import 'package:flutter/material.dart';
import 'package:flutter_neat_and_clean_calendar/flutter_neat_and_clean_calendar.dart';

class CalendarBottomSheet extends StatefulWidget {
  const CalendarBottomSheet({
    super.key,
    required this.onPicked,
    this.initialDate,
    this.eventsList,
  });

  final DateTime? initialDate;
  final ValueChanged<DateTime> onPicked;
  final List<NeatCleanCalendarEvent>? eventsList;

  @override
  State<CalendarBottomSheet> createState() => _CalendarBottomSheetState();
}

class _CalendarBottomSheetState extends State<CalendarBottomSheet> {
  late DateTime _selectedDate;

  static const _headerHeight = 56.0;
  static const _dividerHeight = 1.0;

  // 기본 이벤트(없으면 빈 리스트로)
  List<NeatCleanCalendarEvent> get _events =>
      widget.eventsList ?? const <NeatCleanCalendarEvent>[];

  @override
  void initState() {
    super.initState();
    final init = widget.initialDate ?? DateTime.now();
    _selectedDate = DateTime(init.year, init.month, init.day);
  }

  void _selectDate(DateTime d) {
    final onlyDate = DateTime(d.year, d.month, d.day);
    setState(() => _selectedDate = onlyDate);
    widget.onPicked(onlyDate);
  }

  void _selectToday() {
    final now = DateTime.now();
    _selectDate(DateTime(now.year, now.month, now.day));
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false, // 뒤로가기 닫힘 방지(필요 시 true로)
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
                    SizedBox(
                      width: double.infinity,
                      height: _headerHeight,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            // 자산 누락 대비: 기본 아이콘 사용
                            onPressed: () => Navigator.of(context).pop(),
                            icon: const Icon(Icons.close, size: 24),
                          ),
                          TextButton(
                            onPressed: _selectToday,
                            child: const Text(
                              '오늘',
                              style: TextStyle(
                                color: Color(0xFF227EFF),
                                fontSize: 20,
                                fontFamily: 'Pretendard',
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
                        weekDays: const ['일', '월', '화', '수', '목', '금', '토'],
                        todayButtonText: '오늘',
                        locale: 'ko_KR',
                        isExpanded: true,
                        showEvents: true,
                        showEventListViewIcon: false,
                        eventsList: _events,
                        onDateSelected: (date) => _selectDate(date),
                        onTodayButtonPressed: (_) => _selectToday(),
                        eventListBuilder: (
                          BuildContext context,
                          List<NeatCleanCalendarEvent> selectedEvents,
                        ) {
                          return Column(
                            children: [
                              Container(
                                width: double.infinity,
                                padding: const EdgeInsets.symmetric(vertical: 2),
                                color: const Color(0xFF227EFF),
                                child: Text(
                                  "${_selectedDate.year}년 ${_selectedDate.month}월 ${_selectedDate.day}일",
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ),
                              if (selectedEvents.isNotEmpty)
                                Padding(
                                  padding: const EdgeInsets.only(top: 12.0),
                                  child: Container(
                                    height: 56,
                                    decoration: BoxDecoration(
                                      color: const Color(0xffF4F4F4),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Row(
                                      children: [
                                        Container(
                                          width: 10,
                                          height: double.infinity,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(999),
                                            color: selectedEvents.first.color,
                                          ),
                                        ),
                                        const SizedBox(width: 8),
                                        Expanded(
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                selectedEvents.first.summary,
                                                style: TextStyle(
                                                  color: selectedEvents.first.color,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                              if (selectedEvents.first.description != null)
                                                Text(
                                                  selectedEvents.first.description!,
                                                  style: const TextStyle(
                                                    color: Color(0xFF333333),
                                                    fontSize: 12,
                                                  ),
                                                ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                            ],
                          );
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
