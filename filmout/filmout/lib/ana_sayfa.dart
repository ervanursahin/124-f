import 'package:filmout/ask_tesadufleri_sever_filmi.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AnaSayfa extends StatefulWidget {
  const AnaSayfa({super.key});

  @override
  State<AnaSayfa> createState() => _AnaSayfaState();
}

class _AnaSayfaState extends State<AnaSayfa> {
  final videoURL = "https://www.youtube.com/watch?v=qJYljBrFNs0";

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
//NOT: BURASI ROW OLAMAZ O ZAMAN İÇİNDEKİ LİST'İN ÖZELLİĞİNDEN DOLAYI HATA VERİYOR.
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Filmlerin Listesi",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
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
          Card(
            //kartın borderının kodu:
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child: ListTile(
              //Bu en soldaki ikonun kodu:
              //NOT: Buraya image gibi öğeler de gelebilir ancak network ile getirmek istiyorsak bağlantı adresini değil resim adresini buraya eklememiz gerekir.
              leading: Image.asset('assets/ask_tesadüfleri_sever.jpg'),
              title: Text("Aşk Tesadüfleri Sever"),
              subtitle: Text("15 dakikalık periyotlara ayrıldı."),
              //Bu en sağdaki ikonun kodu:
              trailing: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            AskTesadufleriSeverFilmi()), //firebase çalıştığı zaman burası GirisSecenekleri sayfasına gidecek
                  );
                },
                child: Icon(Icons.chevron_right),
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
        ],
      ),
    );
  }
}
