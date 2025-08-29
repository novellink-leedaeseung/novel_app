import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'bp_card_widget.dart';

Future<void> showBpLogSheet(BuildContext context) {
  return showModalBottomSheet(
    context: context,
    isScrollControlled: true, // 필요 시 전체 높이 사용 가능(고정에는 영향 없음)
    backgroundColor: Colors.transparent,
    barrierColor: Colors.black38,
    isDismissible: false, // 배리어 탭으로 닫히지 않음
    enableDrag: false,    // 모달 자체 드래그로 닫히지 않음
    builder: (context) {
      return WillPopScope(
        onWillPop: () async => false, // 시스템 뒤로가기 차단
        child: DraggableScrollableSheet(
          expand: true,
          initialChildSize: 0.92,
          minChildSize: 0.92, // 아래로 줄어들지 않도록 고정
          maxChildSize: 0.92, // 위로도 늘어나지 않도록 고정
          builder: (context, scrollController) {
            return Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                ),
                boxShadow: [
                  BoxShadow(color: Colors.black12, blurRadius: 20, offset: Offset(0, -6)),
                ],
              ),
              child: Column(
                children: [
                  const SizedBox(height: 24),
                  // 헤더
                  Row(
                    children: [
                      SizedBox(
                        height: 56.h,
                        child: Row(
                          children: [
                            ElevatedButton(onPressed: () { context.pop(); },
                            child: SvgPicture.asset("assets/icon/close.svg")),
                            const SizedBox(width: 106),
                            const Text(
                              '혈압기록',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color(0xFF227EFF),
                                fontFamily: 'Pretendard',
                                fontSize: 20,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w700,
                                height: 24 / 20,
                                letterSpacing: -0.5,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const Divider(height: 1),

                  // 리스트
                  Expanded(
                    child: ListView.separated(
                      controller: scrollController,
                      physics: const ClampingScrollPhysics(), // 탄성 스크롤 억제
                      padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
                      itemCount: 10,
                      separatorBuilder: (_, __) => const SizedBox(height: 16),
                      itemBuilder: (_, i) => const BpCard(),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      );
    },
  );
}