// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'slots_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SlotsState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SlotsState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SlotsState()';
}


}

/// @nodoc
class $SlotsStateCopyWith<$Res>  {
$SlotsStateCopyWith(SlotsState _, $Res Function(SlotsState) __);
}


/// Adds pattern-matching-related methods to [SlotsState].
extension SlotsStatePatterns on SlotsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( SlotsInitial value)?  initial,TResult Function( SlotsLoading value)?  loading,TResult Function( SlotsSuccess value)?  success,TResult Function( SlotsError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case SlotsInitial() when initial != null:
return initial(_that);case SlotsLoading() when loading != null:
return loading(_that);case SlotsSuccess() when success != null:
return success(_that);case SlotsError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( SlotsInitial value)  initial,required TResult Function( SlotsLoading value)  loading,required TResult Function( SlotsSuccess value)  success,required TResult Function( SlotsError value)  error,}){
final _that = this;
switch (_that) {
case SlotsInitial():
return initial(_that);case SlotsLoading():
return loading(_that);case SlotsSuccess():
return success(_that);case SlotsError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( SlotsInitial value)?  initial,TResult? Function( SlotsLoading value)?  loading,TResult? Function( SlotsSuccess value)?  success,TResult? Function( SlotsError value)?  error,}){
final _that = this;
switch (_that) {
case SlotsInitial() when initial != null:
return initial(_that);case SlotsLoading() when loading != null:
return loading(_that);case SlotsSuccess() when success != null:
return success(_that);case SlotsError() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( SlotsModel slots)?  success,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case SlotsInitial() when initial != null:
return initial();case SlotsLoading() when loading != null:
return loading();case SlotsSuccess() when success != null:
return success(_that.slots);case SlotsError() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( SlotsModel slots)  success,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case SlotsInitial():
return initial();case SlotsLoading():
return loading();case SlotsSuccess():
return success(_that.slots);case SlotsError():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( SlotsModel slots)?  success,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case SlotsInitial() when initial != null:
return initial();case SlotsLoading() when loading != null:
return loading();case SlotsSuccess() when success != null:
return success(_that.slots);case SlotsError() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class SlotsInitial implements SlotsState {
  const SlotsInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SlotsInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SlotsState.initial()';
}


}




/// @nodoc


class SlotsLoading implements SlotsState {
  const SlotsLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SlotsLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SlotsState.loading()';
}


}




/// @nodoc


class SlotsSuccess implements SlotsState {
  const SlotsSuccess(this.slots);
  

 final  SlotsModel slots;

/// Create a copy of SlotsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SlotsSuccessCopyWith<SlotsSuccess> get copyWith => _$SlotsSuccessCopyWithImpl<SlotsSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SlotsSuccess&&(identical(other.slots, slots) || other.slots == slots));
}


@override
int get hashCode => Object.hash(runtimeType,slots);

@override
String toString() {
  return 'SlotsState.success(slots: $slots)';
}


}

/// @nodoc
abstract mixin class $SlotsSuccessCopyWith<$Res> implements $SlotsStateCopyWith<$Res> {
  factory $SlotsSuccessCopyWith(SlotsSuccess value, $Res Function(SlotsSuccess) _then) = _$SlotsSuccessCopyWithImpl;
@useResult
$Res call({
 SlotsModel slots
});




}
/// @nodoc
class _$SlotsSuccessCopyWithImpl<$Res>
    implements $SlotsSuccessCopyWith<$Res> {
  _$SlotsSuccessCopyWithImpl(this._self, this._then);

  final SlotsSuccess _self;
  final $Res Function(SlotsSuccess) _then;

/// Create a copy of SlotsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? slots = null,}) {
  return _then(SlotsSuccess(
null == slots ? _self.slots : slots // ignore: cast_nullable_to_non_nullable
as SlotsModel,
  ));
}


}

/// @nodoc


class SlotsError implements SlotsState {
  const SlotsError(this.message);
  

 final  String message;

/// Create a copy of SlotsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SlotsErrorCopyWith<SlotsError> get copyWith => _$SlotsErrorCopyWithImpl<SlotsError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SlotsError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'SlotsState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $SlotsErrorCopyWith<$Res> implements $SlotsStateCopyWith<$Res> {
  factory $SlotsErrorCopyWith(SlotsError value, $Res Function(SlotsError) _then) = _$SlotsErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$SlotsErrorCopyWithImpl<$Res>
    implements $SlotsErrorCopyWith<$Res> {
  _$SlotsErrorCopyWithImpl(this._self, this._then);

  final SlotsError _self;
  final $Res Function(SlotsError) _then;

/// Create a copy of SlotsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(SlotsError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
