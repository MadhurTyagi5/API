import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/profile.dart';
import '../models/problem.dart';

class ApiService {
  final String baseUrl = "https://alfa-leetcode-api.onrender.com/user";

  Future<Profile> fetchProfile(String username) async {
    final response = await http.get(Uri.parse('$baseUrl/$username'));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return Profile.fromJson(data);
    } else {
      throw Exception('Failed to load profile');
    }
  }

  Future<List<Problem>> fetchProblems(String username) async {
    final response = await http.get(Uri.parse('$baseUrl/$username/solved'));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return (data['problems'] as List)
          .map((json) => Problem.fromJson(json))
          .toList();
    } else {
      throw Exception('Failed to load problems');
    }
  }
}
