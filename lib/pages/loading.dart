import 'package:flutter/material.dart';

import 'package:worldtime/services/world_time.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String timeString = "Loading";
  void setUpWorldTime() async {
    WorldTime wtInstance =
        WorldTime(location: "India", flag: "india.jpg", url: "Asia/Kolkata");
    await wtInstance.getTime();
    setState(() {
      timeString = wtInstance.time;
    });
  }

  void initState() {
    super.initState();
    setUpWorldTime();
    //print("msg after receivin time data");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(50),
        child: Text(timeString),
      ),
    );
  }
}
