// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PaymentEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaymentEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PaymentEvent()';
}


}

/// @nodoc
class $PaymentEventCopyWith<$Res>  {
$PaymentEventCopyWith(PaymentEvent _, $Res Function(PaymentEvent) __);
}


/// Adds pattern-matching-related methods to [PaymentEvent].
extension PaymentEventPatterns on PaymentEvent {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Started value)?  started,TResult Function( _SubmittingUPIPayment value)?  submittingUPIPayment,TResult Function( _SubmittingCardPayment value)?  submittingCardPayment,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _SubmittingUPIPayment() when submittingUPIPayment != null:
return submittingUPIPayment(_that);case _SubmittingCardPayment() when submittingCardPayment != null:
return submittingCardPayment(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Started value)  started,required TResult Function( _SubmittingUPIPayment value)  submittingUPIPayment,required TResult Function( _SubmittingCardPayment value)  submittingCardPayment,}){
final _that = this;
switch (_that) {
case _Started():
return started(_that);case _SubmittingUPIPayment():
return submittingUPIPayment(_that);case _SubmittingCardPayment():
return submittingCardPayment(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Started value)?  started,TResult? Function( _SubmittingUPIPayment value)?  submittingUPIPayment,TResult? Function( _SubmittingCardPayment value)?  submittingCardPayment,}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _SubmittingUPIPayment() when submittingUPIPayment != null:
return submittingUPIPayment(_that);case _SubmittingCardPayment() when submittingCardPayment != null:
return submittingCardPayment(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  started,TResult Function( UPIData upiData)?  submittingUPIPayment,TResult Function( CardData cardData)?  submittingCardPayment,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _SubmittingUPIPayment() when submittingUPIPayment != null:
return submittingUPIPayment(_that.upiData);case _SubmittingCardPayment() when submittingCardPayment != null:
return submittingCardPayment(_that.cardData);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  started,required TResult Function( UPIData upiData)  submittingUPIPayment,required TResult Function( CardData cardData)  submittingCardPayment,}) {final _that = this;
switch (_that) {
case _Started():
return started();case _SubmittingUPIPayment():
return submittingUPIPayment(_that.upiData);case _SubmittingCardPayment():
return submittingCardPayment(_that.cardData);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  started,TResult? Function( UPIData upiData)?  submittingUPIPayment,TResult? Function( CardData cardData)?  submittingCardPayment,}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _SubmittingUPIPayment() when submittingUPIPayment != null:
return submittingUPIPayment(_that.upiData);case _SubmittingCardPayment() when submittingCardPayment != null:
return submittingCardPayment(_that.cardData);case _:
  return null;

}
}

}

/// @nodoc


class _Started implements PaymentEvent {
  const _Started();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Started);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PaymentEvent.started()';
}


}




/// @nodoc


class _SubmittingUPIPayment implements PaymentEvent {
  const _SubmittingUPIPayment(this.upiData);
  

 final  UPIData upiData;

/// Create a copy of PaymentEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SubmittingUPIPaymentCopyWith<_SubmittingUPIPayment> get copyWith => __$SubmittingUPIPaymentCopyWithImpl<_SubmittingUPIPayment>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SubmittingUPIPayment&&(identical(other.upiData, upiData) || other.upiData == upiData));
}


@override
int get hashCode => Object.hash(runtimeType,upiData);

@override
String toString() {
  return 'PaymentEvent.submittingUPIPayment(upiData: $upiData)';
}


}

/// @nodoc
abstract mixin class _$SubmittingUPIPaymentCopyWith<$Res> implements $PaymentEventCopyWith<$Res> {
  factory _$SubmittingUPIPaymentCopyWith(_SubmittingUPIPayment value, $Res Function(_SubmittingUPIPayment) _then) = __$SubmittingUPIPaymentCopyWithImpl;
@useResult
$Res call({
 UPIData upiData
});




}
/// @nodoc
class __$SubmittingUPIPaymentCopyWithImpl<$Res>
    implements _$SubmittingUPIPaymentCopyWith<$Res> {
  __$SubmittingUPIPaymentCopyWithImpl(this._self, this._then);

  final _SubmittingUPIPayment _self;
  final $Res Function(_SubmittingUPIPayment) _then;

/// Create a copy of PaymentEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? upiData = null,}) {
  return _then(_SubmittingUPIPayment(
null == upiData ? _self.upiData : upiData // ignore: cast_nullable_to_non_nullable
as UPIData,
  ));
}


}

/// @nodoc


class _SubmittingCardPayment implements PaymentEvent {
  const _SubmittingCardPayment(this.cardData);
  

 final  CardData cardData;

/// Create a copy of PaymentEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SubmittingCardPaymentCopyWith<_SubmittingCardPayment> get copyWith => __$SubmittingCardPaymentCopyWithImpl<_SubmittingCardPayment>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SubmittingCardPayment&&(identical(other.cardData, cardData) || other.cardData == cardData));
}


@override
int get hashCode => Object.hash(runtimeType,cardData);

@override
String toString() {
  return 'PaymentEvent.submittingCardPayment(cardData: $cardData)';
}


}

