// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'appointment_booking_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AppointmentBookingEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppointmentBookingEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AppointmentBookingEvent()';
}


}

/// @nodoc
class $AppointmentBookingEventCopyWith<$Res>  {
$AppointmentBookingEventCopyWith(AppointmentBookingEvent _, $Res Function(AppointmentBookingEvent) __);
}


/// Adds pattern-matching-related methods to [AppointmentBookingEvent].
extension AppointmentBookingEventPatterns on AppointmentBookingEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Started value)?  started,TResult Function( _BookingAppointment value)?  bookingAppointment,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _BookingAppointment() when bookingAppointment != null:
return bookingAppointment(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Started value)  started,required TResult Function( _BookingAppointment value)  bookingAppointment,}){
final _that = this;
switch (_that) {
case _Started():
return started(_that);case _BookingAppointment():
return bookingAppointment(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Started value)?  started,TResult? Function( _BookingAppointment value)?  bookingAppointment,}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _BookingAppointment() when bookingAppointment != null:
return bookingAppointment(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  started,TResult Function( AppointmentBookingData data)?  bookingAppointment,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _BookingAppointment() when bookingAppointment != null:
return bookingAppointment(_that.data);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  started,required TResult Function( AppointmentBookingData data)  bookingAppointment,}) {final _that = this;
switch (_that) {
case _Started():
return started();case _BookingAppointment():
return bookingAppointment(_that.data);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  started,TResult? Function( AppointmentBookingData data)?  bookingAppointment,}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _BookingAppointment() when bookingAppointment != null:
return bookingAppointment(_that.data);case _:
  return null;

}
}

}

/// @nodoc


class _Started implements AppointmentBookingEvent {
  const _Started();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Started);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AppointmentBookingEvent.started()';
}


}




/// @nodoc


class _BookingAppointment implements AppointmentBookingEvent {
  const _BookingAppointment(this.data);
  

 final  AppointmentBookingData data;

/// Create a copy of AppointmentBookingEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BookingAppointmentCopyWith<_BookingAppointment> get copyWith => __$BookingAppointmentCopyWithImpl<_BookingAppointment>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BookingAppointment&&(identical(other.data, data) || other.data == data));
}


@override
int get hashCode => Object.hash(runtimeType,data);

@override
String toString() {
  return 'AppointmentBookingEvent.bookingAppointment(data: $data)';
}


}

/// @nodoc
abstract mixin class _$BookingAppointmentCopyWith<$Res> implements $AppointmentBookingEventCopyWith<$Res> {
  factory _$BookingAppointmentCopyWith(_BookingAppointment value, $Res Function(_BookingAppointment) _then) = __$BookingAppointmentCopyWithImpl;
@useResult
$Res call({
 AppointmentBookingData data
});




}
/// @nodoc
class __$BookingAppointmentCopyWithImpl<$Res>
    implements _$BookingAppointmentCopyWith<$Res> {
  __$BookingAppointmentCopyWithImpl(this._self, this._then);

  final _BookingAppointment _self;
  final $Res Function(_BookingAppointment) _then;

/// Create a copy of AppointmentBookingEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? data = null,}) {
  return _then(_BookingAppointment(
null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as AppointmentBookingData,
  ));
}


}

/// @nodoc
mixin _$AppointmentBookingState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppointmentBookingState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AppointmentBookingState()';
}


}

/// @nodoc
class $AppointmentBookingStateCopyWith<$Res>  {
$AppointmentBookingStateCopyWith(AppointmentBookingState _, $Res Function(AppointmentBookingState) __);
}


