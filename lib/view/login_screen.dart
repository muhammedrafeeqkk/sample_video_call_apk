import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:sample_vediocall/view/home_screen.dart';
import 'package:sample_vediocall/view/widgets.dart';

import 'const/colors.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  static String name ="";
  static String UsedID ="";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 11),
              child: TextFormField(
                onChanged: (val){
                  name=val;
                },
                keyboardType: TextInputType.name,
                cursorColor: grey,
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.person,
                    color: grey,
                  ),
                  hintText: "Name",
                  hintStyle: TextStyle(
                    fontSize: 12,
                  ),
                  fillColor: greyLite,
                  filled: true,
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 14.0, horizontal: 1.0),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide.none),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 11),
              child: TextFormField(
                onChanged: (val){
                  UsedID=val;
                },
                keyboardType: TextInputType.name,
                cursorColor: grey,
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.edit,
                    color: grey,
                  ),
                  hintText: "UsedID",
                  hintStyle: TextStyle(
                    fontSize: 12,
                  ),
                  fillColor: greyLite,
                  filled: true,
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 14.0, horizontal: 1.0),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide.none),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomeScreen(),
                      ));
                },
                child: getStartedButton(texxt: "Login"))
          ],
        ),
      )),
    );
  }
}
