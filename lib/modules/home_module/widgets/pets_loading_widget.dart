import 'package:flutter/material.dart';
import 'package:petcure_user_app/widgets/loaders/grid_loading_widget.dart';

class PetsLoadingWidget extends StatelessWidget {
  final String? message;
  const PetsLoadingWidget({super.key, this.message});

  @override
  Widget build(BuildContext context) {
    return const PetsGridLoadingWidget(
      itemCount: 6,
      crossAxisCount: 2,
      useSliver: true,
    );
  }
}
