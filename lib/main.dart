import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'viewmodels/leetcode_viewmodel.dart';
import 'screens/profile_screen.dart';
import 'screens/problems_screen.dart';
import 'screens/submissions_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => LeetCodeViewModel()..init(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LeetCode Dummy App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
   const ProfileScreen(),
   const ProblemsScreen(),
    const SubmissionsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Problems'),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: 'Submissions'),
        ],
      ),
    );
  }
}
