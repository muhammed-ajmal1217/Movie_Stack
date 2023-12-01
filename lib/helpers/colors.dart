import 'package:flutter/material.dart';

LinearGradient backgroundGradient() {
    return LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Color.fromARGB(255, 17, 9, 73), 
          Color.fromARGB(255, 2, 9, 36), 
          Color.fromARGB(255, 4, 2, 17), 
          ],
      );
  }

  LinearGradient carousalBackgroundColor() {
    return LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Color.fromARGB(255, 2, 168, 198), 
          Color.fromARGB(255, 9, 21, 79), 
          Color.fromARGB(255, 126, 16, 119), 
          ],
      );
  }