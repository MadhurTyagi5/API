import 'package:flutter/material.dart';
import '../models/problem.dart';
import '../services/mock_api.dart';

class ProblemsScreen extends StatelessWidget {
  final MockApi api = MockApi();

  ProblemsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Problems')),
      body: FutureBuilder<List<Problem>>(
        future: api.fetchProblems(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No Problems Found'));
          }

          final problems = snapshot.data!;

          return ListView.builder(
            itemCount: problems.length,
            itemBuilder: (context, index) {
              final problem = problems[index];
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
        },
      ),
    );
  }
}