/// Adds pattern-matching-related methods to [AppointmentBookingState].
extension AppointmentBookingStatePatterns on AppointmentBookingState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( AppointmentBookingInitial value)?  initial,TResult Function( AppointmentBookingLoading value)?  loading,TResult Function( AppointmentBookingSuccess value)?  success,TResult Function( AppointmentBookingError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case AppointmentBookingInitial() when initial != null:
return initial(_that);case AppointmentBookingLoading() when loading != null:
return loading(_that);case AppointmentBookingSuccess() when success != null:
return success(_that);case AppointmentBookingError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( AppointmentBookingInitial value)  initial,required TResult Function( AppointmentBookingLoading value)  loading,required TResult Function( AppointmentBookingSuccess value)  success,required TResult Function( AppointmentBookingError value)  error,}){
final _that = this;
switch (_that) {
case AppointmentBookingInitial():
return initial(_that);case AppointmentBookingLoading():
return loading(_that);case AppointmentBookingSuccess():
return success(_that);case AppointmentBookingError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( AppointmentBookingInitial value)?  initial,TResult? Function( AppointmentBookingLoading value)?  loading,TResult? Function( AppointmentBookingSuccess value)?  success,TResult? Function( AppointmentBookingError value)?  error,}){
final _that = this;
switch (_that) {
case AppointmentBookingInitial() when initial != null:
return initial(_that);case AppointmentBookingLoading() when loading != null:
return loading(_that);case AppointmentBookingSuccess() when success != null:
return success(_that);case AppointmentBookingError() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( AppointmentBookingResponseModel response)?  success,TResult Function( String error)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case AppointmentBookingInitial() when initial != null:
return initial();case AppointmentBookingLoading() when loading != null:
return loading();case AppointmentBookingSuccess() when success != null:
return success(_that.response);case AppointmentBookingError() when error != null:
return error(_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( AppointmentBookingResponseModel response)  success,required TResult Function( String error)  error,}) {final _that = this;
switch (_that) {
case AppointmentBookingInitial():
return initial();case AppointmentBookingLoading():
return loading();case AppointmentBookingSuccess():
return success(_that.response);case AppointmentBookingError():
return error(_that.error);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( AppointmentBookingResponseModel response)?  success,TResult? Function( String error)?  error,}) {final _that = this;
switch (_that) {
case AppointmentBookingInitial() when initial != null:
return initial();case AppointmentBookingLoading() when loading != null:
return loading();case AppointmentBookingSuccess() when success != null:
return success(_that.response);case AppointmentBookingError() when error != null:
return error(_that.error);case _:
  return null;

}
}

}

/// @nodoc


class AppointmentBookingInitial implements AppointmentBookingState {
  const AppointmentBookingInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppointmentBookingInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AppointmentBookingState.initial()';
}


}




/// @nodoc


class AppointmentBookingLoading implements AppointmentBookingState {
  const AppointmentBookingLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppointmentBookingLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AppointmentBookingState.loading()';
}


}




/// @nodoc


class AppointmentBookingSuccess implements AppointmentBookingState {
  const AppointmentBookingSuccess(this.response);
  

 final  AppointmentBookingResponseModel response;

/// Create a copy of AppointmentBookingState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppointmentBookingSuccessCopyWith<AppointmentBookingSuccess> get copyWith => _$AppointmentBookingSuccessCopyWithImpl<AppointmentBookingSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppointmentBookingSuccess&&(identical(other.response, response) || other.response == response));
}


@override
int get hashCode => Object.hash(runtimeType,response);

@override
String toString() {
  return 'AppointmentBookingState.success(response: $response)';
}


}

/// @nodoc
abstract mixin class $AppointmentBookingSuccessCopyWith<$Res> implements $AppointmentBookingStateCopyWith<$Res> {
  factory $AppointmentBookingSuccessCopyWith(AppointmentBookingSuccess value, $Res Function(AppointmentBookingSuccess) _then) = _$AppointmentBookingSuccessCopyWithImpl;
@useResult
$Res call({
 AppointmentBookingResponseModel response
});




}
/// @nodoc
class _$AppointmentBookingSuccessCopyWithImpl<$Res>
    implements $AppointmentBookingSuccessCopyWith<$Res> {
  _$AppointmentBookingSuccessCopyWithImpl(this._self, this._then);

  final AppointmentBookingSuccess _self;
  final $Res Function(AppointmentBookingSuccess) _then;

/// Create a copy of AppointmentBookingState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? response = null,}) {
  return _then(AppointmentBookingSuccess(
null == response ? _self.response : response // ignore: cast_nullable_to_non_nullable
as AppointmentBookingResponseModel,
  ));
}


}

/// @nodoc


class AppointmentBookingError implements AppointmentBookingState {
  const AppointmentBookingError(this.error);
  

 final  String error;

/// Create a copy of AppointmentBookingState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppointmentBookingErrorCopyWith<AppointmentBookingError> get copyWith => _$AppointmentBookingErrorCopyWithImpl<AppointmentBookingError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppointmentBookingError&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,error);

@override
String toString() {
  return 'AppointmentBookingState.error(error: $error)';
}


}

/// @nodoc
abstract mixin class $AppointmentBookingErrorCopyWith<$Res> implements $AppointmentBookingStateCopyWith<$Res> {
  factory $AppointmentBookingErrorCopyWith(AppointmentBookingError value, $Res Function(AppointmentBookingError) _then) = _$AppointmentBookingErrorCopyWithImpl;
@useResult
$Res call({
 String error
});




}
/// @nodoc
class _$AppointmentBookingErrorCopyWithImpl<$Res>
    implements $AppointmentBookingErrorCopyWith<$Res> {
  _$AppointmentBookingErrorCopyWithImpl(this._self, this._then);

  final AppointmentBookingError _self;
  final $Res Function(AppointmentBookingError) _then;

/// Create a copy of AppointmentBookingState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(AppointmentBookingError(
null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
