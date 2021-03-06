import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticleView extends StatefulWidget {
  
  final String blogUrl;
  ArticleView({this.blogUrl});

  @override
  _ArticleStateView createState() => _ArticleStateView();
}

class _ArticleStateView extends State<ArticleView> {
  @override

  final Completer<WebViewController> _completer = 
  Completer<WebViewController>();

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Dave's", style: TextStyle(
              color: Colors.black
            ),),
            Text("News", style: TextStyle(
              color: Colors.blue
            ),)
          ],
        ),
        actions: <Widget>[
          Opacity(
            opacity: 0,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Icon(Icons.save
            )),
          )
        ],
        elevation: 0.0,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: WebView(
          initialUrl: widget.blogUrl,
          onWebViewCreated: ((WebViewController webViewController){
            _completer.complete(webViewController);
          }),
        ),
      ),
    );
  }
}