import 'package:flutter/material.dart';
import '../models/profile.dart';
import '../models/problem.dart';
import '../services/api.dart';
import '../utils/shared_prefs.dart';

class LeetCodeViewModel extends ChangeNotifier {
  final ApiService _apiService = ApiService();
  Profile? profile;
  List<Problem> problems = [];
  bool isLoading = false;

  Future<void> init() async {
    final username = await SharedPrefs.getUsername();
    if (username != null) {
      await fetchProfileAndProblems(username);
    }
  }

  Future<void> fetchProfileAndProblems(String username) async {
    isLoading = true;
    notifyListeners();

    SharedPrefs.saveUsername(username);

    profile = await _apiService.fetchProfile(username);
    problems = await _apiService.fetchProblems(username);

    isLoading = false;
    notifyListeners();
  }
}
