import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petcure_user_app/core/exports/bloc_exports.dart';
import 'package:petcure_user_app/modules/prescription_details_module/helper/prescription_details_helper.dart';
import 'package:petcure_user_app/modules/prescription_details_module/widgets/prescription_details_content.dart';
import 'package:petcure_user_app/widgets/custom_error_widget.dart';
import 'package:petcure_user_app/widgets/loaders/custom_loading_widget.dart';
import 'package:petcure_user_app/widgets/loaders/overlay_loader.dart';
import 'package:petcure_user_app/widgets/snackbars/custom_snack_bar.dart';

class PrescriptionDetailsPage extends StatefulWidget {
  final int prescriptionId;
  const PrescriptionDetailsPage({super.key, required this.prescriptionId});

  @override
  State<PrescriptionDetailsPage> createState() =>
      _PrescriptionDetailsPageState();

  static route({required int prescriptionId}) => MaterialPageRoute(
    builder: (context) =>
        PrescriptionDetailsPage(prescriptionId: prescriptionId),
  );
}

class _PrescriptionDetailsPageState extends State<PrescriptionDetailsPage> {
  late PrescriptionDetailsHelper _helper;

  @override
  void initState() {
    super.initState();
    _helper = PrescriptionDetailsHelper(
      context: context,
      prescriptionId: widget.prescriptionId,
    );
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _helper.getPrescriptionDetails();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Prescription Details'),
        actions: [
          IconButton(
            onPressed: _helper.sharePrescription,
            icon: const Icon(Icons.download),
            tooltip: 'Download',
          ),
        ],
      ),
      body: BlocListener<SharePrescriptionBloc, SharePrescriptionState>(
        listener: (context, state) {
          switch (state) {
            case SharePrescriptionLoading():
              OverlayLoader.show(context, message: 'Downloading...');
              break;

            case SharePrescriptionSuccess():
              OverlayLoader.hide();
              CustomSnackBar.showSuccess(
                context,
                message: 'Prescription downloaded successfully',
              );
              break;

            case SharePrescriptionFailure(error: final error):
              OverlayLoader.hide();
              CustomSnackBar.showError(context, message: error);
              break;
            default:
              OverlayLoader.hide();
              break;
          }
        },
        child: BlocBuilder<PrescriptionDetailsCubit, PrescriptionDetailsState>(
          builder: (context, state) {
            switch (state) {
              case PrescriptionDetailsInitial():
                return const SizedBox.shrink();

              case PrescriptionDetailsLoading():
                return const CustomLoadingWidget(
                  message: 'Loading prescription details...',
                );

              case PrescriptionDetailsLoaded(prescriptions: final data):
                return PrescriptionDetailsContent(
                  prescription: data.prescription,
                  onSharePrescription: _helper.sharePrescription,
                );

              case PrescriptionDetailsError(error: final error):
                return CustomErrorWidget(
                  onRetry: _helper.getPrescriptionDetails,
                  errorMessage: error,
                );
            }
          },
        ),
      ),
    );
  }
}
