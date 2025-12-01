// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cancel_order_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CancelOrderEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CancelOrderEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CancelOrderEvent()';
}


}

/// @nodoc
class $CancelOrderEventCopyWith<$Res>  {
$CancelOrderEventCopyWith(CancelOrderEvent _, $Res Function(CancelOrderEvent) __);
}


/// Adds pattern-matching-related methods to [CancelOrderEvent].
extension CancelOrderEventPatterns on CancelOrderEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Started value)?  started,TResult Function( _CancellingOrder value)?  cancellingOrder,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _CancellingOrder() when cancellingOrder != null:
return cancellingOrder(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Started value)  started,required TResult Function( _CancellingOrder value)  cancellingOrder,}){
final _that = this;
switch (_that) {
case _Started():
return started(_that);case _CancellingOrder():
return cancellingOrder(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Started value)?  started,TResult? Function( _CancellingOrder value)?  cancellingOrder,}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _CancellingOrder() when cancellingOrder != null:
return cancellingOrder(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  started,TResult Function( int orderId)?  cancellingOrder,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _CancellingOrder() when cancellingOrder != null:
return cancellingOrder(_that.orderId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  started,required TResult Function( int orderId)  cancellingOrder,}) {final _that = this;
switch (_that) {
case _Started():
return started();case _CancellingOrder():
return cancellingOrder(_that.orderId);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  started,TResult? Function( int orderId)?  cancellingOrder,}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _CancellingOrder() when cancellingOrder != null:
return cancellingOrder(_that.orderId);case _:
  return null;

}
}

}

/// @nodoc


class _Started implements CancelOrderEvent {
  const _Started();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Started);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CancelOrderEvent.started()';
}


}




/// @nodoc


class _CancellingOrder implements CancelOrderEvent {
  const _CancellingOrder(this.orderId);
  

 final  int orderId;

/// Create a copy of CancelOrderEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CancellingOrderCopyWith<_CancellingOrder> get copyWith => __$CancellingOrderCopyWithImpl<_CancellingOrder>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CancellingOrder&&(identical(other.orderId, orderId) || other.orderId == orderId));
}


@override
int get hashCode => Object.hash(runtimeType,orderId);

@override
String toString() {
  return 'CancelOrderEvent.cancellingOrder(orderId: $orderId)';
}


}

/// @nodoc
abstract mixin class _$CancellingOrderCopyWith<$Res> implements $CancelOrderEventCopyWith<$Res> {
  factory _$CancellingOrderCopyWith(_CancellingOrder value, $Res Function(_CancellingOrder) _then) = __$CancellingOrderCopyWithImpl;
@useResult
$Res call({
 int orderId
});




}
/// @nodoc
class __$CancellingOrderCopyWithImpl<$Res>
    implements _$CancellingOrderCopyWith<$Res> {
  __$CancellingOrderCopyWithImpl(this._self, this._then);

  final _CancellingOrder _self;
  final $Res Function(_CancellingOrder) _then;

/// Create a copy of CancelOrderEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? orderId = null,}) {
  return _then(_CancellingOrder(
null == orderId ? _self.orderId : orderId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
mixin _$CancelOrderState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CancelOrderState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CancelOrderState()';
}


}

/// @nodoc
class $CancelOrderStateCopyWith<$Res>  {
$CancelOrderStateCopyWith(CancelOrderState _, $Res Function(CancelOrderState) __);
}


/// Adds pattern-matching-related methods to [CancelOrderState].
extension CancelOrderStatePatterns on CancelOrderState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( CancelOrderInitial value)?  initial,TResult Function( CancelOrderLoading value)?  cancelOrderLoading,TResult Function( CancelOrderError value)?  cancelOrderError,TResult Function( CancelOrderSuccess value)?  cancelOrderSuccess,required TResult orElse(),}){
final _that = this;
switch (_that) {
case CancelOrderInitial() when initial != null:
return initial(_that);case CancelOrderLoading() when cancelOrderLoading != null:
return cancelOrderLoading(_that);case CancelOrderError() when cancelOrderError != null:
return cancelOrderError(_that);case CancelOrderSuccess() when cancelOrderSuccess != null:
return cancelOrderSuccess(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( CancelOrderInitial value)  initial,required TResult Function( CancelOrderLoading value)  cancelOrderLoading,required TResult Function( CancelOrderError value)  cancelOrderError,required TResult Function( CancelOrderSuccess value)  cancelOrderSuccess,}){
final _that = this;
switch (_that) {
case CancelOrderInitial():
return initial(_that);case CancelOrderLoading():
return cancelOrderLoading(_that);case CancelOrderError():
return cancelOrderError(_that);case CancelOrderSuccess():
return cancelOrderSuccess(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( CancelOrderInitial value)?  initial,TResult? Function( CancelOrderLoading value)?  cancelOrderLoading,TResult? Function( CancelOrderError value)?  cancelOrderError,TResult? Function( CancelOrderSuccess value)?  cancelOrderSuccess,}){
final _that = this;
switch (_that) {
case CancelOrderInitial() when initial != null:
return initial(_that);case CancelOrderLoading() when cancelOrderLoading != null:
return cancelOrderLoading(_that);case CancelOrderError() when cancelOrderError != null:
return cancelOrderError(_that);case CancelOrderSuccess() when cancelOrderSuccess != null:
return cancelOrderSuccess(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  cancelOrderLoading,TResult Function( String errorMessage)?  cancelOrderError,TResult Function( CancelOrderResponseModel response)?  cancelOrderSuccess,required TResult orElse(),}) {final _that = this;
switch (_that) {
case CancelOrderInitial() when initial != null:
return initial();case CancelOrderLoading() when cancelOrderLoading != null:
return cancelOrderLoading();case CancelOrderError() when cancelOrderError != null:
return cancelOrderError(_that.errorMessage);case CancelOrderSuccess() when cancelOrderSuccess != null:
return cancelOrderSuccess(_that.response);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  cancelOrderLoading,required TResult Function( String errorMessage)  cancelOrderError,required TResult Function( CancelOrderResponseModel response)  cancelOrderSuccess,}) {final _that = this;
switch (_that) {
case CancelOrderInitial():
return initial();case CancelOrderLoading():
return cancelOrderLoading();case CancelOrderError():
return cancelOrderError(_that.errorMessage);case CancelOrderSuccess():
return cancelOrderSuccess(_that.response);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  cancelOrderLoading,TResult? Function( String errorMessage)?  cancelOrderError,TResult? Function( CancelOrderResponseModel response)?  cancelOrderSuccess,}) {final _that = this;
switch (_that) {
case CancelOrderInitial() when initial != null:
return initial();case CancelOrderLoading() when cancelOrderLoading != null:
return cancelOrderLoading();case CancelOrderError() when cancelOrderError != null:
return cancelOrderError(_that.errorMessage);case CancelOrderSuccess() when cancelOrderSuccess != null:
return cancelOrderSuccess(_that.response);case _:
  return null;

}
}

}

/// @nodoc


class CancelOrderInitial implements CancelOrderState {
  const CancelOrderInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CancelOrderInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CancelOrderState.initial()';
}


}




/// @nodoc


class CancelOrderLoading implements CancelOrderState {
  const CancelOrderLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CancelOrderLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CancelOrderState.cancelOrderLoading()';
}


}




