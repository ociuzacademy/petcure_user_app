// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'appointment_history_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AppointmentHistoryState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppointmentHistoryState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AppointmentHistoryState()';
}


}

/// @nodoc
class $AppointmentHistoryStateCopyWith<$Res>  {
$AppointmentHistoryStateCopyWith(AppointmentHistoryState _, $Res Function(AppointmentHistoryState) __);
}


/// Adds pattern-matching-related methods to [AppointmentHistoryState].
extension AppointmentHistoryStatePatterns on AppointmentHistoryState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( AppointmentHistoryInitial value)?  initial,TResult Function( AppointmentHistoryLoading value)?  loading,TResult Function( AppointmentHistorySuccess value)?  success,TResult Function( AppointmentHistoryError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case AppointmentHistoryInitial() when initial != null:
return initial(_that);case AppointmentHistoryLoading() when loading != null:
return loading(_that);case AppointmentHistorySuccess() when success != null:
return success(_that);case AppointmentHistoryError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( AppointmentHistoryInitial value)  initial,required TResult Function( AppointmentHistoryLoading value)  loading,required TResult Function( AppointmentHistorySuccess value)  success,required TResult Function( AppointmentHistoryError value)  error,}){
final _that = this;
switch (_that) {
case AppointmentHistoryInitial():
return initial(_that);case AppointmentHistoryLoading():
return loading(_that);case AppointmentHistorySuccess():
return success(_that);case AppointmentHistoryError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( AppointmentHistoryInitial value)?  initial,TResult? Function( AppointmentHistoryLoading value)?  loading,TResult? Function( AppointmentHistorySuccess value)?  success,TResult? Function( AppointmentHistoryError value)?  error,}){
final _that = this;
switch (_that) {
case AppointmentHistoryInitial() when initial != null:
return initial(_that);case AppointmentHistoryLoading() when loading != null:
return loading(_that);case AppointmentHistorySuccess() when success != null:
return success(_that);case AppointmentHistoryError() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( PetAppointmentHistoryModel petAppointmentHistory)?  success,TResult Function( String error)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case AppointmentHistoryInitial() when initial != null:
return initial();case AppointmentHistoryLoading() when loading != null:
return loading();case AppointmentHistorySuccess() when success != null:
return success(_that.petAppointmentHistory);case AppointmentHistoryError() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( PetAppointmentHistoryModel petAppointmentHistory)  success,required TResult Function( String error)  error,}) {final _that = this;
switch (_that) {
case AppointmentHistoryInitial():
return initial();case AppointmentHistoryLoading():
return loading();case AppointmentHistorySuccess():
return success(_that.petAppointmentHistory);case AppointmentHistoryError():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( PetAppointmentHistoryModel petAppointmentHistory)?  success,TResult? Function( String error)?  error,}) {final _that = this;
switch (_that) {
case AppointmentHistoryInitial() when initial != null:
return initial();case AppointmentHistoryLoading() when loading != null:
return loading();case AppointmentHistorySuccess() when success != null:
return success(_that.petAppointmentHistory);case AppointmentHistoryError() when error != null:
return error(_that.error);case _:
  return null;

}
}

}

/// @nodoc


class AppointmentHistoryInitial implements AppointmentHistoryState {
  const AppointmentHistoryInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppointmentHistoryInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AppointmentHistoryState.initial()';
}


}




/// @nodoc


class AppointmentHistoryLoading implements AppointmentHistoryState {
  const AppointmentHistoryLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppointmentHistoryLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AppointmentHistoryState.loading()';
}


}




/// @nodoc


class AppointmentHistorySuccess implements AppointmentHistoryState {
  const AppointmentHistorySuccess({required this.petAppointmentHistory});
  

 final  PetAppointmentHistoryModel petAppointmentHistory;

/// Create a copy of AppointmentHistoryState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppointmentHistorySuccessCopyWith<AppointmentHistorySuccess> get copyWith => _$AppointmentHistorySuccessCopyWithImpl<AppointmentHistorySuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppointmentHistorySuccess&&const DeepCollectionEquality().equals(other.petAppointmentHistory, petAppointmentHistory));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(petAppointmentHistory));

@override
String toString() {
  return 'AppointmentHistoryState.success(petAppointmentHistory: $petAppointmentHistory)';
}


}

/// @nodoc
abstract mixin class $AppointmentHistorySuccessCopyWith<$Res> implements $AppointmentHistoryStateCopyWith<$Res> {
  factory $AppointmentHistorySuccessCopyWith(AppointmentHistorySuccess value, $Res Function(AppointmentHistorySuccess) _then) = _$AppointmentHistorySuccessCopyWithImpl;
@useResult
$Res call({
 PetAppointmentHistoryModel petAppointmentHistory
});




}
/// @nodoc
class _$AppointmentHistorySuccessCopyWithImpl<$Res>
    implements $AppointmentHistorySuccessCopyWith<$Res> {
  _$AppointmentHistorySuccessCopyWithImpl(this._self, this._then);

  final AppointmentHistorySuccess _self;
  final $Res Function(AppointmentHistorySuccess) _then;

/// Create a copy of AppointmentHistoryState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? petAppointmentHistory = freezed,}) {
  return _then(AppointmentHistorySuccess(
petAppointmentHistory: freezed == petAppointmentHistory ? _self.petAppointmentHistory : petAppointmentHistory // ignore: cast_nullable_to_non_nullable
as PetAppointmentHistoryModel,
  ));
}


}

/// @nodoc


class AppointmentHistoryError implements AppointmentHistoryState {
  const AppointmentHistoryError({required this.error});
  

 final  String error;

/// Create a copy of AppointmentHistoryState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppointmentHistoryErrorCopyWith<AppointmentHistoryError> get copyWith => _$AppointmentHistoryErrorCopyWithImpl<AppointmentHistoryError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppointmentHistoryError&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,error);

@override
String toString() {
  return 'AppointmentHistoryState.error(error: $error)';
}


}

/// @nodoc
abstract mixin class $AppointmentHistoryErrorCopyWith<$Res> implements $AppointmentHistoryStateCopyWith<$Res> {
  factory $AppointmentHistoryErrorCopyWith(AppointmentHistoryError value, $Res Function(AppointmentHistoryError) _then) = _$AppointmentHistoryErrorCopyWithImpl;
@useResult
$Res call({
 String error
});




}
/// @nodoc
class _$AppointmentHistoryErrorCopyWithImpl<$Res>
    implements $AppointmentHistoryErrorCopyWith<$Res> {
  _$AppointmentHistoryErrorCopyWithImpl(this._self, this._then);

  final AppointmentHistoryError _self;
  final $Res Function(AppointmentHistoryError) _then;

/// Create a copy of AppointmentHistoryState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(AppointmentHistoryError(
error: null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
