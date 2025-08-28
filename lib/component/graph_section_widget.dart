// lib/screen/bp/graph_section.dart
import 'package:flutter/material.dart';
import 'package:novel/primary-color.dart';

class GraphSection extends StatelessWidget {
  const GraphSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: SizedBox(
        width: double.infinity,
        height: 210,
        child: ColoredBox(color: PrimaryColor.cloudyGray),
      ),
    );
  }
}
