class Submission {
  final int id;
  final String problemTitle;
  final String status;
  final String language;
  final String date;

  const Submission({
    required this.id,
    required this.problemTitle,
    required this.status,
    required this.language,
    required this.date,
  });

  factory Submission.fromJson(Map<String, dynamic> json) => Submission(
        id: json['id'] as int,
        problemTitle: json['problemTitle'] as String,
        status: json['status'] as String,
        language: json['language'] as String,
        date: json['date'] as String,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'problemTitle': problemTitle,
        'status': status,
        'language': language,
        'date': date,
      };
}
