import 'package:flutter/material.dart';

/// 캡슐형 세그먼트 (최근 / 월 / 년)
class BpSegmentedSwitch extends StatefulWidget {
  const BpSegmentedSwitch({
    super.key,
    this.items = const ['최근', '월', '년'],
    this.initialIndex = 0,
    this.onChanged,
    this.height = 40,
    this.padding = const EdgeInsets.fromLTRB(24, 10, 24, 10), // ⬅️ 좌우24 / 상하10
  });

  final List<String> items;
  final int initialIndex;
  final ValueChanged<int>? onChanged;
  final double height;
  final EdgeInsets padding;

  @override
  State<BpSegmentedSwitch> createState() => _BpSegmentedSwitchState();
}

class _BpSegmentedSwitchState extends State<BpSegmentedSwitch> {
  static const _blue = Color(0xFF227EFF);
  late int _index;

  @override
  void initState() {
    super.initState();
    _index = widget.initialIndex.clamp(0, widget.items.length - 1);
  }

  @override
  Widget build(BuildContext context) {
    final radius = BorderRadius.circular(widget.height / 2);

    return Padding(
      padding: widget.padding, // ⬅️ 바깥 여백(피그마 24/10)
      child: SizedBox(
        height: widget.height,
        child: LayoutBuilder(
          builder: (context, c) {
            final segW = c.maxWidth / widget.items.length;

            return Stack(
              children: [
                // 바깥 흰색 캡슐 + 그림자
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: radius,
                    boxShadow: const [
                      BoxShadow(
                        color: Color(0x26000000), // 15~20% 검정
                        blurRadius: 18,
                        offset: Offset(0, 8),
                      ),
                    ],
                  ),
                ),

                // 선택된 파란 캡슐(애니메이션 이동)
                AnimatedPositioned(
                  duration: const Duration(milliseconds: 220),
                  curve: Curves.easeOut,
                  left: segW * _index,
                  top: 0,
                  width: segW,
                  height: widget.height,
                  child: Container(
                    margin: const EdgeInsets.all(6), // 흰 캡슐 안쪽에 여백
                    decoration: BoxDecoration(
                      color: _blue,
                      borderRadius: radius,
                      boxShadow: [
                        BoxShadow(
                          color: _blue.withOpacity(0.35),
                          blurRadius: 16,
                          offset: const Offset(0, 6),
                        ),
                      ],
                    ),
                  ),
                ),

                // 클릭 영역 + 라벨
                Row(
                  children: List.generate(widget.items.length, (i) {
                    final selected = i == _index;
                    return Expanded(
                      child: InkWell(
                        borderRadius: radius,
                        onTap: () {
                          if (_index == i) return;
                          setState(() => _index = i);
                          widget.onChanged?.call(i);
                        },
                        child: Center(
                          child: AnimatedDefaultTextStyle(
                            duration: const Duration(milliseconds: 150),
                            style: TextStyle(
                              fontFamily: 'Pretendard',
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              height: 24 / 20,
                              letterSpacing: -0.5,
                              color: selected ? Colors.white : _blue,
                            ),
                            child: Text(widget.items[i]),
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
