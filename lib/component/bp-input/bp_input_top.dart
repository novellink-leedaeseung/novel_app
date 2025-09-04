import 'package:flutter/material.dart';

class BpInputTop extends StatelessWidget {
  final VoidCallback? onSavePressed;  // 저장 버튼 콜백 추가

  const BpInputTop({
    super.key,
    this.onSavePressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.close),
        ),
        const Text('혈압 입력'),
        TextButton(
          onPressed: onSavePressed,  // 저장 버튼 클릭시 콜백 호출
          child: const Text('저장'),
        ),
      ],
    );
  }
}