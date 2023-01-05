import 'package:http/http.dart' as http;
import 'dart:convert';

import 'model/Video.dart';

const CHAVE_YOUTUBE_API = "AIzaSyAT5ThUZWvWqE78wsYHN5Z9L_Y0QRloQ38";
const ID_CANAL = "UCV5UiFF5AlNKW4sLXcYMG_g";
const URL_BASE = "www.googleapis.com";

class Api {
  Future<List<Video>> pesquisar(String pesquisa) async {
    var caminho = "/youtube/v3/search";

    var parametro = {
      "part": "snippet",
      "key": "$CHAVE_YOUTUBE_API", //queryParameters
      "channelId": "$ID_CANAL",
      "order": "date",
      "type": "video",
      "q": pesquisa
    };

    var url = Uri.https(URL_BASE, caminho, parametro);
    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      Map<String, dynamic> dadosJson = json.decode(response.body);

      List<Video> videos = dadosJson["items"].map<Video>((map) {
        return Video.fromJson(map);
      }).toList();

      return videos;
    } else {}

    return pesquisar(pesquisa);
  }
}
