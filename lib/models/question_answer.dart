class QuestionAnswer {
  final String id;
  final String question;
  final String answer;
  final int likes;
  final String timestamp;

  QuestionAnswer(
      {required this.id,
      required this.question,
      required this.answer,
      required this.likes,
      required this.timestamp});


  factory QuestionAnswer.fromJson(Map<String, dynamic> json) => QuestionAnswer(
    id: json["id"],
    question: json["question"],
    answer: json["answer"],
    likes: json["likes"],
    timestamp: json["timestamp"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "question": question,
    "answer": answer,
    "likes": likes,
    "timestamp": timestamp,
  };

  @override
  String toString() {
    return 'Course - \n$id\t$question\t$answer\t$likes\t$timestamp';
  }

}
