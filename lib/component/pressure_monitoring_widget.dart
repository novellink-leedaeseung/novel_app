// lib/screen/bp/pressure_row.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:novel/component/ui_decorations.dart';
import 'package:novel/primary-color.dart';

class PressureRow extends StatelessWidget {
  const PressureRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 15),
      color: Colors.white,
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          _SystolicCard(sys: 148),
          SizedBox(width: 15),
          _DiastolicCard(dia: 128),
        ],
      ),
    );
  }
}

class _SystolicCard extends StatelessWidget {
  const _SystolicCard({required this.sys});
  final int sys;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 156.w,
      height: 125.h,
      decoration: grayBoxDecoration(),
      child: Padding(
        padding: const EdgeInsets.only(top: 10, left: 10, right: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                width: 38,
                height: 38,
                decoration: heartBoxDecoration(color: PrimaryColor.pink),
                child: Image.asset("assets/icon/heart-red.png"),
              ),
            ),
            const SizedBox(height: 16),
            _PressureValue(value: sys, label: "수축기 혈압"),
          ],
        ),
      ),
    );
  }
}

class _DiastolicCard extends StatelessWidget {
  const _DiastolicCard({required this.dia});
  final int dia;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 156.w,
      height: 125.h,
      decoration: grayBoxDecoration(),
      child: Padding(
        padding: const EdgeInsets.only(top: 10, left: 10, right: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                width: 38,
                height: 38,
                decoration: heartBoxDecoration(color: PrimaryColor.cloudyBlue),
                child: Image.asset("assets/icon/heart-blue.png"),
              ),
            ),
            const SizedBox(height: 16),
            _PressureValue(value: dia, label: "이완기 혈압"),
          ],
        ),
      ),
    );
  }
}

class _PressureValue extends StatelessWidget {
  const _PressureValue({required this.value, required this.label});
  final int value;
  final String label;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 120.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                "$value",
                style: const TextStyle(
                  fontFamily: "Pretendard",
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  letterSpacing: -0.4,
                ),
              ),
              const Text(
                " mmHg",
                style: TextStyle(
                  fontFamily: "Pretendard",
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  letterSpacing: -0.4,
                ),
              ),
            ],
          ),
          Text(
            label,
            style: const TextStyle(
              fontFamily: "Pretendard",
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Color(0xff626262),
              letterSpacing: -0.4,
            ),
          ),
        ],
      ),
    );
  }
}
