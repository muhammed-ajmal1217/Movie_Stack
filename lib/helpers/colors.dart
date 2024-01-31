import 'package:flutter/material.dart';

LinearGradient backgroundGradient() {
  return const LinearGradient(
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
  return const LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color.fromARGB(255, 2, 168, 198),
      Color.fromARGB(255, 9, 21, 79),
      Color.fromARGB(255, 126, 16, 119),
    ],
  );
}

LinearGradient detailsPageBlurr() {
  return LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    stops: const [0.1, 0.3, 0.5, 0.7, 0.9],
    colors: [
      const Color.fromARGB(255, 24, 24, 24).withOpacity(0.01),
      const Color.fromARGB(255, 24, 24, 24).withOpacity(0.3),
      const Color.fromARGB(255, 7, 5, 60).withOpacity(0.6),
      const Color.fromARGB(255, 3, 3, 49).withOpacity(0.9),
      const Color.fromARGB(255, 8, 3, 43),
    ],
  );
}
