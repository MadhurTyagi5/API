import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/leetcode_viewmodel.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<LeetCodeViewModel>(context);

    if (viewModel.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    final profile = viewModel.profile;
    if (profile == null) {
      return const Center(child: Text('No Profile Data'));
    }

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
          Text(
            'Easy: ${profile.easySolved}, Medium: ${profile.mediumSolved}, Hard: ${profile.hardSolved}',
            style: const TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
