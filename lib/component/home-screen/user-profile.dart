import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

// 프로필 사진, 사용자 이름, 사람모양, 옵션
class UserProfile extends StatelessWidget {
  const UserProfile({super.key});

  @override
  Widget build(BuildContext context) {

    return Container(
      margin: EdgeInsets.only(top: 12),
      width: 327,
      height: 54,
      child: Row(
        children: [
          SizedBox(
            width: 145,
            height: 54,
            child: Row(
              children: [
                SizedBox(
                  width: 54,
                  height: 54,
                  child: ClipOval(
                    child: Image.asset(
                      'assets/images/profile/profile.jpg',
                      width: 100,
                      height: 100,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Container(
                  width: 79,
                  height: 31,
                  margin: EdgeInsets.fromLTRB(12, 11.5, 0, 11.5),
                  child: Row(
                    children: [
                      Text(
                        "노블이",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: "Pretendard",
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                          height: 1.6,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 9),
                        child: SvgPicture.asset(
                          'assets/icon/downward.svg',
                          width: 14,
                          height: 6.78,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 126, right: 8),
            width: 24,
            height: 24,
            child: IconButton(
              padding: EdgeInsets.only(),
              onPressed: () {},
              icon: SvgPicture.asset('assets/icon/user-group.svg')
            ),
          ),
          SizedBox(
            width: 24,
            height: 24,
            child: IconButton(
              padding: EdgeInsets.zero,
              onPressed: () {},
              icon: SvgPicture.asset('assets/icon/control.svg'),
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
