// lib/providers/goal_provider.dart

import 'package:flutter/material.dart';
import 'dart:math';
import '../models/goal_model.dart';

class GoalProvider with ChangeNotifier {
  final List<Goal> _goals = [
    Goal(id: 'g1', title: '매일 30분 달리기', category: GoalCategory.fitness, progress: 0.75),
    Goal(id: 'g2', title: 'Flutter 심화 과정 수강', category: GoalCategory.learning, progress: 0.4),
    Goal(id: 'g3', title: '매일 10분 명상하기', category: GoalCategory.mentalHealth, progress: 0.9),
  ];

  List<Goal> get goals => [..._goals];

  void addGoal(String title, GoalCategory category) {
    final newGoal = Goal(
      id: DateTime.now().toString(),
      title: title,
      category: category,
    );
    _goals.add(newGoal);
    notifyListeners(); // UI에 변경 사항 알림
  }

  void updateProgress(String id, double newProgress) {
    final goalIndex = _goals.indexWhere((goal) => goal.id == id);
    if (goalIndex >= 0) {
      _goals[goalIndex].progress = newProgress.clamp(0.0, 1.0);
      notifyListeners();
    }
  }

  // AI 추천 기능 시뮬레이션
  // 실제 앱에서는 사용자의 데이터를 기반으로 AI 모델이 추천 목록을 생성합니다.
  List<String> getAIRecommendations() {
    if (_goals.isEmpty) {
      return ["새로운 목표를 설정하고 성장을 시작해보세요!"];
    }

    final recommendations = {
      GoalCategory.fitness: "규칙적인 스트레칭은 운동 효과를 높여줍니다.",
      GoalCategory.learning: "학습한 내용을 블로그에 정리해보는 건 어떨까요?",
      GoalCategory.mentalHealth: "감사 일기를 작성하면 긍정적인 마음을 유지하는 데 도움이 됩니다.",
      GoalCategory.career: "관심 분야의 전문가와 커피챗을 신청해보세요.",
    };
    
    // 사용자가 설정한 목표 카테고리를 기반으로 추천 메시지를 생성합니다.
    List<String> personalizedRecommendations =;
    final userCategories = _goals.map((g) => g.category).toSet();

    for (var category in userCategories) {
      if (recommendations.containsKey(category)) {
        personalizedRecommendations.add(recommendations[category]!);
      }
    }
    
    if (personalizedRecommendations.isEmpty) {
       personalizedRecommendations.add("새로운 분야에 도전해보세요! 당신의 잠재력은 무한합니다.");
    }

    return personalizedRecommendations;
  }
}
