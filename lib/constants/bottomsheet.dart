import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../models/CancellationReasonListResponse.dart';

class bottomsheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 48,
            child: Card(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Cancel Request",
                    style: TextStyle(color: Color(0Xff000000), fontSize: 16),
                  ),
                  SvgPicture.asset("assets/closeCircle.svg")
                ],
              ),
            ),
          ),
          Text(
            "Hi ,Arun",
            style: TextStyle(color: Color(0Xff000000), fontSize: 14),
          ),
          Text(
            "How Can we help you today?",
            style: TextStyle(color: Color(0Xff737373), fontSize: 14),
          ),
         MyCheckboxListExample(),
          const Text(
            "Remarks (Optional)",
            style: TextStyle(fontSize: 14, color: Color(0Xff000000)),
          ),
          TextField(
            onChanged: (text) {},
            decoration: const InputDecoration(
              hintText: 'Lorem Ipsum dolor sit am Lorem Ipsum dolor sit ame',
              labelText: 'Remarks',
            ),
          ),
        ],
      ),
    );
  }
}

class MyCheckboxListExample extends StatefulWidget {
  @override
  _MyCheckboxListExampleState createState() => _MyCheckboxListExampleState();
}

class _MyCheckboxListExampleState extends State<MyCheckboxListExample> {
  CancellationReasonList? cancellationReasonList;
  List<bool> _checkedList = [false, false, false];
  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _checkedList.length,
      itemBuilder: (context, index) {
        return Container(
          height: 200,
          child: CheckboxListTile(
            value: _checkedList[index],
            onChanged: (newValue) {
              setState(() {
                _checkedList[index] = newValue!;
              });
            },
            title: Text(cancellationReasonList?.data![index]?.reason ?? ''),
            controlAffinity: ListTileControlAffinity.trailing,
          ),
        );
      },
    );
  }

  Future<void> getData() async {
    try {
      var response = await Dio().get(
          "http://a0e2b3bcc494d44ee898c2a9b91d0841-747501563.af-south-1.elb.amazonaws.com/api/v1/driver-consignment/cancellation-reasons",
          options: Options(headers: {
            "authorization":
                "Bearer eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiJhM2MzZjkyMC0xNzE3LTRiNjktYTg5NS02YWVkOTBhMDNkNWUiLCJpYXQiOjE2ODk1ODg1NjYsImV4cCI6MTY5MDQ1MjU2Nn0.Pne_j5NkVDDiDLoNo39WuJJa0N2LCfGs9JZtK0yS9-jpqs_18XPXN5hz4P6xAhOZ5_8c_fSnyoYglvaqMIoU3oe7RIX7Q5EzTpHuWozf-Q_evaRPYPmWyEMxB9J3by6jrCPAb866zBRu4AQ_PF4Bjx0bUfIjrYiSiWzuDMIqZzC1jd5Dr1H9woFESIFoCq3y3h7AQWL2dcv5lOCYQM-iPM05SW8oSWZMgij_kTiVrlARVYlEBsGY-IEb4H_psWgOO59TUCZQ8IHgtdOSg8RYcEdkx7QcpOk0n6RhT8aLkz3DXzNAEc-7fkfrBUplyIDaH8lWUrHC5OIwSLWbOGYhMDNFvlGkPXgIOIocdJ7eLDfFf_YYQGRozPbtDww0Q0icDxl86fcctSnHrNJcVwOXNgxCr7qi97qHYB5RhnaS0_W5vHaN56vYccPPi2a7QIYL49zf2TAnZiVbHdn4O9Y7bqPnb-tRMWUEHu1jbSIurMkzV5vl_hIgkyXYi7iM49ohESdKYciy28xJsCUgVqzliX1Zw4sDphIkEQWwrMngZiFFHkqrGItYhIMwVTUKI0GdxbWoDKKjWlRMD1dSAEDsRSQX4SnTvB1lHmDe_jAlG1fW-EEciYvWB3qwhv8P_J_2v2NN9i3rLhjsPtWCd8jpXGfaSiGqn-tPTUCSG_Pll7M"
          }));
      print("here");
      if (response.statusCode == 200) {
        setState(() {
          cancellationReasonList =
              CancellationReasonList.fromJson(response.data);

          print('The getTrip is: $cancellationReasonList');
        });
      }
    } catch (e) {
      print("catch $e");
    }
  }
}
