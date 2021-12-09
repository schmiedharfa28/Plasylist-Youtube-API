import 'package:flutter/material.dart';
import 'package:flutter_week3/main.dart';
import 'package:flutter_week3/playlist_video.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                leading: Icon(Icons.menu),
                title: Text(
                  "Home",
                  style: TextStyle(fontSize: 18.0),
                ),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MyHomePage()));
                },
              ),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                leading: Icon(Icons.menu),
                title: Text(
                  "Flutter",
                  style: TextStyle(fontSize: 18.0),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PlaylistVideo(
                          title: "Flutter List",
                          url: "https://myyoutubeapiflutter.herokuapp.com/"),
                    ),
                  );
                },
              ),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                leading: Icon(Icons.menu),
                title: Text(
                  "CodeIgniter",
                  style: TextStyle(fontSize: 18.0),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PlaylistVideo(
                          title: "CodeIgniter List",
                          url: "https://youtubeapicodeigniter.herokuapp.com/"),
                    ),
                  );
                },
              ),
            ),
            Divider(),
          ],
        ),
      ),
    );
  }
}
