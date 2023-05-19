import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:sample_vediocall/view/call_scren.dart';
import 'package:sample_vediocall/view/screen_call.dart';
import 'package:sample_vediocall/view/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MyCallScreen(callId: "1"),
                      ));
                },
                child: getStartedButton(texxt: "Join Now"))
          ],
        ),
      ),
    );
  }
}
