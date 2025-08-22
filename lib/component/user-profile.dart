import 'package:flutter/material.dart';

// 프로필 사진, 사용자 이름, 사람모양, 옵션
class UserProfile extends StatelessWidget {
  const UserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.only(left: 24, right: 24),
        child: Expanded(
          child: Row(
            children: [
              Row(
                children: [
                  ClipOval(
                    child: Image.asset(
                      'assets/images/profile/profile.jpg',
                      width: 54,
                      height: 54,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(12, 0, 0, 0),
                    child: Text(
                      "노블이",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Image.asset('assets/images/icon/downward.png'),
                    color: Colors.white,
                    iconSize: 14,
                  ),
                ],
              ),

              Expanded(
                // height: 45,
                // width: MediaQuery.of(context).size.width * 0.4,
                // margin: EdgeInsets.symmetric(horizontal: 10),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Image.asset('assets/images/icon/user-group.png'),
                        color: Colors.white,
                        iconSize: 24,
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Image.asset('assets/images/icon/control.png'),
                        color: Colors.white,
                        iconSize: 24,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
