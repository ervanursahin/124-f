import 'package:filmout/giris_yap.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: GirisSecenekleri(),
    );
  }
}

class GirisSecenekleri extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          "FilmOut",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 200),
            child: Text(
              "Giriş Seçenekleri:",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(
                top: 50,
              ),
              child: OutlinedButton(
                child: const Text(
                  "Giriş Yap",
                  style: TextStyle(color: Colors.black),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => GirisYap()),
                  );
                },
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(
              top: 50,
            ),
            child: OutlinedButton(
              onPressed: _kayitOl,
              child: Text(
                "Kayıt Ol",
                style: TextStyle(color: Colors.black),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(
              top: 50,
            ),
            child: OutlinedButton(
              onPressed: _misafirGirisiYap,
              child: Text(
                "Misafir Girişi Yap",
                style: TextStyle(color: Colors.black),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

void _kayitOl() {}

void _misafirGirisiYap() {}
