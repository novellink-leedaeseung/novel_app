// lib/screen/bp/bp_log_sheet.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'bp_card_widget.dart';

Future<void> showBpLogSheet(BuildContext context) {
  return showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    barrierColor: Colors.black38,
    builder: (context) {
      return DraggableScrollableSheet(
        expand: true,
        initialChildSize: 0.92,
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
                          SizedBox(
                            width: 24.w,
                            height: 24.h,
                            child: IconButton(
                              onPressed: () => Navigator.of(context).pop(),
                              icon: SvgPicture.asset("assets/icon/close.svg"),
                            ),
                          ),
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
      );
    },
  );
}
