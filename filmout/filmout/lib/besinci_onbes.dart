import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class BesinciOnBes extends StatefulWidget {
  const BesinciOnBes({super.key});

  @override
  State<BesinciOnBes> createState() => _BesinciOnBesState();
}

class _BesinciOnBesState extends State<BesinciOnBes> {

    // 4-) Burada youtube videosu ekliyoruz.(Video değişkeninden sonraki koda git.)
  final videoURL = "https://youtu.be/YkDJphY9q7c";

// 5-) Buraya bu kodu yazıyoruz.(initState-in içine gir.)
  late YoutubePlayerController _controller;

  @override
  void deactivate() {
    _controller.pause();
    super.deactivate();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

// 3-) Buraya initState @override-ını ekliyoruz.(Buradaki class-ın içine ve başına git.)
  @override
  void initState() {
// 6-) Buraya aşağıdaki kodu ekliyoruz.(Bir aşağıya git.)
    //final videoId = YoutubePlayer.convertUrlToId(videoURL);
// 7-) Buraya aşağıdaki kodları ekliyoruz.(body: Column(childiren[koduna git]).)
    _controller = YoutubePlayerController(
      initialVideoId: "YkDJphY9q7c",
      flags: const YoutubePlayerFlags(
        autoPlay: false,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) => YoutubePlayerBuilder(
        player: YoutubePlayer(controller: _controller),
        builder: (context, player) => Scaffold(
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
                      String? encodeQueryParameters(
                          Map<String, String> params) {
                        return params.entries
                            .map((MapEntry<String, String> e) =>
                                '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
                            .join('&');
                      }

                      final Uri emailUri = Uri(
                        scheme: 'mailto',
                        path: "l.gerez@hotmail.com",
                        query: encodeQueryParameters(<String, String>{
                          'subject':
                              'Konu: Seçilen Film ve Mola Süresini Belirtme',
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
              Card(
                child: Text(
                  "Aşk Tesadüfleri Sever Beşinci 15 Dakika",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ),
              player,
            ],
          ),
        ),
      );

}