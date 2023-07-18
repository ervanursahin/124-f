import 'package:flutter/material.dart';

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FilmDiziEkrani(),
    );
  }
}

class FilmDiziEkrani extends StatefulWidget {
  @override
  State<FilmDiziEkrani> createState() => _FilmDiziEkraniState();
}

class _FilmDiziEkraniState extends State<FilmDiziEkrani> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          "FilmOut",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          
        ],
      ),
    );
  }
}
