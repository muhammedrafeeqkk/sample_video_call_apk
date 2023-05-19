import 'package:flutter/cupertino.dart';
import 'package:sample_vediocall/view/home_screen.dart';
import 'package:sample_vediocall/view/login_screen.dart';

import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';

import 'const/const.dart';

class CallPage extends StatelessWidget {
  const CallPage({Key? key, required this.callID}) : super(key: key);
  final String callID;

  @override
  Widget build(BuildContext context) {
    return ZegoUIKitPrebuiltCall(
      appID: MyConsts.appID, // Fill in the appID that you get from ZEGOCLOUD Admin Console.
      appSign: MyConsts.appSign, // Fill in the appSign that you get from ZEGOCLOUD Admin Console.
      userID: LoginScreen.UsedID,
      userName: LoginScreen.name,
      callID: callID,
      // You can also use groupVideo/groupVoice/oneOnOneVoice to make more types of calls.
      config: ZegoUIKitPrebuiltCallConfig.oneOnOneVideoCall() 
        ..onOnlySelfInRoom = (context) => Navigator.of(context).pop(),
    );
  }
}