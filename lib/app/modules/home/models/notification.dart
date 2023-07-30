class NotificationModel{
  late String? id;
  late String title;
  late String body;
  late String image;
  late String date;

  NotificationModel(
      {required this.id,
        required this.title,
        required this.body,
        required this.image,
        required this.date}
      );

  NotificationModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    body = json['body'];
    image = json['image'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['body'] = body;
    data['image'] = image;
    data['date'] = date;
    return data;
  }


}