import 'package:flutter/material.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 44.92, right: 42),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {},
            icon: Image.asset("assets/icon/home.png"),
          ),
          IconButton(
            onPressed: () {},
            icon: Image.asset("assets/icon/combined-shape.png"),
          ),
          IconButton(
            onPressed: () {},
            icon: Image.asset("assets/icon/calendar.png"),
          ),
          IconButton(
            onPressed: () {},
            icon: Image.asset("assets/icon/setting.png"),
          ),
        ],
      ),
    );

  }
}
