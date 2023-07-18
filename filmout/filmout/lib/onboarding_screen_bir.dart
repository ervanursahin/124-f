import 'package:filmout/onboarding_screen_iki.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: OnBoardingScreenBir(),
    );
  }
}

class OnBoardingScreenBir extends StatelessWidget {
  const OnBoardingScreenBir({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "FilmOut",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        //title: Image.asset("assets/FilmOutLogo.png"),
      ),
      body: Column(
        children: [
          Center(
            child: Image.asset('assets/pomodoro-ile-calisanlar.jpg'),
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.check_circle,
                      size: 36,
                    ),
                    Text(
                        "Pomodoro gibi bir teknik kullanarak \n çalışan startup sahibi misiniz?"),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.check_circle,
                      size: 36,
                    ),
                    Text(
                        "Çalışırken kullandığınız mola sürelerini kaliteli ve \n keyifli bir şekilde geçirdiğinizi düşünüyor musunuz?"),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.check_circle,
                      size: 36,
                    ),
                    Text(
                        "Film, dizi ve belgesel izlemek istiyorsunuz \n ama yeterince vaktiniz mi yok?"),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.check_circle,
                      size: 36,
                    ),
                    Text(
                        "Keşke molalarımda o çok istediğim filmleri, dizi \n ve belgeselleri izleyebilsem mi diyorsunuz?"),
                  ],
                ),
              ),
            ],
          ),
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => OnBoardingScreenIki()),
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.black,
              ),
              child: Text(
                "Buyrun Devam Edelim...",
                style: TextStyle(color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }
}
