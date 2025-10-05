import '../models/profile.dart';
import '../models/problem.dart';
import '../models/submission.dart';
import 'dart:async';

class MockApi {
  // Simulate fetching profile
  Future<Profile> fetchProfile() async {
    await Future.delayed(Duration(seconds: 1));
    return Profile(
      username: "Madhur",
      reputation: 1234,
      totalSolved: 250,
      easySolved: 120,
      mediumSolved: 100,
      hardSolved: 30,
    );
  }

  // Simulate fetching problems
  Future<List<Problem>> fetchProblems() async {
    await Future.delayed(Duration(seconds: 1));
    return [
      Problem(id: 1, title: "Two Sum", difficulty: "Easy", isSolved: true),
      Problem(id: 2, title: "Add Two Numbers", difficulty: "Medium", isSolved: false),
      Problem(id: 3, title: "Longest Substring Without Repeating Characters", difficulty: "Hard", isSolved: true),
    ];
  }

  // Simulate fetching submissions
  Future<List<Submission>> fetchSubmissions() async {
    await Future.delayed(Duration(seconds: 1));
    return [
      Submission(id: 1, problemTitle: "Two Sum", status: "Accepted", language: "Dart", date: "2025-10-05"),
      Submission(id: 2, problemTitle: "Add Two Numbers", status: "Wrong Answer", language: "Python", date: "2025-10-04"),
      Submission(id: 3, problemTitle: "Longest Substring", status: "Accepted", language: "Java", date: "2025-10-03"),
    ];
  }
}
