part of 'payment_bloc.dart';

@freezed
class PaymentEvent with _$PaymentEvent {
  const factory PaymentEvent.started() = _Started;
  const factory PaymentEvent.submittingUPIPayment(UPIData upiData) =
      _SubmittingUPIPayment;
  const factory PaymentEvent.submittingCardPayment(CardData cardData) =
      _SubmittingCardPayment;
}