/// @nodoc
abstract mixin class _$SubmittingCardPaymentCopyWith<$Res> implements $PaymentEventCopyWith<$Res> {
  factory _$SubmittingCardPaymentCopyWith(_SubmittingCardPayment value, $Res Function(_SubmittingCardPayment) _then) = __$SubmittingCardPaymentCopyWithImpl;
@useResult
$Res call({
 CardData cardData
});




}
/// @nodoc
class __$SubmittingCardPaymentCopyWithImpl<$Res>
    implements _$SubmittingCardPaymentCopyWith<$Res> {
  __$SubmittingCardPaymentCopyWithImpl(this._self, this._then);

  final _SubmittingCardPayment _self;
  final $Res Function(_SubmittingCardPayment) _then;

/// Create a copy of PaymentEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? cardData = null,}) {
  return _then(_SubmittingCardPayment(
null == cardData ? _self.cardData : cardData // ignore: cast_nullable_to_non_nullable
as CardData,
  ));
}


}

/// @nodoc
mixin _$PaymentState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaymentState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PaymentState()';
}


}

/// @nodoc
class $PaymentStateCopyWith<$Res>  {
$PaymentStateCopyWith(PaymentState _, $Res Function(PaymentState) __);
}


/// Adds pattern-matching-related methods to [PaymentState].
extension PaymentStatePatterns on PaymentState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( PaymentInitial value)?  initial,TResult Function( PaymentLoading value)?  paymentLoading,TResult Function( PaymentError value)?  paymentError,TResult Function( UpiPaymentSuccess value)?  upiPaymentSuccess,TResult Function( CardPaymentSuccess value)?  cardPaymentSuccess,required TResult orElse(),}){
final _that = this;
switch (_that) {
case PaymentInitial() when initial != null:
return initial(_that);case PaymentLoading() when paymentLoading != null:
return paymentLoading(_that);case PaymentError() when paymentError != null:
return paymentError(_that);case UpiPaymentSuccess() when upiPaymentSuccess != null:
return upiPaymentSuccess(_that);case CardPaymentSuccess() when cardPaymentSuccess != null:
return cardPaymentSuccess(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( PaymentInitial value)  initial,required TResult Function( PaymentLoading value)  paymentLoading,required TResult Function( PaymentError value)  paymentError,required TResult Function( UpiPaymentSuccess value)  upiPaymentSuccess,required TResult Function( CardPaymentSuccess value)  cardPaymentSuccess,}){
final _that = this;
switch (_that) {
case PaymentInitial():
return initial(_that);case PaymentLoading():
return paymentLoading(_that);case PaymentError():
return paymentError(_that);case UpiPaymentSuccess():
return upiPaymentSuccess(_that);case CardPaymentSuccess():
return cardPaymentSuccess(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( PaymentInitial value)?  initial,TResult? Function( PaymentLoading value)?  paymentLoading,TResult? Function( PaymentError value)?  paymentError,TResult? Function( UpiPaymentSuccess value)?  upiPaymentSuccess,TResult? Function( CardPaymentSuccess value)?  cardPaymentSuccess,}){
final _that = this;
switch (_that) {
case PaymentInitial() when initial != null:
return initial(_that);case PaymentLoading() when paymentLoading != null:
return paymentLoading(_that);case PaymentError() when paymentError != null:
return paymentError(_that);case UpiPaymentSuccess() when upiPaymentSuccess != null:
return upiPaymentSuccess(_that);case CardPaymentSuccess() when cardPaymentSuccess != null:
return cardPaymentSuccess(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  paymentLoading,TResult Function( String errorMessage)?  paymentError,TResult Function( UpiPaymentResponseModel response)?  upiPaymentSuccess,TResult Function( CardPaymentResponseModel response)?  cardPaymentSuccess,required TResult orElse(),}) {final _that = this;
switch (_that) {
case PaymentInitial() when initial != null:
return initial();case PaymentLoading() when paymentLoading != null:
return paymentLoading();case PaymentError() when paymentError != null:
return paymentError(_that.errorMessage);case UpiPaymentSuccess() when upiPaymentSuccess != null:
return upiPaymentSuccess(_that.response);case CardPaymentSuccess() when cardPaymentSuccess != null:
return cardPaymentSuccess(_that.response);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  paymentLoading,required TResult Function( String errorMessage)  paymentError,required TResult Function( UpiPaymentResponseModel response)  upiPaymentSuccess,required TResult Function( CardPaymentResponseModel response)  cardPaymentSuccess,}) {final _that = this;
switch (_that) {
case PaymentInitial():
return initial();case PaymentLoading():
return paymentLoading();case PaymentError():
return paymentError(_that.errorMessage);case UpiPaymentSuccess():
return upiPaymentSuccess(_that.response);case CardPaymentSuccess():
return cardPaymentSuccess(_that.response);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  paymentLoading,TResult? Function( String errorMessage)?  paymentError,TResult? Function( UpiPaymentResponseModel response)?  upiPaymentSuccess,TResult? Function( CardPaymentResponseModel response)?  cardPaymentSuccess,}) {final _that = this;
switch (_that) {
case PaymentInitial() when initial != null:
return initial();case PaymentLoading() when paymentLoading != null:
return paymentLoading();case PaymentError() when paymentError != null:
return paymentError(_that.errorMessage);case UpiPaymentSuccess() when upiPaymentSuccess != null:
return upiPaymentSuccess(_that.response);case CardPaymentSuccess() when cardPaymentSuccess != null:
return cardPaymentSuccess(_that.response);case _:
  return null;

}
}

}

/// @nodoc


class PaymentInitial implements PaymentState {
  const PaymentInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaymentInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PaymentState.initial()';
}


}




/// @nodoc


class PaymentLoading implements PaymentState {
  const PaymentLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaymentLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PaymentState.paymentLoading()';
}


}




