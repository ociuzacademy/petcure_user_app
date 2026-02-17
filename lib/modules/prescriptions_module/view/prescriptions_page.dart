import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petcure_user_app/core/exports/bloc_exports.dart';
import 'package:petcure_user_app/modules/prescriptions_module/helper/prescriptions_helper.dart';
import 'package:petcure_user_app/modules/prescriptions_module/widgets/prescription_card.dart';
import 'package:petcure_user_app/modules/prescriptions_module/widgets/prescriptions_empty_widget.dart';
import 'package:petcure_user_app/widgets/custom_error_widget.dart';
import 'package:petcure_user_app/widgets/loaders/list_item_loading_widget.dart';

class PrescriptionsPage extends StatefulWidget {
  const PrescriptionsPage({super.key});

  @override
  State<PrescriptionsPage> createState() => _PrescriptionsPageState();

  static MaterialPageRoute route() =>
      MaterialPageRoute(builder: (context) => const PrescriptionsPage());
}

class _PrescriptionsPageState extends State<PrescriptionsPage> {
  late PrescriptionsHelper _helper;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _helper = PrescriptionsHelper(context: context);
      _helper.getPrescriptions();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Prescriptions'), elevation: 0),
      body: BlocBuilder<PrescriptionsCubit, PrescriptionsState>(
        builder: (context, state) {
          switch (state) {
            case PrescriptionsInitial():
              return const ListItemLoadingWidget(itemCount: 5);

            case PrescriptionsLoading():
              return const Center(child: CircularProgressIndicator());

            case PrescriptionsLoaded(prescriptions: final prescriptionsData):
              if (prescriptionsData.prescriptions.isEmpty) {
                return const PrescriptionsEmptyWidget();
              }

              return RefreshIndicator(
                onRefresh: () async {
                  _helper.getPrescriptions();
                },
                child: ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: prescriptionsData.count,
                  itemBuilder: (context, index) {
                    return PrescriptionCard(
                      prescription: prescriptionsData.prescriptions[index],
                    );
                  },
                ),
              );

            case PrescriptionsError(error: final error):
              return CustomErrorWidget(
                onRetry: _helper.getPrescriptions,
                errorMessage: error,
              );
          }
        },
      ),
    );
  }
}
