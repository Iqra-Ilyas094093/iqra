import 'package:flutter/material.dart';
import 'package:iqra/view/screen/master.dart';
import 'package:iqra/view/widgets/side_drawer.dart';
import 'package:iqra/view_model/view_model.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(url: "https://bedfjptskbeijvvyvlqy.supabase.co", anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImJlZGZqcHRza2JlaWp2dnl2bHF5Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTk5OTA1NzEsImV4cCI6MjA3NTU2NjU3MX0.Hhp5RpAWzAhWElHsZfNEDzL3FX8k-qeWxbZAfu2ZKO8');
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
