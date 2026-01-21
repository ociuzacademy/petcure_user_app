// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cancel_appointment_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CancelAppointmentEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CancelAppointmentEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CancelAppointmentEvent()';
}


}

/// @nodoc
class $CancelAppointmentEventCopyWith<$Res>  {
$CancelAppointmentEventCopyWith(CancelAppointmentEvent _, $Res Function(CancelAppointmentEvent) __);
}


/// Adds pattern-matching-related methods to [CancelAppointmentEvent].
extension CancelAppointmentEventPatterns on CancelAppointmentEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Started value)?  started,TResult Function( _CancelAppointment value)?  cancelAppointment,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _CancelAppointment() when cancelAppointment != null:
return cancelAppointment(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Started value)  started,required TResult Function( _CancelAppointment value)  cancelAppointment,}){
final _that = this;
switch (_that) {
case _Started():
return started(_that);case _CancelAppointment():
return cancelAppointment(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Started value)?  started,TResult? Function( _CancelAppointment value)?  cancelAppointment,}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _CancelAppointment() when cancelAppointment != null:
return cancelAppointment(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  started,TResult Function( int bookingId)?  cancelAppointment,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _CancelAppointment() when cancelAppointment != null:
return cancelAppointment(_that.bookingId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  started,required TResult Function( int bookingId)  cancelAppointment,}) {final _that = this;
switch (_that) {
case _Started():
return started();case _CancelAppointment():
return cancelAppointment(_that.bookingId);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  started,TResult? Function( int bookingId)?  cancelAppointment,}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _CancelAppointment() when cancelAppointment != null:
return cancelAppointment(_that.bookingId);case _:
  return null;

}
}

}

/// @nodoc


class _Started implements CancelAppointmentEvent {
  const _Started();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Started);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CancelAppointmentEvent.started()';
}


}




/// @nodoc


class _CancelAppointment implements CancelAppointmentEvent {
  const _CancelAppointment({required this.bookingId});
  

 final  int bookingId;

/// Create a copy of CancelAppointmentEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CancelAppointmentCopyWith<_CancelAppointment> get copyWith => __$CancelAppointmentCopyWithImpl<_CancelAppointment>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CancelAppointment&&(identical(other.bookingId, bookingId) || other.bookingId == bookingId));
}


@override
int get hashCode => Object.hash(runtimeType,bookingId);

@override
String toString() {
  return 'CancelAppointmentEvent.cancelAppointment(bookingId: $bookingId)';
}


}

