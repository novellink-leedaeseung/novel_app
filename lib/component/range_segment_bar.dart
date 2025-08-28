import 'package:flutter/material.dart';

/// 다색 구간 그래프 바 (세그먼트형)
class RangeSegmentBar extends StatelessWidget {
  RangeSegmentBar({
    super.key,
    required this.colors,               // 각 구간 색상 (예: [초록, 노랑, 주황, 빨강, 보라])
    this.weights,                       // 각 구간 비율(합계 아무 값이나 OK) 없으면 균등
    this.height = 24,
    this.radius = 999,
    this.showBorder = true,
    this.indicator,                     // 0.0 ~ 1.0, null이면 표시 안함
    this.indicatorWidth = 3,
    this.indicatorColor = Colors.black,
    this.shadow = const BoxShadow(
      color: Color(0x26000000),         // 15% 검정
      blurRadius: 16,
      offset: Offset(0, 6),
    ),
  }) : assert(weights == null || colors.length == weights!.length);

  final List<Color> colors;
  final List<double>? weights;
  final double height;
  final double radius;
  final bool showBorder;
  final double? indicator;              // 0~1
  final double indicatorWidth;
  final Color indicatorColor;
  final BoxShadow shadow;

  @override
  Widget build(BuildContext context) {
    final w = weights ?? List<double>.filled(colors.length, 1);

    return Container(
      // 바깥 그림자
      decoration: BoxDecoration(boxShadow: [shadow]),
      child: SizedBox(
        height: height,
        child: LayoutBuilder(
          builder: (context, c) {
            final total = w.fold<double>(0, (a, b) => a + b);
            final r = BorderRadius.circular(radius);

            return Stack(
              children: [
                // 구간 색상
                ClipRRect(
                  borderRadius: r,
                  child: Row(
                    children: List.generate(colors.length, (i) {
                      final flex = ((w[i] / total) * 1000).round().clamp(1, 1000);
                      return Expanded(
                        flex: flex,
                        child: Container(color: colors[i]),
                      );
                    }),
                  ),
                ),

                // 테두리
                if (showBorder)
                  Positioned.fill(
                    child: IgnorePointer(
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          borderRadius: r,
                          border: Border.all(color: Colors.black.withOpacity(0.08), width: 1),
                        ),
                      ),
                    ),
                  ),

                // 인디케이터(세로 바)
                if (indicator != null)
                  Positioned(
                    left: (indicator!.clamp(0.0, 1.0)) * c.maxWidth - (indicatorWidth / 2),
                    top: 3,
                    bottom: 3,
                    child: Container(
                      width: indicatorWidth,
                      decoration: BoxDecoration(
                        color: indicatorColor,
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                  ),
              ],
            );
          },
        ),
      ),
    );
  }
}
