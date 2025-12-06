import 'package:flutter/material.dart';
import 'package:petcure_user_app/modules/nutrition_planner_module/enums/input_type.dart';

class NutritionInputField extends StatefulWidget {
  final InputType currentInputType;
  final bool isLoading;
  final Function(String) onBreedSubmit;
  final Function(String) onAgeSubmit;
  final Function(String) onHealthSubmit;
  final VoidCallback onReset;

  const NutritionInputField({
    super.key,
    required this.currentInputType,
    required this.isLoading,
    required this.onBreedSubmit,
    required this.onAgeSubmit,
    required this.onHealthSubmit,
    required this.onReset,
  });

  @override
  State<NutritionInputField> createState() => _NutritionInputFieldState();
}

class _NutritionInputFieldState extends State<NutritionInputField> {
  final TextEditingController _controller = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  String? _validator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter a value';
    }

    if (widget.currentInputType == InputType.age) {
      final age = int.tryParse(value);
      if (age == null || age <= 0) {
        return 'Please enter a valid age (positive number)';
      }
    }

    return null;
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      final text = _controller.text.trim();
      _controller.clear();

      switch (widget.currentInputType) {
        case InputType.breed:
          widget.onBreedSubmit(text);
          break;
        case InputType.age:
          widget.onAgeSubmit(text);
          break;
        case InputType.health:
          widget.onHealthSubmit(text);
          break;
        case InputType.none:
          break;
      }
    }
  }

  String _getHintText() {
    switch (widget.currentInputType) {
      case InputType.breed:
        return 'Enter pet breed (e.g., Labrador, Persian Cat)';
      case InputType.age:
        return 'Enter age in years (e.g., 3)';
      case InputType.health:
        return 'Enter health condition';
      case InputType.none:
        return 'Chat disabled - viewing results';
    }
  }

  String _getLabelText() {
    switch (widget.currentInputType) {
      case InputType.breed:
        return 'Breed';
      case InputType.age:
        return 'Age (years)';
      case InputType.health:
        return 'Health Condition';
      case InputType.none:
        return 'View Only';
    }
  }

  @override
  Widget build(BuildContext context) {
    final isInputEnabled =
        widget.currentInputType != InputType.none && !widget.isLoading;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        border: Border(top: BorderSide(color: Colors.grey[300]!)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.currentInputType != InputType.none)
            Padding(
              padding: const EdgeInsets.only(bottom: 8, left: 4),
              child: Text(
                _getLabelText(),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.deepOrange,
                  fontSize: 14,
                ),
              ),
            ),
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Form(
                    key: _formKey,
                    child: Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: _controller,
                            enabled: isInputEnabled,
                            decoration: InputDecoration(
                              hintText: _getHintText(),
                              border: InputBorder.none,
                              hintStyle: const TextStyle(color: Colors.grey),
                              suffixIcon:
                                  widget.currentInputType == InputType.none
                                  ? IconButton(
                                      icon: const Icon(
                                        Icons.refresh,
                                        color: Colors.deepOrange,
                                      ),
                                      onPressed: widget.onReset,
                                      tooltip: 'Start Over',
                                    )
                                  : null,
                            ),
                            validator: _validator,
                            onFieldSubmitted: (_) => _submit(),
                            keyboardType:
                                widget.currentInputType == InputType.age
                                ? TextInputType.number
                                : TextInputType.text,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              if (isInputEnabled)
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.deepOrange,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    icon: widget.isLoading
                        ? const SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              valueColor: AlwaysStoppedAnimation(Colors.white),
                            ),
                          )
                        : const Icon(Icons.arrow_forward, color: Colors.white),
                    onPressed: _submit,
                  ),
                ),
            ],
          ),
          if (widget.currentInputType == InputType.none)
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Center(
                child: TextButton.icon(
                  onPressed: widget.onReset,
                  icon: const Icon(Icons.refresh),
                  label: const Text('Plan for Another Pet'),
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.deepOrange,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
