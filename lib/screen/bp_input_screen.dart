import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:novel/component/bp-input/bp_input_contraction_mmHg.dart';
import 'package:novel/component/bp-input/bp_input_time.dart';

import '../component/bp-input/bp_input_Measure.dart';
import '../component/bp-input/bp_input_top.dart';

Future<void> showBpInputModal(BuildContext context) {
  return showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    barrierColor: Colors.black38,
    builder: (context) {
      return Expanded(
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
              child: SingleChildScrollView(
                controller: scrollController,
                physics: const ClampingScrollPhysics(),
                child: const _BpInputContent(),
              ),
            );
          },
        ),
      );
    },
  );
}

class _BpInputContent extends StatelessWidget {
  const _BpInputContent();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 375,
      height: 812,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: Column(children: [
        // 닫기, 제목, 저장
        BpInputTop(),
        // 측정 시간, 측정 일자
        BpInputTime(),
        // 수축기
        // BpInputMmhg(),
        BpInputMeasure(label: '수축기 혈압', hint: '88', unit: 'mmHg'),
        // 이완기
        BpInputMeasure(label: '이완기 혈압', hint: '88', unit: 'mmHg'),
        // 맥박
        BpInputMeasure(label: '맥박', hint: '70', unit: 'bpm'),
      ]),
    );
  }
}
