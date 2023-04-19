class QuestionAnswer {
  final String ID;
  final String question;
  final String answer;
  final int likes;
  final String timestamp;

  QuestionAnswer(
      {required this.ID,
      required this.question,
      required this.answer,
      required this.likes,
      required this.timestamp});


  factory QuestionAnswer.fromJson(Map<String, dynamic> json) => QuestionAnswer(
    ID: json["ID"],
    question: json["question"],
    answer: json["answer"],
    likes: json["likes"],
    timestamp: json["timestamp"],
  );

  Map<String, dynamic> toJson() => {
    "ID": ID,
    "question": question,
    "answer": answer,
    "likes": likes,
    "timestamp": timestamp,
  };

  @override
  String toString() {
    return 'Course - \n$ID\t$question\t$answer\t$likes\t$timestamp';
  }

}
