import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty
        ? data
        : ModalRoute.of(context)!.settings.arguments as Map;
    String bgImage = data['isDayTime'] ? 'day.png' : 'night.png';
    Color col = data['isDayTime'] ? Colors.black : Colors.white;
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/$bgImage'), fit: BoxFit.cover),
          ),
          child: Center(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 120, 0, 10),
                  child: TextButton.icon(
                      onPressed: () async {
                        dynamic result =
                            await Navigator.pushNamed(context, '/location');
                        setState(() {
                          data = {
                            'time': result['time'],
                            'location': result['location'],
                            'flag': result['flag'],
                            'isDayTime': result['isDayTime']
                          };
                        });
                      },
                      icon: Icon(Icons.location_on),
                      label: Text('Select Location')),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      data['location'],
                      style:
                          TextStyle(fontSize: 24, letterSpacing: 2, color: col),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  data['time'],
                  style: TextStyle(fontSize: 36, color: col),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
