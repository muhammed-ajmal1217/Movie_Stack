import 'package:flutter/material.dart';

class NewsHot extends StatefulWidget {
  const NewsHot({super.key});

  @override
  State<NewsHot> createState() => _NewsHotState();
}

class _NewsHotState extends State<NewsHot> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Text('News Hot'),
      ),
    );
  }
}