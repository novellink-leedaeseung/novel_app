import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


// 환영메시지, 기업회원 버튼
class WelcomeBanner extends StatelessWidget {
  const WelcomeBanner({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: Size(375, 812));

    return Container(
      margin: EdgeInsets.only(left: 24, bottom: 14, top: 14),
      child: Row(
        children: [
          SizedBox(
            width: 190.w,
            height: 42.h,
            child: Text(
              "메디터치 오신 걸 환영합니다. 스마트하게 건강 관리하세요!",
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),

          SizedBox(
            width: 88.w,
            height: 24.h,
            child: Row(
              children: [
                Image.asset(
                  "assets/images/icon/office.png",
                  width: 24.w,
                  height: 24.h,
                ),
                Text(
                  "기업회원 전환",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
