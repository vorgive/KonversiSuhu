import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:aplikasikalkulator/login_page.dart'; // arah import ke halaman login
import 'suhu_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => SuhuProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MyLoginPage(), // diarahkan ke halaman login
      ),
    ),
  );
}
