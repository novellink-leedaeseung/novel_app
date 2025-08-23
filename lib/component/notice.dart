import 'package:flutter/material.dart';

class Notice extends StatelessWidget {
  const Notice({super.key});

  @override
  Widget build(BuildContext context) {
    return           Expanded(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 15,
              horizontal: 24,
            ),
            child: SizedBox(
              width: 327,
              height: 90,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xff227eff), // 파란색 glow
                      blurRadius: 4, // 퍼짐 정도 (값 키울수록 부드럽게)
                      spreadRadius: 0, // 바깥으로 확장
                    ),
                  ],
                ),
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.white,
                    elevation: 3.0,
                    padding: EdgeInsets.zero,
                    side: BorderSide(color: Color(0xff227eff)),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
                  onPressed: () {},
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 12,
                          right: 12,
                          top: 14,
                        ),
                        child: SizedBox(
                          width: double.infinity,
                          height: 26,
                          child: Text(
                            "공지사항",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 12,
                          right: 12,
                          top: 11,
                        ),
                        child: SizedBox(
                          width: double.infinity,
                          height: 26,
                          child: Text(
                            "근로자의 날 오픈기념으로 이벤트 진행합니다!",
                            style: TextStyle(
                              color: Color(0xff227eff),
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
