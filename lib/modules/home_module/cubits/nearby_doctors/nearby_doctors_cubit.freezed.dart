// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'nearby_doctors_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$NearbyDoctorsState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NearbyDoctorsState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NearbyDoctorsState()';
}


}

/// @nodoc
class $NearbyDoctorsStateCopyWith<$Res>  {
$NearbyDoctorsStateCopyWith(NearbyDoctorsState _, $Res Function(NearbyDoctorsState) __);
}


/// Adds pattern-matching-related methods to [NearbyDoctorsState].
extension NearbyDoctorsStatePatterns on NearbyDoctorsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( NearbyDoctorsInitial value)?  initial,TResult Function( NearbyDoctorsLoading value)?  nearbyDoctorsLoading,TResult Function( NearbyDoctorsError value)?  nearbyDoctorsError,TResult Function( NearbyDoctorsSuccess value)?  nearbyDoctorsSuccess,required TResult orElse(),}){
final _that = this;
switch (_that) {
case NearbyDoctorsInitial() when initial != null:
return initial(_that);case NearbyDoctorsLoading() when nearbyDoctorsLoading != null:
return nearbyDoctorsLoading(_that);case NearbyDoctorsError() when nearbyDoctorsError != null:
return nearbyDoctorsError(_that);case NearbyDoctorsSuccess() when nearbyDoctorsSuccess != null:
return nearbyDoctorsSuccess(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( NearbyDoctorsInitial value)  initial,required TResult Function( NearbyDoctorsLoading value)  nearbyDoctorsLoading,required TResult Function( NearbyDoctorsError value)  nearbyDoctorsError,required TResult Function( NearbyDoctorsSuccess value)  nearbyDoctorsSuccess,}){
final _that = this;
switch (_that) {
case NearbyDoctorsInitial():
return initial(_that);case NearbyDoctorsLoading():
return nearbyDoctorsLoading(_that);case NearbyDoctorsError():
return nearbyDoctorsError(_that);case NearbyDoctorsSuccess():
return nearbyDoctorsSuccess(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( NearbyDoctorsInitial value)?  initial,TResult? Function( NearbyDoctorsLoading value)?  nearbyDoctorsLoading,TResult? Function( NearbyDoctorsError value)?  nearbyDoctorsError,TResult? Function( NearbyDoctorsSuccess value)?  nearbyDoctorsSuccess,}){
final _that = this;
switch (_that) {
case NearbyDoctorsInitial() when initial != null:
return initial(_that);case NearbyDoctorsLoading() when nearbyDoctorsLoading != null:
return nearbyDoctorsLoading(_that);case NearbyDoctorsError() when nearbyDoctorsError != null:
return nearbyDoctorsError(_that);case NearbyDoctorsSuccess() when nearbyDoctorsSuccess != null:
return nearbyDoctorsSuccess(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  nearbyDoctorsLoading,TResult Function( String errorMessage)?  nearbyDoctorsError,TResult Function( NearbyDoctorsModel nearbyDoctors)?  nearbyDoctorsSuccess,required TResult orElse(),}) {final _that = this;
switch (_that) {
case NearbyDoctorsInitial() when initial != null:
return initial();case NearbyDoctorsLoading() when nearbyDoctorsLoading != null:
return nearbyDoctorsLoading();case NearbyDoctorsError() when nearbyDoctorsError != null:
return nearbyDoctorsError(_that.errorMessage);case NearbyDoctorsSuccess() when nearbyDoctorsSuccess != null:
return nearbyDoctorsSuccess(_that.nearbyDoctors);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  nearbyDoctorsLoading,required TResult Function( String errorMessage)  nearbyDoctorsError,required TResult Function( NearbyDoctorsModel nearbyDoctors)  nearbyDoctorsSuccess,}) {final _that = this;
switch (_that) {
case NearbyDoctorsInitial():
return initial();case NearbyDoctorsLoading():
return nearbyDoctorsLoading();case NearbyDoctorsError():
return nearbyDoctorsError(_that.errorMessage);case NearbyDoctorsSuccess():
return nearbyDoctorsSuccess(_that.nearbyDoctors);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  nearbyDoctorsLoading,TResult? Function( String errorMessage)?  nearbyDoctorsError,TResult? Function( NearbyDoctorsModel nearbyDoctors)?  nearbyDoctorsSuccess,}) {final _that = this;
switch (_that) {
case NearbyDoctorsInitial() when initial != null:
return initial();case NearbyDoctorsLoading() when nearbyDoctorsLoading != null:
return nearbyDoctorsLoading();case NearbyDoctorsError() when nearbyDoctorsError != null:
return nearbyDoctorsError(_that.errorMessage);case NearbyDoctorsSuccess() when nearbyDoctorsSuccess != null:
return nearbyDoctorsSuccess(_that.nearbyDoctors);case _:
  return null;

}
}

}

/// @nodoc


class NearbyDoctorsInitial implements NearbyDoctorsState {
  const NearbyDoctorsInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NearbyDoctorsInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NearbyDoctorsState.initial()';
}


}




/// @nodoc


class NearbyDoctorsLoading implements NearbyDoctorsState {
  const NearbyDoctorsLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NearbyDoctorsLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NearbyDoctorsState.nearbyDoctorsLoading()';
}


}