/// @nodoc
abstract mixin class _$CancelAppointmentCopyWith<$Res> implements $CancelAppointmentEventCopyWith<$Res> {
  factory _$CancelAppointmentCopyWith(_CancelAppointment value, $Res Function(_CancelAppointment) _then) = __$CancelAppointmentCopyWithImpl;
@useResult
$Res call({
 int bookingId
});




}
/// @nodoc
class __$CancelAppointmentCopyWithImpl<$Res>
    implements _$CancelAppointmentCopyWith<$Res> {
  __$CancelAppointmentCopyWithImpl(this._self, this._then);

  final _CancelAppointment _self;
  final $Res Function(_CancelAppointment) _then;

/// Create a copy of CancelAppointmentEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? bookingId = null,}) {
  return _then(_CancelAppointment(
bookingId: null == bookingId ? _self.bookingId : bookingId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
mixin _$CancelAppointmentState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CancelAppointmentState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CancelAppointmentState()';
}


}

/// @nodoc
class $CancelAppointmentStateCopyWith<$Res>  {
$CancelAppointmentStateCopyWith(CancelAppointmentState _, $Res Function(CancelAppointmentState) __);
}


/// Adds pattern-matching-related methods to [CancelAppointmentState].
extension CancelAppointmentStatePatterns on CancelAppointmentState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( CancelAppointmentInitial value)?  initial,TResult Function( CancelAppointmentLoading value)?  loading,TResult Function( CancelAppointmentSuccess value)?  success,TResult Function( CancelAppointmentError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case CancelAppointmentInitial() when initial != null:
return initial(_that);case CancelAppointmentLoading() when loading != null:
return loading(_that);case CancelAppointmentSuccess() when success != null:
return success(_that);case CancelAppointmentError() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( CancelAppointmentInitial value)  initial,required TResult Function( CancelAppointmentLoading value)  loading,required TResult Function( CancelAppointmentSuccess value)  success,required TResult Function( CancelAppointmentError value)  error,}){
final _that = this;
switch (_that) {
case CancelAppointmentInitial():
return initial(_that);case CancelAppointmentLoading():
return loading(_that);case CancelAppointmentSuccess():
return success(_that);case CancelAppointmentError():
return error(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( CancelAppointmentInitial value)?  initial,TResult? Function( CancelAppointmentLoading value)?  loading,TResult? Function( CancelAppointmentSuccess value)?  success,TResult? Function( CancelAppointmentError value)?  error,}){
final _that = this;
switch (_that) {
case CancelAppointmentInitial() when initial != null:
return initial(_that);case CancelAppointmentLoading() when loading != null:
return loading(_that);case CancelAppointmentSuccess() when success != null:
return success(_that);case CancelAppointmentError() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( CancelAppointmentResponseModel response)?  success,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case CancelAppointmentInitial() when initial != null:
return initial();case CancelAppointmentLoading() when loading != null:
return loading();case CancelAppointmentSuccess() when success != null:
return success(_that.response);case CancelAppointmentError() when error != null:
return error(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( CancelAppointmentResponseModel response)  success,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case CancelAppointmentInitial():
return initial();case CancelAppointmentLoading():
return loading();case CancelAppointmentSuccess():
return success(_that.response);case CancelAppointmentError():
return error(_that.message);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( CancelAppointmentResponseModel response)?  success,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case CancelAppointmentInitial() when initial != null:
return initial();case CancelAppointmentLoading() when loading != null:
return loading();case CancelAppointmentSuccess() when success != null:
return success(_that.response);case CancelAppointmentError() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class CancelAppointmentInitial implements CancelAppointmentState {
  const CancelAppointmentInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CancelAppointmentInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CancelAppointmentState.initial()';
}


}




/// @nodoc


class CancelAppointmentLoading implements CancelAppointmentState {
  const CancelAppointmentLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CancelAppointmentLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CancelAppointmentState.loading()';
}


}




/// @nodoc


class CancelAppointmentSuccess implements CancelAppointmentState {
  const CancelAppointmentSuccess(this.response);
  

 final  CancelAppointmentResponseModel response;

/// Create a copy of CancelAppointmentState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CancelAppointmentSuccessCopyWith<CancelAppointmentSuccess> get copyWith => _$CancelAppointmentSuccessCopyWithImpl<CancelAppointmentSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CancelAppointmentSuccess&&(identical(other.response, response) || other.response == response));
}


@override
int get hashCode => Object.hash(runtimeType,response);

@override
String toString() {
  return 'CancelAppointmentState.success(response: $response)';
}


}

/// @nodoc
abstract mixin class $CancelAppointmentSuccessCopyWith<$Res> implements $CancelAppointmentStateCopyWith<$Res> {
  factory $CancelAppointmentSuccessCopyWith(CancelAppointmentSuccess value, $Res Function(CancelAppointmentSuccess) _then) = _$CancelAppointmentSuccessCopyWithImpl;
@useResult
$Res call({
 CancelAppointmentResponseModel response
});




}
/// @nodoc
class _$CancelAppointmentSuccessCopyWithImpl<$Res>
    implements $CancelAppointmentSuccessCopyWith<$Res> {
  _$CancelAppointmentSuccessCopyWithImpl(this._self, this._then);

  final CancelAppointmentSuccess _self;
  final $Res Function(CancelAppointmentSuccess) _then;

/// Create a copy of CancelAppointmentState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? response = null,}) {
  return _then(CancelAppointmentSuccess(
null == response ? _self.response : response // ignore: cast_nullable_to_non_nullable
as CancelAppointmentResponseModel,
  ));
}


}

/// @nodoc


class CancelAppointmentError implements CancelAppointmentState {
  const CancelAppointmentError(this.message);
  

 final  String message;

/// Create a copy of CancelAppointmentState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CancelAppointmentErrorCopyWith<CancelAppointmentError> get copyWith => _$CancelAppointmentErrorCopyWithImpl<CancelAppointmentError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CancelAppointmentError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'CancelAppointmentState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $CancelAppointmentErrorCopyWith<$Res> implements $CancelAppointmentStateCopyWith<$Res> {
  factory $CancelAppointmentErrorCopyWith(CancelAppointmentError value, $Res Function(CancelAppointmentError) _then) = _$CancelAppointmentErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$CancelAppointmentErrorCopyWithImpl<$Res>
    implements $CancelAppointmentErrorCopyWith<$Res> {
  _$CancelAppointmentErrorCopyWithImpl(this._self, this._then);

  final CancelAppointmentError _self;
  final $Res Function(CancelAppointmentError) _then;

/// Create a copy of CancelAppointmentState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(CancelAppointmentError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