/// @nodoc


class CancelOrderError implements CancelOrderState {
  const CancelOrderError(this.errorMessage);
  

 final  String errorMessage;

/// Create a copy of CancelOrderState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CancelOrderErrorCopyWith<CancelOrderError> get copyWith => _$CancelOrderErrorCopyWithImpl<CancelOrderError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CancelOrderError&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,errorMessage);

@override
String toString() {
  return 'CancelOrderState.cancelOrderError(errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $CancelOrderErrorCopyWith<$Res> implements $CancelOrderStateCopyWith<$Res> {
  factory $CancelOrderErrorCopyWith(CancelOrderError value, $Res Function(CancelOrderError) _then) = _$CancelOrderErrorCopyWithImpl;
@useResult
$Res call({
 String errorMessage
});




}
/// @nodoc
class _$CancelOrderErrorCopyWithImpl<$Res>
    implements $CancelOrderErrorCopyWith<$Res> {
  _$CancelOrderErrorCopyWithImpl(this._self, this._then);

  final CancelOrderError _self;
  final $Res Function(CancelOrderError) _then;

/// Create a copy of CancelOrderState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? errorMessage = null,}) {
  return _then(CancelOrderError(
null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class CancelOrderSuccess implements CancelOrderState {
  const CancelOrderSuccess(this.response);
  

 final  CancelOrderResponseModel response;

/// Create a copy of CancelOrderState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CancelOrderSuccessCopyWith<CancelOrderSuccess> get copyWith => _$CancelOrderSuccessCopyWithImpl<CancelOrderSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CancelOrderSuccess&&(identical(other.response, response) || other.response == response));
}


@override
int get hashCode => Object.hash(runtimeType,response);

@override
String toString() {
  return 'CancelOrderState.cancelOrderSuccess(response: $response)';
}


}

/// @nodoc
abstract mixin class $CancelOrderSuccessCopyWith<$Res> implements $CancelOrderStateCopyWith<$Res> {
  factory $CancelOrderSuccessCopyWith(CancelOrderSuccess value, $Res Function(CancelOrderSuccess) _then) = _$CancelOrderSuccessCopyWithImpl;
@useResult
$Res call({
 CancelOrderResponseModel response
});




}
/// @nodoc
class _$CancelOrderSuccessCopyWithImpl<$Res>
    implements $CancelOrderSuccessCopyWith<$Res> {
  _$CancelOrderSuccessCopyWithImpl(this._self, this._then);

  final CancelOrderSuccess _self;
  final $Res Function(CancelOrderSuccess) _then;

/// Create a copy of CancelOrderState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? response = null,}) {
  return _then(CancelOrderSuccess(
null == response ? _self.response : response // ignore: cast_nullable_to_non_nullable
as CancelOrderResponseModel,
  ));
}


}

// dart format on
