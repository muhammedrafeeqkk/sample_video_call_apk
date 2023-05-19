import 'dart:async';
import 'package:flutter/material.dart';
import 'package:sample_vediocall/view/const/const.dart';
import 'package:zego_express_engine/zego_express_engine.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';

import 'login_screen.dart';
// import 'package:zego_uikit_prebuilt/zego_uikit_prebuilt.dart';

class MyCallScreen extends StatefulWidget {
  final String callId;

  const MyCallScreen({super.key, required this.callId});

  @override
  _MyCallScreenState createState() => _MyCallScreenState();
}

class _MyCallScreenState extends State<MyCallScreen> {
  int? _startTime;
  int? _endTime;
  int _callDuration = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startTime = DateTime.now().millisecondsSinceEpoch ~/ 1000;
    _startTimer();
  }

  @override
  void dispose() {
    _timer!.cancel();
    super.dispose();
  }

  void _startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) => setState(() {
        if (_callDuration < 600) {
          _callDuration++;
        } else {
          _onCallEnd(MyConsts.appSign, true);
        }
      }),
    );
  }

  void _onCallEnd(String roomId, bool isEndByMyself) {
    _endTime = DateTime.now().millisecondsSinceEpoch ~/ 1000;
    _timer!.cancel();
    _calculateCallDuration();
    // Other code to handle call end
  }

  void _calculateCallDuration() {
    if (_startTime != null && _endTime != null) {
      _callDuration = _endTime! - _startTime!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Call Ends: ${600 - _callDuration} seconds'),
      ),
      body: ZegoUIKitPrebuiltCall(
        controller:ZegoUIKitPrebuiltCallController() ,
        appID: MyConsts
            .appID, 
        appSign: MyConsts
            .appSign, 
        userID: LoginScreen.UsedID,
        userName: LoginScreen.name,
        callID: widget.callId,
       
        config: ZegoUIKitPrebuiltCallConfig.oneOnOneVideoCall()
          ..onOnlySelfInRoom = (context) => Navigator.of(context).pop(),

        //  onDispose:  _onCallEnd,
        //   : 'Call duration: ${600 - _callDuration} seconds',
      ),
    );
  }
}
