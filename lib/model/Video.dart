class Video {
  String id;
  String titulo;
  String description;
  String imagem;
  String canal;

  Video({this.id, this.titulo, this.description, this.imagem, this.canal});

  // static convertJson(Map<String, dynamic> json) {
  //   return Video(
  //     id: json["id"]["videoId"],
  //     title: json["snippet"]["title"],
  //     imagem: json["snippet"]["thumbnails"]["high"]["url"],
  //     canal: json["snippet"]["channelId"],
  //   );
  // }

  factory Video.fromJson(Map<String, dynamic> json) {
    return Video(
      id: json["id"]["videoId"],
      titulo: json["snippet"]["title"],
      description: json["snippet"]["description"],
      imagem: json["snippet"]["thumbnails"]["high"]["url"],
      canal: json["snippet"]["channelTitle"],
    );
  }
}
