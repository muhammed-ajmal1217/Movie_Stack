import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:themovieapp/controller/bottom_bar_provider.dart';
import 'package:themovieapp/controller/home_provider.dart';
import 'package:themovieapp/controller/search_provider.dart';
import 'package:themovieapp/widgets/bottom_bar.dart';

void main(){
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context)=>HomeProvider()),
        ChangeNotifierProvider(create: (context)=>SearchProvider()),
        ChangeNotifierProvider(create: (context)=>BottomBarProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: BottomBarExample(),
      ),
    );
  }
}