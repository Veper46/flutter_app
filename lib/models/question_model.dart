class Question {
  // question have an id
  final String id;
  // question have a title
  final String title;
  // question have option
  final Map<String, bool> option;
  // 1 = true, 2 false

  // contructor

  Question({
    required this.id,
    required this.option,
    required this.title,
  });

  //overide

  @override
  String toString() {
    return 'Question(id: $id, title: $title, option: $option)';
  }
}
