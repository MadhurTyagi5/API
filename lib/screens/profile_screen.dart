import 'package:flutter/material.dart';
import '../models/profile.dart';
import '../services/mock_api.dart';

class ProfileScreen extends StatelessWidget {
  final MockApi api = MockApi();

  ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: FutureBuilder<Profile>(
        future: api.fetchProfile(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData) {
            return const Center(child: Text('No Profile Data'));
          }

          final profile = snapshot.data!;
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Username: ${profile.username}', style: const TextStyle(fontSize: 20)),
                const SizedBox(height: 8),
                Text('Reputation: ${profile.reputation}', style: const TextStyle(fontSize: 16)),
                const SizedBox(height: 8),
                Text('Total Solved: ${profile.totalSolved}', style: const TextStyle(fontSize: 16)),
                const SizedBox(height: 8),
                Text('Easy: ${profile.easySolved}, Medium: ${profile.mediumSolved}, Hard: ${profile.hardSolved}',
                    style: const TextStyle(fontSize: 16)),
              ],
            ),
          );
        },
      ),
    );
  }
}
