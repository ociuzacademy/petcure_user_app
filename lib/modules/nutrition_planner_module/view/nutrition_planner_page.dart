import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petcure_user_app/modules/nutrition_planner_module/bloc/nutrition_plan_bloc.dart';
import 'package:petcure_user_app/modules/nutrition_planner_module/classes/nutrition_planner_data.dart';
import 'package:petcure_user_app/modules/nutrition_planner_module/enums/input_type.dart';
import 'package:petcure_user_app/modules/nutrition_planner_module/enums/message_type.dart';
import 'package:petcure_user_app/modules/nutrition_planner_module/models/message.dart';
import 'package:petcure_user_app/modules/nutrition_planner_module/widgets/nutrition_message_bubble.dart';
import 'package:petcure_user_app/modules/nutrition_planner_module/widgets/nutrition_input_field.dart';

class NutritionPlannerPage extends StatefulWidget {
  const NutritionPlannerPage({super.key});

  @override
  State<NutritionPlannerPage> createState() => _NutritionPlannerPageState();

  static route() =>
      MaterialPageRoute(builder: (context) => const NutritionPlannerPage());
}

class _NutritionPlannerPageState extends State<NutritionPlannerPage> {
  final List<Message> _messages = [];
  final ScrollController _scrollController = ScrollController();
  String? _currentBreed;
  int? _currentAge;
  String? _currentHealth;
  InputType _currentInputType = InputType.breed;

  @override
  void initState() {
    super.initState();
    // Add welcome message
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _addBotMessage(
        "Hello! I'm your Pet Nutrition Assistant. Let me create a personalized nutrition plan for your pet.",
      );
      _askForBreed();
    });
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  void _addUserMessage(String text, {MessageType type = MessageType.text}) {
    setState(() {
      _messages.add(
        Message(
          text: text,
          isUser: true,
          timestamp: DateTime.now(),
          type: type,
        ),
      );
    });
    _scrollToBottom();
  }

  void _addBotMessage(String text, {MessageType type = MessageType.text}) {
    setState(() {
      _messages.add(
        Message(
          text: text,
          isUser: false,
          timestamp: DateTime.now(),
          type: type,
        ),
      );
    });
    _scrollToBottom();
  }

  void _askForBreed() {
    _addBotMessage(
      "First, what is your pet's breed?\n(e.g., Golden Retriever, Persian Cat, Beagle, etc.)",
      type: MessageType.breedInput,
    );
    _currentInputType = InputType.breed;
  }

  void _askForAge() {
    _addBotMessage(
      'Great! How old is your pet (in years)?',
      type: MessageType.ageInput,
    );
    _currentInputType = InputType.age;
  }

  void _askForHealth() {
    _addBotMessage(
      "Finally, what is your pet's current health condition?\n(e.g., Healthy, Overweight, Underweight, Allergies, Kidney Issues, etc.)",
      type: MessageType.healthInput,
    );
    _currentInputType = InputType.health;
  }

  void _handleBreedInput(String breed) {
    _currentBreed = breed;
    _addUserMessage(breed, type: MessageType.breedInput);
    _askForAge();
  }

  void _handleAgeInput(String ageText) {
    final age = int.tryParse(ageText);
    if (age == null || age <= 0) {
      _addBotMessage(
        'Please enter a valid age (positive number in years).',
        type: MessageType.ageInput,
      );
      return;
    }
    _currentAge = age;
    _addUserMessage('$age years', type: MessageType.ageInput);
    _askForHealth();
  }

  void _handleHealthInput(String health) {
    _currentHealth = health;
    _addUserMessage(health, type: MessageType.healthInput);
    _getRecommendation();
  }

  void _getRecommendation() {
    if (_currentBreed == null ||
        _currentAge == null ||
        _currentHealth == null) {
      return;
    }

    _addBotMessage('Generating personalized nutrition plan...');

    final nutritionData = NutritionPlannerData(
      breed: _currentBreed!,
      age: _currentAge!,
      health: _currentHealth!,
    );

    context.read<NutritionPlanBloc>().add(
      NutritionPlanEvent.gettingNutritionPlan(
        nutritionPlannerData: nutritionData,
      ),
    );
  }

  void _handleNewRecommendation(String recommendation) {
    _addBotMessage(recommendation, type: MessageType.recommendation);
    _currentInputType = InputType.none;
  }

  void _handleError(String message) {
    _addBotMessage(
      "I encountered an error: $message\nLet's try again. What is your pet's breed?",
      type: MessageType.breedInput,
    );
    _currentInputType = InputType.breed;
  }

  void _resetConversation() {
    setState(() {
      _messages.clear();
      _currentBreed = null;
      _currentAge = null;
      _currentHealth = null;
      _currentInputType = InputType.breed;
    });

    _addBotMessage(
      "Hello! I'm your Pet Nutrition Assistant. Let me create a personalized nutrition plan for your pet.",
    );
    _askForBreed();
  }

  Widget _buildInputArea() {
    return BlocBuilder<NutritionPlanBloc, NutritionPlanState>(
      builder: (context, state) {
        final isLoading = state is NutritionPlanLoading;

        return NutritionInputField(
          currentInputType: _currentInputType,
          isLoading: isLoading,
          onBreedSubmit: _handleBreedInput,
          onAgeSubmit: _handleAgeInput,
          onHealthSubmit: _handleHealthInput, // Fixed: was _handleHealthSubmit
          onReset: _resetConversation,
        );
      },
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              color: Colors.orange[50],
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.restaurant_menu,
              size: 50,
              color: Colors.orange,
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'Pet Nutrition Planner',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.deepOrange,
            ),
          ),
          const SizedBox(height: 10),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: Text(
              'Get personalized nutrition recommendations for your pet based on breed, age, and health condition.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
          ),
          const SizedBox(height: 30),
          ElevatedButton.icon(
            onPressed: () {
              _resetConversation();
            },
            icon: const Icon(Icons.restaurant_menu),
            label: const Text('Start Nutrition Planning'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.deepOrange,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<NutritionPlanBloc, NutritionPlanState>(
      listener: (context, state) {
        state.whenOrNull(
          success: (response) =>
              _handleNewRecommendation(response.recommendation),
          error: (message) => _handleError(message),
        );
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Nutrition Planner'),
          centerTitle: true,
          actions: [
            IconButton(
              icon: const Icon(Icons.refresh),
              onPressed: _resetConversation,
              tooltip: 'Start Over',
            ),
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: _messages.isEmpty
                  ? _buildEmptyState()
                  : ListView.builder(
                      controller: _scrollController,
                      padding: const EdgeInsets.only(bottom: 16),
                      itemCount: _messages.length,
                      itemBuilder: (context, index) {
                        return NutritionMessageBubble(
                          message: _messages[index],
                          showAvatar: true,
                        );
                      },
                    ),
            ),
            _buildInputArea(),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
