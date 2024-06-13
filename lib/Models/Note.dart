class Note {
  final int id;
  final String title;
  final String body;
  final String date;
  final bool isUpdated;

  Note({
    required this.id,
    required this.title,
    required this.body,
    required this.date,
    required this.isUpdated,
  });

  factory Note.fromJson(Map<String, dynamic> json) {
    return Note(
      id: json['id'],
      title: json['title'],
      body: json['body'],
      date: json['date'],
      isUpdated: json['updated'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'body': body,
      'date': date,
      'updated': isUpdated,
    };
  }
}
