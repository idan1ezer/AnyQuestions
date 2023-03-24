import 'package:any_questions/settings/app_theme.dart';
import 'package:flutter/material.dart';


class LivePage extends StatefulWidget {
  const LivePage({Key? key}) : super(key: key);

  @override
  State<LivePage> createState() => _LivePageState();
}

class _LivePageState extends State<LivePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.appBarColor,
        centerTitle: true,
        title: Text(
          "Live",
          style: AppTheme.appBarHeaderFontStyle,
        ),
      ),
      body: Column(
        children: <Widget>[
        ],
      ),
    );
  }
}
