import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:petcure_user_app/core/localstorage/auth_storage_functions.dart';
import 'package:petcure_user_app/modules/payment_module/classes/card_data.dart';
import 'package:petcure_user_app/modules/payment_module/classes/u_p_i_data.dart';
import 'package:petcure_user_app/modules/payment_module/models/card_payment_response_model.dart';
import 'package:petcure_user_app/modules/payment_module/models/upi_payment_response_model.dart';
import 'package:petcure_user_app/modules/payment_module/services/payment_services.dart';

part 'payment_event.dart';
part 'payment_state.dart';
part 'payment_bloc.freezed.dart';

class PaymentBloc extends Bloc<PaymentEvent, PaymentState> {
  PaymentBloc() : super(const PaymentInitial()) {
    on<_SubmittingUPIPayment>(_onSubmittingUPIPayment);
    on<_SubmittingCardPayment>(_onSubmittingCardPayment);
  }

  Future<void> _onSubmittingUPIPayment(
    _SubmittingUPIPayment event,
    Emitter<PaymentState> emit,
  ) async {
    emit(const PaymentState.paymentLoading());
    try {
      final String userId = await AuthStorageFunctions.getUserId();

      final UpiPaymentResponseModel response =
          await PaymentServices.submitUpiPayment(
            userId: userId,
            upiData: event.upiData,
          );

      emit(PaymentState.upiPaymentSuccess(response));
    } catch (e) {
      emit(PaymentState.paymentError(e.toString()));
    }
  }

  Future<void> _onSubmittingCardPayment(
    _SubmittingCardPayment event,
    Emitter<PaymentState> emit,
  ) async {
    emit(const PaymentState.paymentLoading());
    try {
      final String userId = await AuthStorageFunctions.getUserId();

      final CardPaymentResponseModel response =
          await PaymentServices.submitCardPayment(
            userId: userId,
            cardData: event.cardData,
          );

      emit(PaymentState.cardPaymentSuccess(response));
    } catch (e) {
      emit(PaymentState.paymentError(e.toString()));
    }
  }
}
