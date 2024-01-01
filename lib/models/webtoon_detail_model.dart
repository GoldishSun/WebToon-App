class WebToonDetailModel {
  String title, about, genre, age, thumb;
  WebToonDetailModel({
    required this.title,
    required this.about,
    required this.genre,
    required this.age,
    required this.thumb,
  });
  WebToonDetailModel.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        about = json['about'],
        genre = json['genre'],
        age = json['age'],
        thumb = json['thumb'];
}
