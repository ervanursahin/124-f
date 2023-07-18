import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:filmout/ilk_onbes.dart';
import 'package:filmout/ikinci_onbes.dart';
import 'package:filmout/ucuncu_onbes.dart';
import 'package:filmout/dorduncu_onbes.dart';
import 'package:filmout/besinci_onbes.dart';
import 'package:filmout/altinci_onbes.dart';
import 'package:filmout/yedinci_onbes.dart';
import 'package:filmout/sekizinci_onbes.dart';

class AskTesadufleriSeverFilmi extends StatefulWidget {
  const AskTesadufleriSeverFilmi({super.key});

  @override
  State<AskTesadufleriSeverFilmi> createState() =>
      _AskTesadufleriSeverFilmiState();
}

class _AskTesadufleriSeverFilmiState extends State<AskTesadufleriSeverFilmi> {
  final videoURL = "https://www.youtube.com/watch?v=qJYljBrFNs0";

  late YoutubePlayerController _controller;

  @override
  void initState() {
    //final videoID = YoutubePlayer.convertUrlToId(videoURL);
    _controller = YoutubePlayerController(
        initialVideoId: "qJYljBrFNs0",
        flags: YoutubePlayerFlags(
          autoPlay: false,
        ));

    super.initState();
  }

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

                  try {
                    await launchUrl(emailUri);
                  } catch (e) {
                    print(e.toString());
                  }

                  launchUrl(emailUri);
//İkonu Mail Adresine Yönlendirme Bitiş
                },
                icon: const Icon(Icons.alternate_email))
          ]),
      body: ListView(
        children: [
          Column(
            children: [
              Card(
                child: YoutubePlayer(
                  controller: _controller,
                  showVideoProgressIndicator: true,
                ),
              ),
              Container(
                child: SizedBox(
                  child: Card(
                    child: Text(
                      "Aşk Tesadüfleri Sever \n Süre: 122 dk \n Ayrıldığı Periyot Süresi: 15'er dk",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              //İki ögeyi birbirinden ayıran ince çizginin kodu:
              Divider(
                color: Colors.black,
                //Çizginin kalınlığının kodu:
                thickness: 1,
                //Çizginin kartın en tepesiyle arasındaki mesafenin kodu:
                height: 20,
                //Çizginin sol tarafla arasındaki mesafe
                indent: 10,
                //Çizginin sağ tarafla arasındaki mesafe
                endIndent: 10,
              ),
            ],
          ),
//İlk 15 Dakika Başlangıç
          Card(
            //kartın borderının kodu:
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child: ListTile(
              //Bu en soldaki ikonun kodu:
              //NOT: Buraya image gibi öğeler de gelebilir ancak network ile getirmek istiyorsak bağlantı adresini değil resim adresini buraya eklememiz gerekir.
              leading: Image.asset('assets/ilk_onbes.jpeg'),
              title: Text("İlk 15"),
              subtitle: Text("15 dakikalık periyotlara ayrıldı."),
              //Bu en sağdaki ikonun kodu:
              trailing: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            IlkOnBes()), //firebase çalıştığı zaman burası GirisSecenekleri sayfasına gidecek
                  );
                },
                child: Icon(Icons.play_arrow),
                style: ButtonStyle(
                    iconColor: MaterialStatePropertyAll(Colors.white),
                    backgroundColor: MaterialStatePropertyAll(Colors.black)),
              ),
            ),
          ),
          //İki ögeyi birbirinden ayıran ince çizginin kodu:
          Divider(
            color: Colors.black,
            //Çizginin kalınlığının kodu:
            thickness: 1,
            //Çizginin kartın en tepesiyle arasındaki mesafenin kodu:
            height: 10,
            //Çizginin sol tarafla arasındaki mesafe
            indent: 10,
            //Çizginin sağ tarafla arasındaki mesafe
            endIndent: 10,
          ),
//İlk 15 Dakika Bitiş

//İkinci 15 Dakika Başlangıç
          Card(
            //kartın borderının kodu:
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child: ListTile(
              //Bu en soldaki ikonun kodu:
              //NOT: Buraya image gibi öğeler de gelebilir ancak network ile getirmek istiyorsak bağlantı adresini değil resim adresini buraya eklememiz gerekir.
              leading: Image.asset('assets/ikinci_onbes.jpeg'),
              title: Text("İkinci 15"),
              subtitle: Text("15 dakikalık periyotlara ayrıldı."),
              //Bu en sağdaki ikonun kodu:
              trailing: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            IkinciOnBes()), //firebase çalıştığı zaman burası GirisSecenekleri sayfasına gidecek
                  );
                },
                child: Icon(Icons.play_arrow),
                style: ButtonStyle(
                    iconColor: MaterialStatePropertyAll(Colors.white),
                    backgroundColor: MaterialStatePropertyAll(Colors.black)),
              ),
            ),
          ),
          //İki ögeyi birbirinden ayıran ince çizginin kodu:
          Divider(
            color: Colors.black,
            //Çizginin kalınlığının kodu:
            thickness: 1,
            //Çizginin kartın en tepesiyle arasındaki mesafenin kodu:
            height: 10,
            //Çizginin sol tarafla arasındaki mesafe
            indent: 10,
            //Çizginin sağ tarafla arasındaki mesafe
            endIndent: 10,
          ),
