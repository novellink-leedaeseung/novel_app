import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:novel/iPhone_top.dart';
import 'package:novel/primary-color.dart';
import 'package:novel/screen/home_screen.dart';

class BloodPressureInfo extends StatefulWidget {
  const BloodPressureInfo({super.key});

  @override
  State<BloodPressureInfo> createState() => _BloodPressureInfoState();
}

class _BloodPressureInfoState extends State<BloodPressureInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          IphoneTop(),
          // 혈압 ( app bar )
          // 이전, 혈압 제목
          SizedBox(
            width: double.infinity,
            height: 56,
            child: DecoratedBox(
              decoration: BoxDecoration(color: PrimaryColor.blue),
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        context.go('/');
                      },
                      icon: Icon(Icons.arrow_back_outlined),
                      style: IconButton.styleFrom(
                        foregroundColor: Colors.white,
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(left: 125),
                      child: Text(
                        "혈압",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          // 현재 날짜, 달려
          SizedBox(
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "2025.08.15",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                IconButton(onPressed: () {}, icon: Icon(Icons.date_range)),
              ],
            ),
          ),
          // 고혈압 1기, 맥박
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // 고혈압 1기
              Container(
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
                          padding: const EdgeInsets.only(bottom: 10, right: 10),
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
              // 맥박
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Container(
                  decoration: grayBoxDecoration(),
                  width: 156,
                  height: 125,
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10, left: 10),
                          child: Container(
                            decoration: heartBoxDecoration(),
                            width: 38,
                            height: 38,
                            child: Image.asset("assets/images/icon/heart.png"),
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
                          width: 76,
                          height: 49,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    "70",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  Text(
                                    " bpm",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14,
                                      color: PrimaryColor.gray,
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                "맥박",
                                style: TextStyle(
                                  color: PrimaryColor.gray,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                ),
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
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 156,
                  height: 125,
                  decoration: grayBoxDecoration(),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Container(
                    width: 156,
                    height: 125,
                    decoration: grayBoxDecoration(),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  BoxDecoration heartBoxDecoration() {
    return BoxDecoration(
      color: PrimaryColor.pink,
      borderRadius: BorderRadius.circular(12),
    );
  }

  BoxDecoration grayBoxDecoration() {
    return BoxDecoration(
      color: Colors.white,
      border: Border.all(color: PrimaryColor.white, width: 1),
      borderRadius: BorderRadius.circular(20), // 모서리 둥글게
      boxShadow: [
        BoxShadow(
          color: PrimaryColor.gray, // 흰색 그림자
          blurRadius: 4, // 번짐 정도
          spreadRadius: 0, // 확장 정도 (0이면 깔끔)
          offset: Offset(0, 2), // X=0, Y=2 → 아래쪽으로만 그림자
        ),
      ],
    );
  }
}
