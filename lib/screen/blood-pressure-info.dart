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
                        foregroundColor: Colors.white
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(left: 125),
                      child: Text("혈압", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w700)),
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
                Text("2025.08.15", style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600
                ),),
                IconButton(onPressed: (){}, icon: Icon(Icons.date_range))
              ],
            ),
          ),

        ],
      ),
    );
  }
}