//İkinci 15 Dakika Bitiş

//Üçüncü 15 Dakika Başlangıç
          Card(
            //kartın borderının kodu:
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child: ListTile(
              //Bu en soldaki ikonun kodu:
              //NOT: Buraya image gibi öğeler de gelebilir ancak network ile getirmek istiyorsak bağlantı adresini değil resim adresini buraya eklememiz gerekir.
              leading: Image.asset('assets/ucuncu_onbes.webp'),
              title: Text("Üçüncü 15"),
              subtitle: Text("15 dakikalık periyotlara ayrıldı."),
              //Bu en sağdaki ikonun kodu:
              trailing: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            UcuncuOnBes()), //firebase çalıştığı zaman burası GirisSecenekleri sayfasına gidecek
                  );
                },
                child: Icon(Icons.play_arrow),
                style: ButtonStyle(
                    iconColor: MaterialStatePropertyAll(Colors.white),
                    backgroundColor: MaterialStatePropertyAll(Colors.black)),
              ),
            ),
          ),
          //İki ögeyi birbirinden ayıran ince çizginin kodu:
          Divider(
            color: Colors.black,
            //Çizginin kalınlığının kodu:
            thickness: 1,
            //Çizginin kartın en tepesiyle arasındaki mesafenin kodu:
            height: 10,
            //Çizginin sol tarafla arasındaki mesafe
            indent: 10,
            //Çizginin sağ tarafla arasındaki mesafe
            endIndent: 10,
          ),
//Üçüncü 15 Dakika Bitiş

//Dördüncü 15 Dakika Başlangıç
          Card(
            //kartın borderının kodu:
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child: ListTile(
              //Bu en soldaki ikonun kodu:
              //NOT: Buraya image gibi öğeler de gelebilir ancak network ile getirmek istiyorsak bağlantı adresini değil resim adresini buraya eklememiz gerekir.
              leading: Image.asset('assets/dorduncu_onbes.webp'),
              title: Text("Dördüncü 15"),
              subtitle: Text("15 dakikalık periyotlara ayrıldı."),
              //Bu en sağdaki ikonun kodu:
              trailing: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            DorduncuOnBes()), //firebase çalıştığı zaman burası GirisSecenekleri sayfasına gidecek
                  );
                },
                child: Icon(Icons.play_arrow),
                style: ButtonStyle(
                    iconColor: MaterialStatePropertyAll(Colors.white),
                    backgroundColor: MaterialStatePropertyAll(Colors.black)),
              ),
            ),
          ),
          //İki ögeyi birbirinden ayıran ince çizginin kodu:
          Divider(
            color: Colors.black,
            //Çizginin kalınlığının kodu:
            thickness: 1,
            //Çizginin kartın en tepesiyle arasındaki mesafenin kodu:
            height: 10,
            //Çizginin sol tarafla arasındaki mesafe
            indent: 10,
            //Çizginin sağ tarafla arasındaki mesafe
            endIndent: 10,
          ),
