class Problem {
  final int id;
  final String title;
  final String difficulty; 
  final bool isSolved;

  
  const Problem({
    required this.id,
    required this.title,
    required this.difficulty,
    required this.isSolved,
  });

  
  factory Problem.fromJson(Map<String, dynamic> json) => Problem(
        id: json['id'] as int,
        title: json['title'] as String,
        difficulty: json['difficulty'] as String,
        isSolved: json['isSolved'] as bool,
      );


  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'difficulty': difficulty,
        'isSolved': isSolved,
      };
}
