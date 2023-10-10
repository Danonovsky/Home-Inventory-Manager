import 'package:flutter/material.dart';
import 'package:home_manager/pages/wrapper_page.dart';
import 'package:home_manager/services/store_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Home Manager',
      theme: ThemeData(
        primaryColor: Colors.purple,
        brightness: Brightness.dark,
        useMaterial3: true,
      ),
      home: ChangeNotifierProvider<StoreProvider>(
        create: (_) => StoreProvider(),
        child: const WrapperPage(title: 'Home Manager'),
      ),
    );
  }
}
