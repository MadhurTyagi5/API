import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/leetcode_viewmodel.dart';

class SubmissionsScreen extends StatelessWidget {
  const SubmissionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<LeetCodeViewModel>(context);

    if (viewModel.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    final problems = viewModel.problems;
    if (problems.isEmpty) {
      return const Center(child: Text('No Submissions Found'));
    }

    final recentSubmissions = problems.take(5).toList();

    return ListView.builder(
      itemCount: recentSubmissions.length,
      itemBuilder: (context, index) {
        final problem = recentSubmissions[index];
        return Card(
          margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
          child: ListTile(
            title: Text(problem.title),
            subtitle: Text('Difficulty: ${problem.difficulty}'),
            trailing: Icon(
              problem.isSolved ? Icons.check_circle : Icons.pending,
              color: problem.isSolved ? Colors.green : Colors.grey,
            ),
          ),
        );
      },
    );
  }
}
