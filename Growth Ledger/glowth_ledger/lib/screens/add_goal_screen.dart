// lib/screens/add_goal_screen.dart

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/goal_model.dart';
import '../providers/goal_provider.dart';

class AddGoalScreen extends StatefulWidget {
  const AddGoalScreen({super.key});

  @override
  _AddGoalScreenState createState() => _AddGoalScreenState();
}

class _AddGoalScreenState extends State<AddGoalScreen> {
  final _titleController = TextEditingController();
  GoalCategory _selectedCategory = GoalCategory.fitness;

  void _submitData() {
    if (_titleController.text.isEmpty) {
      return;
    }
    Provider.of<GoalProvider>(context, listen: false)
       .addGoal(_titleController.text, _selectedCategory);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('새로운 목표 추가'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children:,
                  ),
                );
              }).toList(),
              onChanged: (value) {
                if (value!= null) {
                  setState(() {
                    _selectedCategory = value;
                  });
                }
              },
            ),
            const SizedBox(height = 30),
            ElevatedButton(
              onPressed = _submitData,
              child = const Text('목표 추가하기'),
            ),
          ],
        ),
      ),
    );
  }
}
