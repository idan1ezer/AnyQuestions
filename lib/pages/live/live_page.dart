import 'dart:async';
import 'dart:developer';

import 'package:any_questions/custom_widgets/my_widgets.dart';
import 'package:any_questions/settings/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pusher_channels_flutter/pusher_channels_flutter.dart';

import '../../models/question_answer.dart';


class LivePage extends StatefulWidget {
  const LivePage({Key? key}) : super(key: key);

  @override
  State<LivePage> createState() => _LivePageState();

}

class _LivePageState extends State<LivePage> {

  late PusherChannelsFlutter pusher;
  String _log = 'output:\n';
  final _listViewController = ScrollController();
  final _eventFormKey = GlobalKey<FormState>();
  List<QuestionAnswer> qaList = [QuestionAnswer(id: "11", question: "asdsad", answer: "asdsada", likes: 1, timestamp: "10/12/21"),
    QuestionAnswer(id: "12", question: "mthgjmgh", answer: "gfhhs", likes: 12, timestamp: "12/11/22")];


  @override
  void initState() {
    super.initState();
    // Pusher
    pusher = PusherChannelsFlutter.getInstance();
    initPusher();
  }


  void log(String text) {

    // need to implement here the new QA list API.


    print("LOG: $text");
    setState(() {
      _log += text + "\n";
      Timer(
          const Duration(milliseconds: 100),
              () => _listViewController
              .jumpTo(_listViewController.position.maxScrollExtent));
    });
  }



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
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              context.go('/');
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 16.0),
        child: ListView(
            controller: _listViewController,
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            children: <Widget>[
              if (pusher.connectionState == 'CONNECTED')
                Form(
                  key: _eventFormKey,
                  child: Column(children: <Widget>[
                    ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        // itemCount: pusher
                        //     .channels["any-questions-live"]?.members.length,
                        itemCount: qaList.length,
                        itemBuilder: (context, index) {
                          // final member = pusher
                          //     .channels["any-questions-live"]!.members.values
                          //     .elementAt(index);
                          final member = qaList.elementAt(index);

                          return QuestionAnswerCard(
                              question: member.question,
                            answer: member.answer,
                          );
                        }),
                  ]),
                ),
              // SingleChildScrollView(
              //     scrollDirection: Axis.vertical, child: Text(_log)),

            ]),
      ),
    );
  }




  void initPusher() async {
    // if (!_channelFormKey.currentState!.validate()) {
    //   return;
    // }
    // Remove keyboard
    // FocusScope.of(context).requestFocus(FocusNode());
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    // prefs.setString("apiKey", _apiKey.text);
    // prefs.setString("cluster", _cluster.text);
    // prefs.setString("channelName", _channelName.text);

    try {
      await pusher.init(
        apiKey: "9384caa97e98baaa0493",
        cluster: "eu",
        onConnectionStateChange: onConnectionStateChange,
        onError: onError,
        onSubscriptionSucceeded: onSubscriptionSucceeded,
        onEvent: onEvent,
        onSubscriptionError: onSubscriptionError,
        onDecryptionFailure: onDecryptionFailure,
        onMemberAdded: onMemberAdded,
        onMemberRemoved: onMemberRemoved,
        onSubscriptionCount: onSubscriptionCount,
      );
      await pusher.subscribe(channelName: "any-questions-live");
      await pusher.connect();
    } catch (e) {
      log("ERROR: $e");
    }
  }


  void onConnectionStateChange(dynamic currentState, dynamic previousState) {
    log("Connection: $currentState");
  }

  void onError(String message, int? code, dynamic e) {
    log("onError: $message code: $code exception: $e");
  }

  void onEvent(PusherEvent event) {
    log("onEvent: $event");
  }

  void onSubscriptionSucceeded(String channelName, dynamic data) {
    log("onSubscriptionSucceeded: $channelName data: $data");
    final me = pusher.getChannel(channelName)?.me;
    log("Me: $me");
  }

  void onSubscriptionError(String message, dynamic e) {
    log("onSubscriptionError: $message Exception: $e");
  }

  void onDecryptionFailure(String event, String reason) {
    log("onDecryptionFailure: $event reason: $reason");
  }

  void onMemberAdded(String channelName, PusherMember member) {
    log("onMemberAdded: $channelName user: $member");
  }

  void onMemberRemoved(String channelName, PusherMember member) {
    log("onMemberRemoved: $channelName user: $member");
  }

  void onSubscriptionCount(String channelName, int subscriptionCount) {
    log("onSubscriptionCount: $channelName subscriptionCount: $subscriptionCount");
  }

  dynamic onAuthorizer(String channelName, String socketId, dynamic options) {
    return {
      "auth": "foo:bar",
      "channel_data": '{"user_id": 1}',
      "shared_secret": "foobar"
    };
  }



}
