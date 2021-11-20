import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:worldtime/services/world_time.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void setUpWorldTime() async {
    //Asia/Kolkata  Europe/London
    WorldTime wtInstance =
        WorldTime(location: "India", flag: "india.jpg", url: "Asia/Kolkata");
    await wtInstance.getTime();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': wtInstance.location,
      'flag': wtInstance.flag,
      'time': wtInstance.time,
      'isDayTime': wtInstance.isDayTime
    });
  }

  void initState() {
    super.initState();
    setUpWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Center(
        child: SpinKitFadingCube(
          color: Colors.white,
          size: 50.0,
        ),
      ),
    );
  }
}