//Dördüncü 15 Dakika Bitiş

//Beşinci 15 Dakika Başlangıç
          Card(
            //kartın borderının kodu:
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child: ListTile(
              //Bu en soldaki ikonun kodu:
              //NOT: Buraya image gibi öğeler de gelebilir ancak network ile getirmek istiyorsak bağlantı adresini değil resim adresini buraya eklememiz gerekir.
              leading: Image.asset('assets/besinci_onbes.webp'),
              title: Text("Beşinci 15"),
              subtitle: Text("15 dakikalık periyotlara ayrıldı."),
              //Bu en sağdaki ikonun kodu:
              trailing: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            BesinciOnBes()), //firebase çalıştığı zaman burası GirisSecenekleri sayfasına gidecek
                  );
                },
                child: Icon(Icons.play_arrow),
                style: ButtonStyle(
                    iconColor: MaterialStatePropertyAll(Colors.white),
                    backgroundColor: MaterialStatePropertyAll(Colors.black)),
              ),
            ),
          ),
          //İki ögeyi birbirinden ayıran ince çizginin kodu:
          Divider(
            color: Colors.black,
            //Çizginin kalınlığının kodu:
            thickness: 1,
            //Çizginin kartın en tepesiyle arasındaki mesafenin kodu:
            height: 10,
            //Çizginin sol tarafla arasındaki mesafe
            indent: 10,
            //Çizginin sağ tarafla arasındaki mesafe
            endIndent: 10,
          ),
//Beşinci 15 Dakika Bitiş

//Altıncı 15 Dakika Başlangıç
          Card(
            //kartın borderının kodu:
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child: ListTile(
              //Bu en soldaki ikonun kodu:
              //NOT: Buraya image gibi öğeler de gelebilir ancak network ile getirmek istiyorsak bağlantı adresini değil resim adresini buraya eklememiz gerekir.
              leading: Image.asset('assets/altinci_onbes.webp'),
              title: Text("Altıncı 15"),
              subtitle: Text("15 dakikalık periyotlara ayrıldı."),
              //Bu en sağdaki ikonun kodu:
              trailing: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            AltinciOnBes()), //firebase çalıştığı zaman burası GirisSecenekleri sayfasına gidecek
                  );
                },
                child: Icon(Icons.play_arrow),
                style: ButtonStyle(
                    iconColor: MaterialStatePropertyAll(Colors.white),
                    backgroundColor: MaterialStatePropertyAll(Colors.black)),
              ),
            ),
          ),
          //İki ögeyi birbirinden ayıran ince çizginin kodu:
          Divider(
            color: Colors.black,
            //Çizginin kalınlığının kodu:
            thickness: 1,
            //Çizginin kartın en tepesiyle arasındaki mesafenin kodu:
            height: 10,
            //Çizginin sol tarafla arasındaki mesafe
            indent: 10,
            //Çizginin sağ tarafla arasındaki mesafe
            endIndent: 10,
          ),
//Altıncı 15 Dakika Bitiş

