// lib/models/goal_model.dart

import 'package:flutter/material.dart';

enum GoalCategory {
  fitness('피트니스', Icons.fitness_center),
  learning('학습', Icons.school),
  mentalHealth('정신 건강', Icons.self_improvement),
  career('커리어', Icons.work);

  const GoalCategory(this.displayName, this.icon);
  final String displayName;
  final IconData icon;
}

class Goal {
  final String id;
  final String title;
  final GoalCategory category;
  double progress; // 0.0 to 1.0

  Goal({
    required this.id,
    required this.title,
    required this.category,
    this.progress = 0.0,
  });
}
