import 'package:flutter/material.dart';
import 'package:portal_berita/portal_berita_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PortalBeritaApp(),
    );
  }
}