/// @nodoc


class PaymentError implements PaymentState {
  const PaymentError(this.errorMessage);
  

 final  String errorMessage;

/// Create a copy of PaymentState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaymentErrorCopyWith<PaymentError> get copyWith => _$PaymentErrorCopyWithImpl<PaymentError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaymentError&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,errorMessage);

@override
String toString() {
  return 'PaymentState.paymentError(errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $PaymentErrorCopyWith<$Res> implements $PaymentStateCopyWith<$Res> {
  factory $PaymentErrorCopyWith(PaymentError value, $Res Function(PaymentError) _then) = _$PaymentErrorCopyWithImpl;
@useResult
$Res call({
 String errorMessage
});




}
/// @nodoc
class _$PaymentErrorCopyWithImpl<$Res>
    implements $PaymentErrorCopyWith<$Res> {
  _$PaymentErrorCopyWithImpl(this._self, this._then);

  final PaymentError _self;
  final $Res Function(PaymentError) _then;

/// Create a copy of PaymentState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? errorMessage = null,}) {
  return _then(PaymentError(
null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class UpiPaymentSuccess implements PaymentState {
  const UpiPaymentSuccess(this.response);
  

 final  UpiPaymentResponseModel response;

/// Create a copy of PaymentState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpiPaymentSuccessCopyWith<UpiPaymentSuccess> get copyWith => _$UpiPaymentSuccessCopyWithImpl<UpiPaymentSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpiPaymentSuccess&&(identical(other.response, response) || other.response == response));
}


@override
int get hashCode => Object.hash(runtimeType,response);

@override
String toString() {
  return 'PaymentState.upiPaymentSuccess(response: $response)';
}


}

/// @nodoc
abstract mixin class $UpiPaymentSuccessCopyWith<$Res> implements $PaymentStateCopyWith<$Res> {
  factory $UpiPaymentSuccessCopyWith(UpiPaymentSuccess value, $Res Function(UpiPaymentSuccess) _then) = _$UpiPaymentSuccessCopyWithImpl;
@useResult
$Res call({
 UpiPaymentResponseModel response
});




}
/// @nodoc
class _$UpiPaymentSuccessCopyWithImpl<$Res>
    implements $UpiPaymentSuccessCopyWith<$Res> {
  _$UpiPaymentSuccessCopyWithImpl(this._self, this._then);

  final UpiPaymentSuccess _self;
  final $Res Function(UpiPaymentSuccess) _then;

/// Create a copy of PaymentState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? response = null,}) {
  return _then(UpiPaymentSuccess(
null == response ? _self.response : response // ignore: cast_nullable_to_non_nullable
as UpiPaymentResponseModel,
  ));
}


}

/// @nodoc


class CardPaymentSuccess implements PaymentState {
  const CardPaymentSuccess(this.response);
  

 final  CardPaymentResponseModel response;

/// Create a copy of PaymentState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CardPaymentSuccessCopyWith<CardPaymentSuccess> get copyWith => _$CardPaymentSuccessCopyWithImpl<CardPaymentSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CardPaymentSuccess&&(identical(other.response, response) || other.response == response));
}


@override
int get hashCode => Object.hash(runtimeType,response);

@override
String toString() {
  return 'PaymentState.cardPaymentSuccess(response: $response)';
}


}

/// @nodoc
abstract mixin class $CardPaymentSuccessCopyWith<$Res> implements $PaymentStateCopyWith<$Res> {
  factory $CardPaymentSuccessCopyWith(CardPaymentSuccess value, $Res Function(CardPaymentSuccess) _then) = _$CardPaymentSuccessCopyWithImpl;
@useResult
$Res call({
 CardPaymentResponseModel response
});




}
/// @nodoc
class _$CardPaymentSuccessCopyWithImpl<$Res>
    implements $CardPaymentSuccessCopyWith<$Res> {
  _$CardPaymentSuccessCopyWithImpl(this._self, this._then);

  final CardPaymentSuccess _self;
  final $Res Function(CardPaymentSuccess) _then;

/// Create a copy of PaymentState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? response = null,}) {
  return _then(CardPaymentSuccess(
null == response ? _self.response : response // ignore: cast_nullable_to_non_nullable
as CardPaymentResponseModel,
  ));
}


}

// dart format on
