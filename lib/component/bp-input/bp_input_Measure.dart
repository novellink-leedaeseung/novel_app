import 'package:flutter/material.dart';

class BpInputMeasure extends StatelessWidget {
  final String label;
  final String hint;
  final String unit;
  final ValueChanged<String>? onChanged;  // 추가: 값이 변경될 때 호출될 콜백

  const BpInputMeasure({
    super.key,
    required this.label,
    required this.hint,
    required this.unit,
    this.onChanged,  // 추가
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Text(
            label,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
        ),
        TextField(
          onChanged: onChanged,  // 추가: TextField의 값이 변경될 때 콜백 호출
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            hintText: hint,
            suffixText: unit,
            border: const OutlineInputBorder(),
            isDense: true,
          ),
        ),
      ],
    );
  }
}