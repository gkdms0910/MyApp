// lib/screens/home_screen.dart

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/goal_provider.dart';
import '../widgets/goal_card.dart';
import '../widgets/recommendation_card.dart';
import 'add_goal_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('성장 로그'),
        actions:,
      ),
      body: Consumer<GoalProvider>(
        builder: (ctx, goalProvider, child) {
          final goals = goalProvider.goals;
          final recommendations = goalProvider.getAIRecommendations();
          return ListView(
            children:,
          );
        },
      ),
    );
  }
}
