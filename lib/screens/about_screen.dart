import 'package:flutter/material.dart';
import 'package:shop/widgets/app_drawer.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutScreen extends StatelessWidget {
  static const routeName = 'about-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About Developer'),
      ),
      drawer: AppDrawer(),
      backgroundColor: Colors.blue,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              radius: 80.0,
              backgroundImage: AssetImage('assets/images/Tamim.jpg'),
              //maxRadius: 50,
            ),
            Text(
              'Md. Ifte Kharul Islam',
              style: TextStyle(
                fontFamily: 'Pacifico',
                fontSize: 30.0,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'FLUTTER DEVELOPER',
              style: TextStyle(
                fontFamily: 'SourceSance',
                color: Colors.teal.shade100,
                fontWeight: FontWeight.bold,
                fontSize: 20,
                letterSpacing: 2.5,
              ),
            ),
            SizedBox(
              height: 20.0,
              width: 150.0,
              child: Divider(
                color: Colors.teal[100],
              ),
            ),
            Card(
                margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                color: Colors.white,
                child: ListTile(
                  leading: Icon(
                    Icons.phone,
                    size: 30,
                    color: Colors.teal[900],
                  ),
                  title: Text(
                    '+880 1234 5678',
                    style: TextStyle(
                      fontFamily: 'SourceSance',
                      fontSize: 20,
                      color: Colors.teal,
                    ),
                  ),
                )),
            Card(
                margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                color: Colors.white,
                child: ListTile(
                  leading: Icon(
                    Icons.email,
                    size: 30,
                    color: Colors.teal[900],
                  ),
                  title: Text(
                    'xyz@gmail.com',
                    style: TextStyle(
                      fontFamily: 'SourceSance',
                      fontSize: 20,
                      color: Colors.teal,
                    ),
                  ),
                )),
            Card(
                margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                color: Colors.white,
                child: ListTile(
                  leading: Icon(
                    Icons.work,
                    size: 30,
                    color: Colors.teal[900],
                  ),
                  title: Text(
                    'Developer',
                    style: TextStyle(
                      fontFamily: 'SourceSance',
                      fontSize: 20,
                      color: Colors.teal,
                    ),
                  ),
                  subtitle: Text(
                    'Arena Phone LTD.',
                    style: TextStyle(
                      fontFamily: 'SourceSance',
                      fontSize: 15,
                      color: Colors.indigo[500],
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