//Yedinci 15 Dakika Başlangıç
          Card(
            //kartın borderının kodu:
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child: ListTile(
              //Bu en soldaki ikonun kodu:
              //NOT: Buraya image gibi öğeler de gelebilir ancak network ile getirmek istiyorsak bağlantı adresini değil resim adresini buraya eklememiz gerekir.
              leading: Image.asset('assets/yedinci_onbes.webp'),
              title: Text("Yedinci 15"),
              subtitle: Text("15 dakikalık periyotlara ayrıldı."),
              //Bu en sağdaki ikonun kodu:
              trailing: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            YedinciOnBes()), //firebase çalıştığı zaman burası GirisSecenekleri sayfasına gidecek
                  );
                },
                child: Icon(Icons.play_arrow),
                style: ButtonStyle(
                    iconColor: MaterialStatePropertyAll(Colors.white),
                    backgroundColor: MaterialStatePropertyAll(Colors.black)),
              ),
            ),
          ),
          //İki ögeyi birbirinden ayıran ince çizginin kodu:
          Divider(
            color: Colors.black,
            //Çizginin kalınlığının kodu:
            thickness: 1,
            //Çizginin kartın en tepesiyle arasındaki mesafenin kodu:
            height: 10,
            //Çizginin sol tarafla arasındaki mesafe
            indent: 10,
            //Çizginin sağ tarafla arasındaki mesafe
            endIndent: 10,
          ),
//Yedinci 15 Dakika Bitiş

//Sekizinci 15 Dakika Başlangıç
          Card(
            //kartın borderının kodu:
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child: ListTile(
              //Bu en soldaki ikonun kodu:
              //NOT: Buraya image gibi öğeler de gelebilir ancak network ile getirmek istiyorsak bağlantı adresini değil resim adresini buraya eklememiz gerekir.
              leading: Image.asset('assets/sekizinci_onbes.webp'),
              title: Text("Sekizinci 15"),
              subtitle: Text("15 dakikalık periyotlara ayrıldı."),
              //Bu en sağdaki ikonun kodu:
              trailing: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            SekizinciOnBes()), //firebase çalıştığı zaman burası GirisSecenekleri sayfasına gidecek
                  );
                },
                child: Icon(Icons.play_arrow),
                style: ButtonStyle(
                    iconColor: MaterialStatePropertyAll(Colors.white),
                    backgroundColor: MaterialStatePropertyAll(Colors.black)),
              ),
            ),
          ),
          //İki ögeyi birbirinden ayıran ince çizginin kodu:
          Divider(
            color: Colors.black,
            //Çizginin kalınlığının kodu:
            thickness: 1,
            //Çizginin kartın en tepesiyle arasındaki mesafenin kodu:
            height: 10,
            //Çizginin sol tarafla arasındaki mesafe
            indent: 10,
            //Çizginin sağ tarafla arasındaki mesafe
            endIndent: 10,
          ),
//Sekizinci 15 Dakika Bitiş

// //Kalan Son 2 Dakika Başlangıç
//           Card(
//             //kartın borderının kodu:
//             shape:
//                 RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
//             child: ListTile(
//               //Bu en soldaki ikonun kodu:
//               //NOT: Buraya image gibi öğeler de gelebilir ancak network ile getirmek istiyorsak bağlantı adresini değil resim adresini buraya eklememiz gerekir.
//               leading: Image.asset('assets/ask_tesadüfleri_sever.jpg'),
//               title: Text("Kalan Son 2 Dakika"),
//               subtitle: Text("15 dakikalık periyotlara ayrıldı."),
//               //Bu en sağdaki ikonun kodu:
//               trailing: ElevatedButton(
//                 onPressed: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                         builder: (context) =>
//                             IlkOnBes()), //firebase çalıştığı zaman burası GirisSecenekleri sayfasına gidecek
//                   );
//                 },
//                 child: Icon(Icons.play_arrow),
//                 style: ButtonStyle(
//                     iconColor: MaterialStatePropertyAll(Colors.white),
//                     backgroundColor: MaterialStatePropertyAll(Colors.black)),
//               ),
//             ),
//           ),
//           //İki ögeyi birbirinden ayıran ince çizginin kodu:
//           Divider(
//             color: Colors.black,
//             //Çizginin kalınlığının kodu:
//             thickness: 1,
//             //Çizginin kartın en tepesiyle arasındaki mesafenin kodu:
//             height: 10,
//             //Çizginin sol tarafla arasındaki mesafe
//             indent: 10,
//             //Çizginin sağ tarafla arasındaki mesafe
//             endIndent: 10,
//           ),
// //Kalan Son 2 Dakika Bitiş
        ],
      ),
    );
  }
}
