import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petcure_user_app/modules/nutrition_planner_module/bloc/nutrition_plan_bloc.dart';
import 'package:petcure_user_app/modules/nutrition_planner_module/classes/nutrition_planner_data.dart';
import 'package:petcure_user_app/modules/nutrition_planner_module/enums/input_type.dart';
import 'package:petcure_user_app/modules/nutrition_planner_module/enums/message_type.dart';
import 'package:petcure_user_app/modules/nutrition_planner_module/widgets/nutrition_message_bubble.dart';
import 'package:petcure_user_app/modules/nutrition_planner_module/widgets/nutrition_input_field.dart';
import 'package:petcure_user_app/modules/nutrition_planner_module/provider/nutrition_planner_provider.dart';
import 'package:provider/provider.dart';

class NutritionPlannerPage extends StatefulWidget {
  const NutritionPlannerPage({super.key});

  @override
  State<NutritionPlannerPage> createState() => _NutritionPlannerPageState();

  static route() => MaterialPageRoute(
    builder: (context) => ChangeNotifierProvider(
      create: (_) => NutritionPlannerProvider(),
      child: const NutritionPlannerPage(),
    ),
  );
}

class _NutritionPlannerPageState extends State<NutritionPlannerPage> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    // Add welcome message
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final provider = context.read<NutritionPlannerProvider>();
      provider.addBotMessage(
        "Hello! I'm your Pet Nutrition Assistant. Let me create a personalized nutrition plan for your pet.",
      );
      _askForBreed(provider);
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
    context.read<NutritionPlannerProvider>().addUserMessage(text, type: type);
    _scrollToBottom();
  }

  void _addBotMessage(String text, {MessageType type = MessageType.text}) {
    context.read<NutritionPlannerProvider>().addBotMessage(text, type: type);
    _scrollToBottom();
  }

  void _askForBreed(NutritionPlannerProvider provider) {
    provider.addBotMessage(
      "First, what is your pet's breed?\n(e.g., Golden Retriever, Persian Cat, Beagle, etc.)",
      type: MessageType.breedInput,
    );
    provider.setInputType(InputType.breed);
  }

  void _askForAge(NutritionPlannerProvider provider) {
    provider.addBotMessage(
      'Great! How old is your pet (in years)?',
      type: MessageType.ageInput,
    );
    provider.setInputType(InputType.age);
  }

  void _askForHealth(NutritionPlannerProvider provider) {
    provider.addBotMessage(
      "Finally, what is your pet's current health condition?\n(e.g., Healthy, Overweight, Underweight, Allergies, Kidney Issues, etc.)",
      type: MessageType.healthInput,
    );
    provider.setInputType(InputType.health);
  }

  void _handleBreedInput(String breed) {
    final provider = context.read<NutritionPlannerProvider>();
    provider.setBreed(breed);
    _addUserMessage(breed, type: MessageType.breedInput);
    _askForAge(provider);
  }

  void _handleAgeInput(String ageText) {
    final provider = context.read<NutritionPlannerProvider>();
    final age = int.tryParse(ageText);
    if (age == null || age <= 0) {
      provider.addBotMessage(
        'Please enter a valid age (positive number in years).',
        type: MessageType.ageInput,
      );
      _scrollToBottom();
      return;
    }
    provider.setAge(age);
    _addUserMessage('$age years', type: MessageType.ageInput);
    _askForHealth(provider);
  }

  void _handleHealthInput(String health) {
    final provider = context.read<NutritionPlannerProvider>();
    provider.setHealth(health);
    _addUserMessage(health, type: MessageType.healthInput);
    _getRecommendation(provider);
  }

  void _getRecommendation(NutritionPlannerProvider provider) {
    if (provider.currentBreed == null ||
        provider.currentAge == null ||
        provider.currentHealth == null) {
      return;
    }

    _addBotMessage('Generating personalized nutrition plan...');

    final nutritionData = NutritionPlannerData(
      breed: provider.currentBreed!,
      age: provider.currentAge!,
      health: provider.currentHealth!,
    );

    context.read<NutritionPlanBloc>().add(
      NutritionPlanEvent.gettingNutritionPlan(
        nutritionPlannerData: nutritionData,
      ),
    );
  }

  void _handleNewRecommendation(String recommendation) {
    _addBotMessage(recommendation, type: MessageType.recommendation);
    context.read<NutritionPlannerProvider>().setInputType(InputType.none);
  }

  void _handleError(String message) {
    final provider = context.read<NutritionPlannerProvider>();
    provider.addBotMessage(
      "I encountered an error: $message\nLet's try again. What is your pet's breed?",
      type: MessageType.breedInput,
    );
    provider.setInputType(InputType.breed);
    _scrollToBottom();
  }

  void _resetConversation() {
    final provider = context.read<NutritionPlannerProvider>();
    provider.resetConversation();

    provider.addBotMessage(
      "Hello! I'm your Pet Nutrition Assistant. Let me create a personalized nutrition plan for your pet.",
    );
    _askForBreed(provider);
    _scrollToBottom();
  }

  Widget _buildInputArea() {
    return BlocBuilder<NutritionPlanBloc, NutritionPlanState>(
      builder: (context, state) {
        final isLoading = state is NutritionPlanLoading;

        return Consumer<NutritionPlannerProvider>(
          builder: (context, provider, _) {
            return NutritionInputField(
              currentInputType: provider.currentInputType,
              isLoading: isLoading,
              onBreedSubmit: _handleBreedInput,
              onAgeSubmit: _handleAgeInput,
              onHealthSubmit: _handleHealthInput,
              onReset: _resetConversation,
            );
          },
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
        switch (state) {
          case NutritionPlanSuccess(response: final response):
            _handleNewRecommendation(response.recommendation);
          case NutritionPlanError(message: final message):
            _handleError(message);
          default:
            break;
        }
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
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: Consumer<NutritionPlannerProvider>(
                  builder: (context, provider, _) {
                    if (provider.messages.isEmpty) {
                      return _buildEmptyState();
                    }
                    return ListView.builder(
                      controller: _scrollController,
                      padding: const EdgeInsets.only(bottom: 16),
                      itemCount: provider.messages.length,
                      itemBuilder: (context, index) {
                        return NutritionMessageBubble(
                          message: provider.messages[index],
                          showAvatar: true,
                        );
                      },
                    );
                  },
                ),
              ),
              _buildInputArea(),
            ],
          ),
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
