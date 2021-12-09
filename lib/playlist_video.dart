import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_week3/mydrawer.dart';
import 'package:http/http.dart' as http;
import 'package:webview_flutter/webview_flutter.dart';
// import 'package:webview_plugin/webview_plugin.dart';

class PlaylistVideo extends StatefulWidget {
  //membuat parameter
  final String title;
  final String url;

  PlaylistVideo({required this.title, required this.url});
  @override
  _PlaylistVideoState createState() => _PlaylistVideoState();
}

class _PlaylistVideoState extends State<PlaylistVideo> {
  //membuat method
  Future<List> getPlaylist() async {
    final response = await http.get(Uri.parse(widget.url));
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
        title: Text(widget.title),
      ),

      body: FutureBuilder<List>(
        future: getPlaylist(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          return snapshot.hasData
              ? Playlist(snapshot.data)
              : Center(
                  child: CircularProgressIndicator(),
                );
        },
      ), //untuk fungsi
    );
  }
}

class Playlist extends StatelessWidget {
  final list;
  Playlist(this.list);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: list == null ? 0 : list.length,
      itemBuilder: (context, index) {
        return Container(
          padding: EdgeInsets.all(16),
          child: Column(
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => VideoPlayer(
                              "https://youtube.com/embed/${list[index]['contentDetails']['videoId']}")));
                },
                child: Container(
                  height: 230,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                          list[index]['snippet']['thumbnails']['high']['url']),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(24.0),
                child: Text(list[index]['snippet']['title']),
              ),
              Divider(),
            ],
          ),
        );
      },
    );
  }
}

class VideoPlayer extends StatelessWidget {
  final url;

  VideoPlayer(this.url);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: WebView(
          javascriptMode: JavascriptMode.unrestricted,
          initialUrl: url,
        ),
      ),
    );
  }
}
