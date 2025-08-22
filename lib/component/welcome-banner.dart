import 'package:flutter/material.dart';

// 환영메시지, 기업회원 버튼
class WelcomeBanner extends StatelessWidget {
  const WelcomeBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return               Container(
      margin: EdgeInsets.only(left: 24, bottom: 14),
      child: Row(
        children: [
          SizedBox(
            width: 190,
            height: 42,
            child: Text(
              "메디터치 오신걸 환영합니다. 스마트하게 건강 관리하세요!",
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),

          Expanded(
            child: Container(
              margin: EdgeInsets.only(left: 35),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Image.asset(
                    "assets/images/icon/office.png",
                    width: 24,
                    height: 24,
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "기업회원 전환",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
