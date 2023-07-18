import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:filmout/firebase_options.dart';
import 'package:filmout/onboarding_screen_bir.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late FirebaseAuth auth;

  @override
  void initState() {
    
    super.initState();
    auth = FirebaseAuth.instance;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 200),
            child: Center(
              child: Image.asset('assets/filmout.png'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: const Text(
                "Sevdiğiniz Dizi/Filmleri Mola Sürenize Göre İzleyin"),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => OnBoardingScreenBir()),
              );
            },
            style: ElevatedButton.styleFrom(
              primary: Colors.black,
            ),
            child: Text(
              "Bakalım Neymiş Bu FilmOut?",
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
