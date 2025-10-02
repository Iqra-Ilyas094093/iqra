import 'package:flutter/material.dart';
import 'package:iqra/view/screen/master.dart';
import 'package:iqra/view/widgets/side_drawer.dart';
import 'package:iqra/view_model/view_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=>SideDrawerProvider())
      ],
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
         colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightGreen),
      ),
      home: Master(),
    );
  }
}
