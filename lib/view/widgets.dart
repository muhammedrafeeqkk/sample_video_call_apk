import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'const/colors.dart';

Container getStartedButton({required String texxt}) {
  return Container(
    decoration: BoxDecoration(
      gradient: myGreenLiteGradient,
      borderRadius: BorderRadius.circular(30),
    ),
    width: 342,
    height: 57,
    child: Center(
      child: Text(
        texxt,
        style: TextStyle(
            fontWeight: FontWeight.bold, color: Colors.white, fontSize: 16),
      ),
    ),
  );
}
