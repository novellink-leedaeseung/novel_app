import 'package:flutter/material.dart';
import 'package:novel/component/bottom-bar.dart';
import 'package:novel/component/welcome-banner.dart';
import 'package:novel/iPhone_top.dart';

import '../component/notice.dart';
import '../component/user-profile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            child: Container(
              width: double.infinity,
              height: 200,
              color: Color(0xFF227EFF),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // 다이나믹 아일랜드 및 노치
                  IphoneTop(),
                  // 프로필 사진, 사용자 이름, 사람모양, 옵션
                  UserProfile(),
                  // 환영메시지, 기업회원 버튼
                  WelcomeBanner(),
                ],
              ),
            ),
          ),
          // 스크롤바
          Expanded(
            child: ListView(padding: EdgeInsets.zero, children: [Notice(),Notice()]),
          ),
          // 공지사항
          // 하단 바
          BottomBar(),
          SizedBox(height: 34),
        ],
      ),
    );
  }
}
