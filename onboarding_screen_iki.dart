import 'package:filmout/ana_sayfa.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: OnBoardingScreenIki(),
    );
  }
}

class OnBoardingScreenIki extends StatefulWidget {
  const OnBoardingScreenIki({super.key});

  @override
  State<OnBoardingScreenIki> createState() => _OnBoardingScreenIkiState();
}

class _OnBoardingScreenIkiState extends State<OnBoardingScreenIki> {
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
          actions: <Widget>[
            IconButton(
              //İkonu Mail Adresine Yönlendirme Başlangıç
                onPressed: () async {
                  String? encodeQueryParameters(Map<String, String> params) {
                    return params.entries
                        .map((MapEntry<String, String> e) =>
                            '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
                        .join('&');
                  }

                  final Uri emailUri = Uri(
                    scheme: 'mailto',
                    path: "l.gerez@hotmail.com",
                    query: encodeQueryParameters(<String, String>{
                      'subject': 'Konu: Seçilen Film ve Mola Süresini Belirtme',
                      'body':
                          "Lütfen izlemek istediğiniz film/dizi/belgesel vb. yazın veya buraya yükleyin ve mola sürenizi yazın.",
                    }),
                  );

                  // if (await canLaunchUrl(emailUri)) {
                  //   launchUrl(emailUri);
                  // } else {
                  //   throw Exception("$emailUri bulunamadı.");
                  // }

                  try {
                    await launchUrl(emailUri);
                  } catch (e) {
                    print(e.toString());
                  }

                  launchUrl(emailUri);
                  //İkonu Mail Adresine Yönlendirme Bitiş
                },
                icon: const Icon(Icons.alternate_email))
          ]
          ),
      body: Column(
        children: [
          Center(
            child: Image.asset('assets/kronometre.webp'),
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Icon(
                    //   Icons.star,
                    //   size: 24,
                    // ),
                    Text(
                      "O halde size şahane bir haberimiz var:",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.star,
                      size: 36,
                    ),
                    Text(
                        "Artık istediğinizi mola sürelerinize \n böldürerek izleyebileceksiniz,"),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.star,
                      size: 36,
                    ),
                    Text(
                        "Hem sevdiğiniz film/dizileri seyredip hem de \n molalarınızı keyifli bir hale getirebileceksiniz."),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.star,
                      size: 36,
                    ),
                    Text(
                      "Peki bu nasıl olacak?",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.star,
                      size: 36,
                    ),
                    Text(
                        "Sağ üstte yer alan e-mail ikonuna tıklayarak \n email adresimize izlemek istediğiniz \n film/dizi vb.nin adresini ve mola sürelerinizi \n (örneğin 15 dk) yazarak gönderiyorsunuz,"),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.star,
                      size: 36,
                    ),
                    Text(
                        "Biz de istediğiniz sürelere bölünmüş bir şekilde \n uygulamaya periyotlar halinde yüklüyoruz."),
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
                      builder: (context) =>
                          AnaSayfa()), //firebase çalıştığı zaman burası GirisSecenekleri sayfasına gidecek
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.black,
              ),
              child: Text(
                "Ana Sayfa'ya Göz Atmak İster Misiniz?",
                style: TextStyle(color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }
}
