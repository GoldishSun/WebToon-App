class WebToonModel {
  final String title, thumb, id;

  WebToonModel({
    required this.title,
    required this.thumb,
    required this.id,
  });

  WebToonModel.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        thumb = json['thumb'],
        id = json['id'];
}
