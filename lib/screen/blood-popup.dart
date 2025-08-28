import 'package:flutter/material.dart';

class BloodPopup extends StatelessWidget {
  const BloodPopup({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }

  Future<void> openBpLogSheet(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,                 // 높이 크게
      backgroundColor: Colors.transparent,      // 모달 바탕 투명
      barrierColor: Colors.black54,             // 뒤 배경 딤
      builder: (context) {
        return DraggableScrollableSheet(
          expand: false,
          initialChildSize: 0.88,               // 처음 높이(88%)
          minChildSize: 0.5,
          maxChildSize: 0.95,
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
              child: Column(
                children: [
                  const SizedBox(height: 8),
                  // 상단 핸들
                  Container(
                    width: 72, height: 6,
                    decoration: BoxDecoration(
                      color: Colors.black26,
                      borderRadius: BorderRadius.circular(3),
                    ),
                  ),
                  // 헤더 (닫기 + 가운데 타이틀)
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8, 10, 8, 6),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: IconButton(
                            icon: const Icon(Icons.close, color: Color(0xff227EFF)),
                            onPressed: () => Navigator.pop(context),
                          ),
                        ),
                        const Text(
                          '혈압기록',
                          style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w700,
                            color: Color(0xff227EFF),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Divider(height: 1),
                  // 리스트
                  Expanded(
                    child: ListView.separated(
                      controller: scrollController,
                      padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
                      itemCount: 10,
                      separatorBuilder: (_, __) => const SizedBox(height: 16),
                      itemBuilder: (_, i) => const _BpCard(),
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
}



