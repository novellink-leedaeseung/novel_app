import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:novel/component/bp-input/bp_input_contraction_mmHg.dart';
import 'package:novel/component/bp-input/bp_input_time.dart';
import 'package:dio/dio.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


import '../api/kiosk-controller.dart';
import '../api/response/ApiResponseModel.dart';
import '../component/bp-input/bp_input_Measure.dart';
import '../component/bp-input/bp_input_top.dart';

Future<void> showBpInputModal(BuildContext context) {
  return showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    barrierColor: Colors.black38,
    builder: (context) {
      return Expanded(
        child: DraggableScrollableSheet(
          expand: true,
          initialChildSize: 0.92,
          minChildSize: 0.92,
          maxChildSize: 0.92,
          builder: (context, scrollController) {
            return Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 20,
                    offset: Offset(0, -6),
                  ),
                ],
              ),
              child: SingleChildScrollView(
                controller: scrollController,
                physics: const ClampingScrollPhysics(),
                child: const _BpInputContent(),
              ),
            );
          },
        ),
      );
    },
  );
}

class _BpInputContent extends StatefulWidget {
  const _BpInputContent();

  @override
  State<_BpInputContent> createState() => _BpInputContentState();
}

class _BpInputContentState extends State<_BpInputContent> {
  String _systolic = ''; // 수축기 혈압
  String _diastolic = ''; // 이완기 혈압
  String _pulse = ''; // 맥박

  @override
  Widget build(BuildContext context) {
    final dio = Dio();

    return Container(
      width: 375,
      height: 812,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: Column(
        children: [
          // 닫기, 제목, 저장 - 저장 버튼에 onPressed 추가
          BpInputTop(
            onSavePressed: () async {
              debugPrint('수축기 혈압: $_systolic mmHg');
              debugPrint('이완기 혈압: $_diastolic mmHg');
              debugPrint('맥박: $_pulse bpm');
              final response = await dio.post(
                'https://novel.rosq.co.kr:8488/api/auth-kiosk',
                data: {"kioskid": "MTA001"},
              );

              final kioskApiclient = KioskApiClient();
              Future<ApiResponse> authKiosk = kioskApiclient.authKiosk(
                "MTA001",
              );

              // 키오스크 키 발급
              authKiosk.then(
                (authKioskResponse) => {
                  // 사용자 토큰 발급
                  kioskApiclient
                      .authUser(
                        userid: "01068340136",
                        type: "PHONE",
                        token: authKioskResponse.resultData.token,
                      )
                      .then(
                        (authUserResponse) => {
                          // 혈압 데이터 보내기
                          kioskApiclient.setResult(
                            token: authKioskResponse.resultData.token,
                            measureId: authUserResponse.resultData.measureId,
                            systolic: _systolic,
                            diastolic: _diastolic,
                            pulse: _pulse,
                          ),
                        },
                      ),
                },
              );

              final apiResponse = ApiResponse.fromJson(response.data);

              // 이제 응답 데이터를 타입 안전하게 사용할 수 있습니다
              print('응답 코드: ${apiResponse.resultCode}');
              print('토큰: ${apiResponse.resultData.token}');
              final dataSend = await dio.post(
                'https://novel.rosq.co.kr:8488/api/set-result',
                data: {
                  "token": "${apiResponse.resultData.token}",
                  "measureid": "30-95-20250904200149-e0d72c",
                  "device": "BP",
                  "result": {
                    "high": _systolic,
                    "low": _diastolic,
                    "pulse": _pulse,
                    "status": "고혈압",
                  },
                  "serviceforce": "true",
                },
              );
              print(dataSend);
            },
          ),
          // 측정 시간, 측정 일자
          BpInputTime(),
          SizedBox(height: 18.h,),
          // 수축기
          BpInputMeasure(
            label: '수축기 혈압',
            hint: '120',
            unit: 'mmHg',
            onChanged: (value) => setState(() => _systolic = value),
          ),
          // 이완기
          BpInputMeasure(
            label: '이완기 혈압',
            hint: '80',
            unit: 'mmHg',
            onChanged: (value) => setState(() => _diastolic = value),
          ),
          // 맥박
          BpInputMeasure(
            label: '맥박',
            hint: '70',
            unit: 'bpm',
            onChanged: (value) => setState(() => _pulse = value),
          ),
        ],
      ),
    );
  }
}
