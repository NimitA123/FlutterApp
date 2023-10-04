import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/constants/bottomsheet.dart';
import 'package:flutter_svg/svg.dart';

import 'InviteVendor.dart';
import 'models/GetTripResponse.dart';

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: MamaStops()));
}

class MamaStops extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<MamaStops> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  Data? getTrip;
  bool isDrawerOpen = false;

  void _openDrawer() {
    setState(() {
      isDrawerOpen = true;
    });
  }

  void _closeDrawer() {
    setState(() {
      isDrawerOpen = false;
    });
  }

  @override
  void initState() {
    super.initState();
    // getData();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        /*   centerTitle: true,
        title: const Text(
          'Navigation Drawer',
        ),
        backgroundColor: const Color(0xff764abc),*/
        backgroundColor: Colors.white,
        leading: GestureDetector(
          onTap: () {
            _scaffoldKey.currentState!.openDrawer();
          },
          child: SvgPicture.asset("assets/avtar.svg"),
        ),
        actions: [
          SvgPicture.asset("assets/sos.svg"),
          SvgPicture.asset("assets/notification.svg"),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            Row(children: [
              SvgPicture.asset("assets/avtar.svg"),
              Text("bdbcbdcdcdc")
            ]),
            /* const DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Row(
                  children: [Text("vdvfdhvfv")],
                )),*/
            ListTile(
              leading: Icon(Icons.person),
              title: const Text(' My Trip '),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.book),
              title: const Text('Documents'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.workspace_premium),
              title: const Text(' Profile Request '),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.video_label),
              title: const Text(' Language '),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.edit),
              title: const Text(' Invite Vendor '),
              onTap: () {
                Navigator.pop(context);
              },
            ),

            ListTile(
              leading: Icon(Icons.edit),
              title: const Text(' About and Legal '),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.edit),
              title: const Text(' Help and Support '),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: const Text('LogOut'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    "UpComing Consignment",
                    style: TextStyle(fontSize: 20, color: Color(0xff0D1F22)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Card(
                      child: Column(
                    children: [
                      // Adds spacing between the title and content
                      Padding(
                          padding: EdgeInsets.fromLTRB(20, 20, 0, 0),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Text("ID: MS 23452"),
                          )),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset("assets/destination.png"),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.fromLTRB(15, 10, 0, 0),
                                child: Text("Start location"),
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                                child: Text(
                                    getTrip?.startAddress?.toString() ?? ''),
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(15, 50, 0, 0),
                                child: Text("Destination"),
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                                child:
                                    Text(getTrip?.endAddress?.toString() ?? ''),
                              ),
                            ],
                          ),
                        ],
                      ),
                      CommonWidget(
                        title: 'Trip Duration',
                        subtitle: '3 Days',
                        title1: 'Rest Stops',
                        subtitle1: '3',
                      ),
                      CommonWidget(
                        title: 'Truck Number',
                        subtitle: getTrip?.truckData?.truckNumber ?? "null",
                        title1: 'Truck Capacity',
                        subtitle1: getTrip?.truckData?.capacity ?? "null",
                      ),
                      CommonWidget(
                        title: 'Trailer Number',
                        subtitle: getTrip?.trailerData?.trailerNumber ?? "null",
                        title1: 'Trailer Capaxcity',
                        subtitle1: getTrip?.trailerData?.capacity ?? "null",
                      ),
                      CommonWidget(
                        title: 'Passing Net Weight',
                        subtitle:
                            getTrip?.getPassingNetWeight(getTrip?.stopsData) ??
                                " ",
                        title1: 'Start Data and Time',
                        subtitle1: getTrip?.formattedDate(
                                getTrip?.startDate.toString()) ??
                            "",
                      ),
                      CommonWidget(
                        title: 'End Date and Time',
                        subtitle:
                            getTrip?.formattedDate(getTrip?.endDate) ?? "",
                        title1: '',
                        subtitle1: '',
                      ),

                      GestureDetector(
                        onTap: () {
                          print("onclick");
                          MyCustomBottomSheet()._showCustomBottomSheet(context);
                        },
                        child: Container(
                          width: double.infinity,
                          height: 40,
                          color: Color(0XffFFF7E1),
                          child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                "Request Cancellation",
                                style: TextStyle(color: Color(0XffD74F58)),
                              )),
                        ),
                      )
                    ],
                  )),
                )
              ],
            )),
            Align(
              alignment: Alignment.bottomCenter,
              child: Card(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    OutlinedButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => InviteVendor()));
                      },
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(
                          color: Colors.black, // Specify the border color here
                          width: 2.0, // Specify the border width here
                        ),
                      ),
                      child: const Text(
                        'View Details',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(
                          color: Colors.red, // Specify the border color here
                          width: 2.0, // Specify the border width here
                        ),
                      ),
                      child: const Text(
                        'Accepted',
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> getData() async {
    try {
      var response = await Dio().get(
          "http://a0e2b3bcc494d44ee898c2a9b91d0841-747501563.af-south-1.elb.amazonaws.com/api/v1/driver-consignment/consignment?consignment_id=ff8df1b3-2b9a-44ac-a5ae-2408f053be15",
          options: Options(headers: {
            "authorization":
                "Bearer eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiJhM2MzZjkyMC0xNzE3LTRiNjktYTg5NS02YWVkOTBhMDNkNWUiLCJpYXQiOjE2ODk1ODg1NjYsImV4cCI6MTY5MDQ1MjU2Nn0.Pne_j5NkVDDiDLoNo39WuJJa0N2LCfGs9JZtK0yS9-jpqs_18XPXN5hz4P6xAhOZ5_8c_fSnyoYglvaqMIoU3oe7RIX7Q5EzTpHuWozf-Q_evaRPYPmWyEMxB9J3by6jrCPAb866zBRu4AQ_PF4Bjx0bUfIjrYiSiWzuDMIqZzC1jd5Dr1H9woFESIFoCq3y3h7AQWL2dcv5lOCYQM-iPM05SW8oSWZMgij_kTiVrlARVYlEBsGY-IEb4H_psWgOO59TUCZQ8IHgtdOSg8RYcEdkx7QcpOk0n6RhT8aLkz3DXzNAEc-7fkfrBUplyIDaH8lWUrHC5OIwSLWbOGYhMDNFvlGkPXgIOIocdJ7eLDfFf_YYQGRozPbtDww0Q0icDxl86fcctSnHrNJcVwOXNgxCr7qi97qHYB5RhnaS0_W5vHaN56vYccPPi2a7QIYL49zf2TAnZiVbHdn4O9Y7bqPnb-tRMWUEHu1jbSIurMkzV5vl_hIgkyXYi7iM49ohESdKYciy28xJsCUgVqzliX1Zw4sDphIkEQWwrMngZiFFHkqrGItYhIMwVTUKI0GdxbWoDKKjWlRMD1dSAEDsRSQX4SnTvB1lHmDe_jAlG1fW-EEciYvWB3qwhv8P_J_2v2NN9i3rLhjsPtWCd8jpXGfaSiGqn-tPTUCSG_Pll7M"
          }));
      print("here");
      if (response.statusCode == 200) {
        setState(() {
          getTrip = Data.fromJson(response.data["data"]);
          print('The getTrip is: $getTrip');
        });
      }
    } catch (e) {
      print("catch $e");
    }
  }
}

class CommonWidget extends StatelessWidget {
  const CommonWidget(
      {Key? key,
      required this.title,
      required this.subtitle,
      required this.title1,
      required this.subtitle1})
      : super(key: key);
  final String title;
  final String subtitle;
  final String title1;
  final String subtitle1;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [Text(title), Text(subtitle)],
              ),
              Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [Text(title1), Text(subtitle1)],
              )
            ],
          ),
        ],
      ),
    );
  }
}

class MyCustomBottomSheet {
  void _showCustomBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          // Set the desired height of the bottom sheet
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [bottomsheet()],
          ),
        );
      },
    );
  }
}
