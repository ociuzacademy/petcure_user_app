// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'next_vaccine_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$NextVaccineState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NextVaccineState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NextVaccineState()';
}


}

/// @nodoc
class $NextVaccineStateCopyWith<$Res>  {
$NextVaccineStateCopyWith(NextVaccineState _, $Res Function(NextVaccineState) __);
}


/// Adds pattern-matching-related methods to [NextVaccineState].
extension NextVaccineStatePatterns on NextVaccineState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( NextVaccineInitial value)?  initial,TResult Function( NextVaccineLoading value)?  loading,TResult Function( NextVaccineSuccess value)?  success,TResult Function( NextVaccineError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case NextVaccineInitial() when initial != null:
return initial(_that);case NextVaccineLoading() when loading != null:
return loading(_that);case NextVaccineSuccess() when success != null:
return success(_that);case NextVaccineError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( NextVaccineInitial value)  initial,required TResult Function( NextVaccineLoading value)  loading,required TResult Function( NextVaccineSuccess value)  success,required TResult Function( NextVaccineError value)  error,}){
final _that = this;
switch (_that) {
case NextVaccineInitial():
return initial(_that);case NextVaccineLoading():
return loading(_that);case NextVaccineSuccess():
return success(_that);case NextVaccineError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( NextVaccineInitial value)?  initial,TResult? Function( NextVaccineLoading value)?  loading,TResult? Function( NextVaccineSuccess value)?  success,TResult? Function( NextVaccineError value)?  error,}){
final _that = this;
switch (_that) {
case NextVaccineInitial() when initial != null:
return initial(_that);case NextVaccineLoading() when loading != null:
return loading(_that);case NextVaccineSuccess() when success != null:
return success(_that);case NextVaccineError() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( NextVaccineModel vaccineData)?  success,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case NextVaccineInitial() when initial != null:
return initial();case NextVaccineLoading() when loading != null:
return loading();case NextVaccineSuccess() when success != null:
return success(_that.vaccineData);case NextVaccineError() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( NextVaccineModel vaccineData)  success,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case NextVaccineInitial():
return initial();case NextVaccineLoading():
return loading();case NextVaccineSuccess():
return success(_that.vaccineData);case NextVaccineError():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( NextVaccineModel vaccineData)?  success,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case NextVaccineInitial() when initial != null:
return initial();case NextVaccineLoading() when loading != null:
return loading();case NextVaccineSuccess() when success != null:
return success(_that.vaccineData);case NextVaccineError() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class NextVaccineInitial implements NextVaccineState {
  const NextVaccineInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NextVaccineInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NextVaccineState.initial()';
}


}




/// @nodoc


class NextVaccineLoading implements NextVaccineState {
  const NextVaccineLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NextVaccineLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NextVaccineState.loading()';
}


}




/// @nodoc


class NextVaccineSuccess implements NextVaccineState {
  const NextVaccineSuccess(this.vaccineData);
  

 final  NextVaccineModel vaccineData;

/// Create a copy of NextVaccineState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NextVaccineSuccessCopyWith<NextVaccineSuccess> get copyWith => _$NextVaccineSuccessCopyWithImpl<NextVaccineSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NextVaccineSuccess&&(identical(other.vaccineData, vaccineData) || other.vaccineData == vaccineData));
}


@override
int get hashCode => Object.hash(runtimeType,vaccineData);

@override
String toString() {
  return 'NextVaccineState.success(vaccineData: $vaccineData)';
}


}

/// @nodoc
abstract mixin class $NextVaccineSuccessCopyWith<$Res> implements $NextVaccineStateCopyWith<$Res> {
  factory $NextVaccineSuccessCopyWith(NextVaccineSuccess value, $Res Function(NextVaccineSuccess) _then) = _$NextVaccineSuccessCopyWithImpl;
@useResult
$Res call({
 NextVaccineModel vaccineData
});




}
/// @nodoc
class _$NextVaccineSuccessCopyWithImpl<$Res>
    implements $NextVaccineSuccessCopyWith<$Res> {
  _$NextVaccineSuccessCopyWithImpl(this._self, this._then);

  final NextVaccineSuccess _self;
  final $Res Function(NextVaccineSuccess) _then;

/// Create a copy of NextVaccineState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? vaccineData = null,}) {
  return _then(NextVaccineSuccess(
null == vaccineData ? _self.vaccineData : vaccineData // ignore: cast_nullable_to_non_nullable
as NextVaccineModel,
  ));
}


}

/// @nodoc


class NextVaccineError implements NextVaccineState {
  const NextVaccineError(this.message);
  

 final  String message;

/// Create a copy of NextVaccineState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NextVaccineErrorCopyWith<NextVaccineError> get copyWith => _$NextVaccineErrorCopyWithImpl<NextVaccineError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NextVaccineError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'NextVaccineState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $NextVaccineErrorCopyWith<$Res> implements $NextVaccineStateCopyWith<$Res> {
  factory $NextVaccineErrorCopyWith(NextVaccineError value, $Res Function(NextVaccineError) _then) = _$NextVaccineErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$NextVaccineErrorCopyWithImpl<$Res>
    implements $NextVaccineErrorCopyWith<$Res> {
  _$NextVaccineErrorCopyWithImpl(this._self, this._then);

  final NextVaccineError _self;
  final $Res Function(NextVaccineError) _then;

/// Create a copy of NextVaccineState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(NextVaccineError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
