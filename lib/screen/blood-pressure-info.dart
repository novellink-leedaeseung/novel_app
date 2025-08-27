import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:novel/component/bottom-bar.dart';
import 'package:novel/iPhone_top.dart';
import 'package:novel/primary-color.dart';
import 'package:novel/screen/home_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BloodPressureInfo extends StatefulWidget {
  const BloodPressureInfo({super.key});

  @override
  State<BloodPressureInfo> createState() => _BloodPressureInfoState();
}

class _BloodPressureInfoState extends State<BloodPressureInfo> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: Size(375, 812));

    return Scaffold(
      // backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IphoneTop(),
          // 스크롤바
          Expanded(
            child: Container(
              color: Colors.white,
              // 배경화면 모두 흰색으로
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  // 혈압 ( app bar )
                  // 이전, 혈압 제목
                  Container(
                    color: Color(0xff227EFF),
                    width: 375.w,
                    height: 56.h,
                    child: Row(
                      children: [
                        // 이전 아이콘
                        Container(
                          margin: EdgeInsets.only(left: 24),
                          child: SvgPicture.asset(
                            "assets/icon/back.svg",
                            width: 24.w,
                            height: 24.h,
                          ),
                        ),
                        // 혈압
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 107),
                          child: Text(
                            "혈압",
                            style: const TextStyle(
                              fontFamily: "Pretendard",
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Color(0xffFFFFFF),
                              height: 24 / 20,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        // 목록
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            "목록",
                            style: const TextStyle(
                              fontFamily: "Pretendard",
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                              color: Color(0xffFFFFFF),
                              height: 24 / 20,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                  // 현재 날짜, 달려
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.symmetric(vertical: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "2025.08.15",
                          style: const TextStyle(
                            fontFamily: "Pretendard",
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff0d1b34),
                            height: 24 / 16,
                          ),
                        ),
                        Container(
                          width: 24.w,
                          height: 24.h,
                          margin: EdgeInsets.symmetric(
                            vertical: 3,
                            horizontal: 5,
                          ),
                          child: SvgPicture.asset(
                            "assets/icon/calendar.svg",
                          ), // todo 버튼으로 교체 해야됨
                        ),
                      ],
                    ),
                  ),
                  // 고혈압 1기, 맥박
                  Container(
                    color: Colors.white,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // 고혈압 1기
                        Container(
                          width: 156,
                          height: 125,
                          decoration: ShapeDecoration(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            shadows: [
                              BoxShadow(
                                color: Color(0x3F000000),
                                blurRadius: 4,
                                offset: Offset(0, 2),
                                spreadRadius: 0,
                              ),
                            ],
                          ),
                          child: Container(
                            decoration: grayBoxDecoration(),
                            width: 156,
                            height: 125,
                            child: Column(
                              children: [
                                Text("고혈압 수치"),
                                Expanded(
                                  child: Align(
                                    alignment: Alignment.bottomRight,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                        bottom: 10,
                                        right: 10,
                                      ),
                                      child: Text(
                                        "고혈압 1기",
                                        style: TextStyle(
                                          color: PrimaryColor.orange,
                                          fontWeight: FontWeight.w700,
                                          fontSize: 20,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        // 맥박
                        Container(
                          margin: EdgeInsets.only(left: 15),
                          decoration: grayBoxDecoration(),
                          width: 156.w,
                          height: 125.h,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                    top: 10,
                                    left: 10,
                                  ),
                                  child: Container(
                                    decoration: heartBoxDecoration(
                                      color: PrimaryColor.pink,
                                    ),
                                    width: 38,
                                    height: 38,
                                    child: Image.asset(
                                      "assets/icon/heart-red.png",
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                width: 55.w,
                                height: 46.h,
                                margin: EdgeInsets.only(left: 91, top: 21),
                                child: Column(
                                  children: [
                                    SizedBox(
                                      width: 55,
                                      height: 12,
                                      child: Text.rich(
                                        TextSpan(
                                          children: [
                                            TextSpan(
                                              text: '70 ',
                                              style: TextStyle(
                                                color: Color(0xFF0D1B34),
                                                fontSize: 20,
                                                fontFamily: 'Pretendard',
                                                height: 0.06,
                                                letterSpacing: -0.50,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                            TextSpan(
                                              text: 'bpm',
                                              style: TextStyle(
                                                color: Color(0xFF8C8C8C),
                                                fontSize: 14,
                                                fontFamily: 'Pretendard',
                                                height: 0.11,
                                                letterSpacing: -0.35,
                                              ),
                                            ),
                                          ],
                                        ),
                                        textAlign: TextAlign.right,
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.centerRight,
                                      child: Text(
                                        "맥박",
                                        style: const TextStyle(
                                          fontFamily: "Pretendard",
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xff626262),
                                          height: 24 / 14,
                                        ),
                                        textAlign: TextAlign.right,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  // 수축기 혈압, 이완기 혈압
                  Container(
                    margin: EdgeInsets.only(top: 15),
                    color: Colors.white,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // 수축기 혈압
                        Container(
                          width: 156,
                          height: 125,
                          decoration: grayBoxDecoration(),
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                    top: 10,
                                    left: 10,
                                  ),
                                  child: Container(
                                    decoration: heartBoxDecoration(
                                      color: PrimaryColor.pink,
                                    ),
                                    width: 38,
                                    height: 38,
                                    child: Image.asset(
                                      "assets/icon/heart-red.png",
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  top: 16,
                                  bottom: 10,
                                  right: 3,
                                  left: 60,
                                ),
                                child: SizedBox(
                                  width: 80,
                                  height: 46,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Text(
                                            "148",
                                            style: TextStyle(
                                              fontFamily: "Pretendard",
                                              color: Colors.black,
                                              fontSize: 20,
                                              fontWeight: FontWeight.w700,
                                              height: 20 / 22,
                                              letterSpacing: -0.4,
                                            ),
                                          ),
                                          Text(
                                            " mmHg",
                                            style: const TextStyle(
                                              fontFamily: "Pretendard",
                                              fontWeight: FontWeight.w400,
                                              fontSize: 14,
                                              height: 22 / 22,
                                              letterSpacing: -0.4,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Text(
                                        "수축기 혈압",
                                        style: const TextStyle(
                                          fontFamily: "Pretendard",
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xff626262),
                                          height: 24 / 14,
                                          letterSpacing: -0.4,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15),
                          // 이완기 혈압
                          child: Container(
                            width: 156,
                            height: 125,
                            decoration: grayBoxDecoration(),
                            child: Column(
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                      top: 10,
                                      left: 10,
                                    ),
                                    child: Container(
                                      decoration: heartBoxDecoration(
                                        color: PrimaryColor.cloudyBlue,
                                      ),
                                      width: 38,
                                      height: 38,
                                      child: Image.asset(
                                        "assets/icon/heart-blue.png",
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    top: 16,
                                    bottom: 10,
                                    right: 3,
                                    left: 60,
                                  ),
                                  child: SizedBox(
                                    width: 80,
                                    height: 46,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Text(
                                              "128",
                                              style: TextStyle(
                                                fontFamily: "Pretendard",
                                                color: Colors.black,
                                                fontSize: 20,
                                                fontWeight: FontWeight.w700,
                                                height: 20 / 22,
                                                letterSpacing: -0.4,
                                              ),
                                            ),
                                            Text(
                                              " mmHg",
                                              style: const TextStyle(
                                                fontFamily: "Pretendard",
                                                fontWeight: FontWeight.w400,
                                                fontSize: 14,
                                                height: 22 / 22,
                                                letterSpacing: -0.4,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Text(
                                          "이완기 혈압",
                                          style: const TextStyle(
                                            fontFamily: "Pretendard",
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            color: Color(0xff626262),
                                            height: 24 / 14,
                                            letterSpacing: -0.4,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // 그래프
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: SizedBox(
                      width: double.infinity,
                      height: 210,
                      child: Expanded(
                        child: Container(color: PrimaryColor.cloudyGray),
                      ),
                    ),
                  ),

                  // 최근, 월, 년
                  Container(
                    width: double.infinity,
                    height: 60,
                    color: Colors.white,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 24),
                    width: 327.w,
                    height: 166.h,
                    clipBehavior: Clip.antiAlias,
                    decoration: ShapeDecoration(
                      color: const Color(0xFFE2E2E2),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 26, top: 15, right: 22, bottom: 24),
                              child: Text.rich(
                                TextSpan(
                                  children: [
                                    TextSpan(
                                      text: '정상 혈압 범위는 ',
                                      style: TextStyle(
                                        color: const Color(0xFF0D1B34),
                                        fontSize: 16,
                                        fontFamily: 'Pretendard',
                                        fontWeight: FontWeight.w600,
                                        height: 1.50,
                                        letterSpacing: -0.40,
                                      ),
                                    ),
                                    TextSpan(
                                      text: '120/80',
                                      style: TextStyle(
                                        color: const Color(0xFF227EFF),
                                        fontSize: 16,
                                        fontFamily: 'Pretendard',
                                        fontWeight: FontWeight.w600,
                                        height: 1.50,
                                        letterSpacing: -0.40,
                                      ),
                                    ),
                                    TextSpan(
                                      text: ' ',
                                      style: TextStyle(
                                        color: const Color(0xFF0D1B34),
                                        fontSize: 16,
                                        fontFamily: 'Pretendard',
                                        fontWeight: FontWeight.w600,
                                        height: 1.50,
                                        letterSpacing: -0.40,
                                      ),
                                    ),
                                    TextSpan(
                                      text: 'mmHg',
                                      style: TextStyle(
                                        color: const Color(0xFF0D1B34),
                                        fontSize: 16,
                                        fontFamily: 'Pretendard',
                                        fontWeight: FontWeight.w400,
                                        height: 1.50,
                                        letterSpacing: -0.40,
                                      ),
                                    ),
                                    TextSpan(
                                      text: ' 미만입니다.',
                                      style: TextStyle(
                                        color: const Color(0xFF0D1B34),
                                        fontSize: 16,
                                        fontFamily: 'Pretendard',
                                        fontWeight: FontWeight.w600,
                                        height: 1.50,
                                        letterSpacing: -0.40,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 275,
                          child: Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: '혈압은 ',
                                  style: TextStyle(
                                    color: const Color(0xFF616161),
                                    fontSize: 16,
                                    fontFamily: 'Pretendard',
                                    fontWeight: FontWeight.w600,
                                    height: 1.50,
                                    letterSpacing: -0.40,
                                  ),
                                ),
                                TextSpan(
                                  text: '고혈압1기',
                                  style: TextStyle(
                                    color: const Color(0xFF227EFF),
                                    fontSize: 16,
                                    fontFamily: 'Pretendard',
                                    fontWeight: FontWeight.w600,
                                    height: 1.50,
                                    letterSpacing: -0.40,
                                  ),
                                ),
                                TextSpan(
                                  text: ' 입니다.',
                                  style: TextStyle(
                                    color: const Color(0xFF616161),
                                    fontSize: 16,
                                    fontFamily: 'Pretendard',
                                    fontWeight: FontWeight.w600,
                                    height: 1.50,
                                    letterSpacing: -0.40,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(
                            vertical: 8
                          ),
                          child: Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: '수축기 혈압은 적정범위까지 ',
                                  style: TextStyle(
                                    color: const Color(0xFF616161),
                                    fontSize: 16,
                                    fontFamily: 'Pretendard',
                                    fontWeight: FontWeight.w600,
                                    height: 1.50,
                                    letterSpacing: -0.40,
                                  ),
                                ),
                                TextSpan(
                                  text: '-61',
                                  style: TextStyle(
                                    color: const Color(0xFF227EFF),
                                    fontSize: 16,
                                    fontFamily: 'Pretendard',
                                    fontWeight: FontWeight.w600,
                                    height: 1.50,
                                    letterSpacing: -0.40,
                                  ),
                                ),
                                TextSpan(
                                  text: ' 남았습니다.',
                                  style: TextStyle(
                                    color: const Color(0xFF616161),
                                    fontSize: 16,
                                    fontFamily: 'Pretendard',
                                    fontWeight: FontWeight.w600,
                                    height: 1.50,
                                    letterSpacing: -0.40,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: '이완기 혈압은 적정범위까지 ',
                                style: TextStyle(
                                  color: const Color(0xFF616161),
                                  fontSize: 16,
                                  fontFamily: 'Pretendard',
                                  fontWeight: FontWeight.w600,
                                  height: 1.50,
                                  letterSpacing: -0.40,
                                ),
                              ),
                              TextSpan(
                                text: '-9',
                                style: TextStyle(
                                  color: const Color(0xFF227EFF),
                                  fontSize: 16,
                                  fontFamily: 'Pretendard',
                                  fontWeight: FontWeight.w600,
                                  height: 1.50,
                                  letterSpacing: -0.40,
                                ),
                              ),
                              TextSpan(
                                text: ' 남았습니다.',
                                style: TextStyle(
                                  color: const Color(0xFF616161),
                                  fontSize: 16,
                                  fontFamily: 'Pretendard',
                                  fontWeight: FontWeight.w600,
                                  height: 1.50,
                                  letterSpacing: -0.40,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          // 하단바
          BottomBar(),
          SizedBox(height: 34),
        ],
      ),
    );
  }

  BoxDecoration heartBoxDecoration({color = Colors.pink}) {
    return BoxDecoration(color: color, borderRadius: BorderRadius.circular(12));
  }

  ShapeDecoration grayBoxDecoration() {
    return ShapeDecoration(
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      shadows: [
        BoxShadow(
          color: Color(0x3F000000),
          blurRadius: 4,
          offset: Offset(0, 2),
          spreadRadius: 0,
        ),
      ],
    );
  }
}