/// @nodoc


class NearbyDoctorsError implements NearbyDoctorsState {
  const NearbyDoctorsError(this.errorMessage);
  

 final  String errorMessage;

/// Create a copy of NearbyDoctorsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NearbyDoctorsErrorCopyWith<NearbyDoctorsError> get copyWith => _$NearbyDoctorsErrorCopyWithImpl<NearbyDoctorsError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NearbyDoctorsError&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,errorMessage);

@override
String toString() {
  return 'NearbyDoctorsState.nearbyDoctorsError(errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $NearbyDoctorsErrorCopyWith<$Res> implements $NearbyDoctorsStateCopyWith<$Res> {
  factory $NearbyDoctorsErrorCopyWith(NearbyDoctorsError value, $Res Function(NearbyDoctorsError) _then) = _$NearbyDoctorsErrorCopyWithImpl;
@useResult
$Res call({
 String errorMessage
});




}
/// @nodoc
class _$NearbyDoctorsErrorCopyWithImpl<$Res>
    implements $NearbyDoctorsErrorCopyWith<$Res> {
  _$NearbyDoctorsErrorCopyWithImpl(this._self, this._then);

  final NearbyDoctorsError _self;
  final $Res Function(NearbyDoctorsError) _then;

/// Create a copy of NearbyDoctorsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? errorMessage = null,}) {
  return _then(NearbyDoctorsError(
null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class NearbyDoctorsSuccess implements NearbyDoctorsState {
  const NearbyDoctorsSuccess(this.nearbyDoctors);
  

 final  NearbyDoctorsModel nearbyDoctors;

/// Create a copy of NearbyDoctorsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NearbyDoctorsSuccessCopyWith<NearbyDoctorsSuccess> get copyWith => _$NearbyDoctorsSuccessCopyWithImpl<NearbyDoctorsSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NearbyDoctorsSuccess&&(identical(other.nearbyDoctors, nearbyDoctors) || other.nearbyDoctors == nearbyDoctors));
}


@override
int get hashCode => Object.hash(runtimeType,nearbyDoctors);

@override
String toString() {
  return 'NearbyDoctorsState.nearbyDoctorsSuccess(nearbyDoctors: $nearbyDoctors)';
}


}

/// @nodoc
abstract mixin class $NearbyDoctorsSuccessCopyWith<$Res> implements $NearbyDoctorsStateCopyWith<$Res> {
  factory $NearbyDoctorsSuccessCopyWith(NearbyDoctorsSuccess value, $Res Function(NearbyDoctorsSuccess) _then) = _$NearbyDoctorsSuccessCopyWithImpl;
@useResult
$Res call({
 NearbyDoctorsModel nearbyDoctors
});




}
/// @nodoc
class _$NearbyDoctorsSuccessCopyWithImpl<$Res>
    implements $NearbyDoctorsSuccessCopyWith<$Res> {
  _$NearbyDoctorsSuccessCopyWithImpl(this._self, this._then);

  final NearbyDoctorsSuccess _self;
  final $Res Function(NearbyDoctorsSuccess) _then;

/// Create a copy of NearbyDoctorsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? nearbyDoctors = null,}) {
  return _then(NearbyDoctorsSuccess(
null == nearbyDoctors ? _self.nearbyDoctors : nearbyDoctors // ignore: cast_nullable_to_non_nullable
as NearbyDoctorsModel,
  ));
}


}

// dart format on
