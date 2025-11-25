import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:petcure_user_app/modules/order_details_module/models/cancel_order_response_model.dart';
import 'package:petcure_user_app/modules/order_details_module/services/order_details_services.dart';

part 'cancel_order_bloc.freezed.dart';
part 'cancel_order_event.dart';
part 'cancel_order_state.dart';

class CancelOrderBloc extends Bloc<CancelOrderEvent, CancelOrderState> {
  CancelOrderBloc() : super(const CancelOrderInitial()) {
    on<_CancellingOrder>(_onCancellingOrder);
  }

  Future<void> _onCancellingOrder(
    _CancellingOrder event,
    Emitter<CancelOrderState> emit,
  ) async {
    emit(const CancelOrderState.cancelOrderLoading());

    try {
      final CancelOrderResponseModel response =
          await OrderDetailsServices.cancelOrder(orderId: event.orderId);

      emit(CancelOrderState.cancelOrderSuccess(response));
    } catch (e) {
      emit(CancelOrderState.cancelOrderError(e.toString()));
    }
  }
}
