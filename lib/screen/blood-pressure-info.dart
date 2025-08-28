import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:novel/component/bottom-bar.dart';
import 'package:novel/iPhone_top.dart';
import 'package:novel/primary-color.dart';

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
                  width: 24.w,
                  height: 24.h,
                  margin: EdgeInsets.only(left: 24),
                  child: IconButton(
                    // todo 버튼 작아짐
                    iconSize: 24,
                    onPressed: () {
                      context.go('/');
                    },
                    icon: SvgPicture.asset("assets/icon/back.svg"),
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
                  onPressed: () => openBpLogSheet(context),
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
          Expanded(
            child: Container(
              color: Colors.white,
              // 배경화면 모두 흰색으로
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  // 현재 날짜, 달려
                  Padding(
                    padding: EdgeInsets.only(top: 16, bottom: 16),
                    child: dateWithButton(
                      context,
                      dateText: '2025.08.15',
                      initialDate: DateTime(2025, 8, 15),
                      onDatePicked: (d) {
                        // TODO: 선택된 날짜로 상태 갱신
                        // setState(() => _dateText = DateFormat('yyyy.MM.dd').format(d));
                      },
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
                              margin: EdgeInsets.only(
                                left: 26,
                                top: 15,
                                right: 22,
                                bottom: 24,
                              ),
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
                          margin: EdgeInsets.symmetric(vertical: 8),
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

  Future<void> openBpLogSheet(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      // 높이 크게
      backgroundColor: Colors.transparent,
      // 모달 바탕 투명
      barrierColor: Colors.black38,
      // 뒤 배경 딤
      builder: (context) {
        return DraggableScrollableSheet(
          expand: true,
          initialChildSize: 0.92, // 처음 높이(88%)
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
                  const SizedBox(height: 24),
                  // 헤더 (닫기 + 가운데 타이틀)
                  Row(
                    children: [
                      Container(
                        height: 56.h,
                        // height: 56px
                        padding: const EdgeInsets.fromLTRB(24, 16, 153, 16),
                        // padding: 16px 153px 16px 24px
                        // display:inline-flex + flex-shrink:0 -> Row + mainAxisSize.min (가로로 내용만큼만)
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          // inline-flex
                          crossAxisAlignment: CrossAxisAlignment.start,
                          // align-items: flex-start
                          children: [
                            /* child 1 */
                            Container(
                              width: 24.w,
                              height: 24.h,
                              child: IconButton(
                                onPressed: () {
                                  context.pop();
                                },
                                icon: SvgPicture.asset("assets/icon/close.svg"),
                              ),
                            ),
                            const SizedBox(width: 106), // gap: 106px
                            /* child 2 */
                            Text(
                              '혈압기록',
                              textAlign: TextAlign.center, // text-align: center
                              style: const TextStyle(
                                color: Color(0xFF227EFF),
                                // color: #227EFF
                                fontFamily: 'Pretendard',
                                // font-family
                                fontSize: 20,
                                // font-size: 20px
                                fontStyle: FontStyle.normal,
                                // font-style: normal
                                fontWeight: FontWeight.w700,
                                // font-weight: 700
                                height: 24 / 20,
                                // line-height: 24px (= 1.2)
                                letterSpacing: -0.5, // letter-spacing: -0.5px
                              ),
                            ),
                            // ... 필요 시 계속 추가
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

class _BpCard extends StatelessWidget {
  const _BpCard({
    super.key,
    this.stage = '고혈압1기',
    this.dateText = '2025.08.15 13:40',
    this.sys = 148,
    this.dia = 128,
    this.hr = 70,
    this.sourceText = '블루투스 측정',
    this.stageColor = const Color(0xFFE5621C), // 오렌지
  });

  final String stage;
  final String dateText;
  final int sys;
  final int dia;
  final int hr;
  final String sourceText;
  final Color stageColor;

  @override
  Widget build(BuildContext context) {
    const family = 'Pretendard';

    return Container(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.16),
            offset: Offset(0, 4),
            blurRadius: 12,
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 좌측 영역 (라벨, 출처)
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  stage,
                  style: TextStyle(
                    color: stageColor,
                    fontFamily: family,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    height: 24 / 16,
                    letterSpacing: -0.4,
                  ),
                ),
                const SizedBox(height: 48),
                Row(
                  children: [
                    const Icon(
                      Icons.bluetooth,
                      size: 16,
                      color: Color(0xFF227EFF),
                    ),
                    const SizedBox(width: 6),
                    Text(
                      sourceText,
                      style: const TextStyle(
                        color: Color(0xFF8C8C8C),
                        fontFamily: family,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        height: 20 / 14,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // 우측 영역 (날짜, 혈압/맥박)
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                dateText,
                style: const TextStyle(
                  color: Color(0x99000000),
                  fontFamily: family,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 20),
              RichText(
                text: TextSpan(
                  style: const TextStyle(
                    color: Colors.black,
                    fontFamily: family,
                    fontWeight: FontWeight.w800,
                  ),
                  children: [
                    TextSpan(
                      text: '$sys / $dia ',
                      style: const TextStyle(fontSize: 22),
                    ),
                    const TextSpan(
                      text: 'mmHg',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 6),
              RichText(
                text: const TextSpan(
                  style: TextStyle(color: Colors.black, fontFamily: family),
                  children: [
                    TextSpan(
                      text: '70 ',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    TextSpan(
                      text: 'bpm',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

/// 달력 아이콘 버튼 (그 자체)
Widget calendarIconButton(
  BuildContext context, {
  VoidCallback? onPressed, // 직접 동작을 넣고 싶으면 이거 사용
  DateTime? initialDate, // 날짜선택기를 쓰고 싶으면 아래 onDatePicked만 주면 됨
  ValueChanged<DateTime>? onDatePicked, // 선택된 날짜 콜백
  Color color = const Color(0xFF0B1E38),
  double size = 24, // 아이콘 크기
  double radius = 8, // 모서리
}) {
  Future<void> _openPicker() async {
    final now = DateTime.now();
    final picked = await showDatePicker(
      context: context,
      initialDate: initialDate ?? now,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null && onDatePicked != null) onDatePicked(picked);
  }

  return InkWell(
    onTap: onPressed ?? _openPicker,
    child: SizedBox(
      child: Center(
        child: Icon(Icons.calendar_month_rounded, size: size, color: color),
      ),
    ),
  );
}

/// 가운데 정렬된 날짜 텍스트 + 달력 버튼 묶음
Widget dateWithButton(
  BuildContext context, {
  required String dateText, // '2025.08.15' 같은 문자열
  DateTime? initialDate,
  ValueChanged<DateTime>? onDatePicked,
  Color color = const Color(0xFF0B1E38),
  String fontFamily = 'Pretendard',
}) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Container(
        child: Row(
          children: [
            Text(
              '2025.08.15',
              // textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF0D1B34),
                fontSize: 16,
                fontWeight: FontWeight.w600,
                fontFamily: 'Pretendard',
                height: 0.09,
                letterSpacing: -0.40,
              ),
            ),
            SizedBox(width: 6.w,),
            calendarIconButton(
              context,
              initialDate: initialDate,
              onDatePicked: onDatePicked,
              color: color,
            ),
          ],
        ),
      ),
    ],
  );
}
