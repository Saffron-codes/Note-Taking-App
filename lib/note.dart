class Note {
  final int id;
  final String title;
  final String content;
  final DateTime dateTime;

  Note(
      {required this.id,
      required this.title,
      required this.content,
      required this.dateTime});
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'content': content,
      'dateTime':dateTime
    };
  }
  @override
  String toString() {
    return 'Employee{id: $id, title: $title,content:$content, dateTime: $dateTime}';
  }
}
