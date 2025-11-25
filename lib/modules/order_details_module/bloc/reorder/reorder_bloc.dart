import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:petcure_user_app/modules/order_details_module/models/reorder_response_model.dart';
import 'package:petcure_user_app/modules/order_details_module/services/order_details_services.dart';

part 'reorder_bloc.freezed.dart';
part 'reorder_event.dart';
part 'reorder_state.dart';

class ReorderBloc extends Bloc<ReorderEvent, ReorderState> {
  ReorderBloc() : super(const ReorderInitial()) {
    on<_Reordering>(_onReordering);
  }

  Future<void> _onReordering(
    _Reordering event,
    Emitter<ReorderState> emit,
  ) async {
    emit(const ReorderState.reorderLoading());
    try {
      final ReorderResponseModel response = await OrderDetailsServices.reorder(
        orderId: event.orderId,
      );

      emit(ReorderState.reorderSuccess(response));
    } catch (e) {
      emit(ReorderState.reorderError(e.toString()));
    }
  }
}
