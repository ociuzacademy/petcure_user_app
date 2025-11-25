// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reorder_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ReorderEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReorderEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ReorderEvent()';
}


}

/// @nodoc
class $ReorderEventCopyWith<$Res>  {
$ReorderEventCopyWith(ReorderEvent _, $Res Function(ReorderEvent) __);
}


/// Adds pattern-matching-related methods to [ReorderEvent].
extension ReorderEventPatterns on ReorderEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Started value)?  started,TResult Function( _Reordering value)?  reordering,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _Reordering() when reordering != null:
return reordering(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Started value)  started,required TResult Function( _Reordering value)  reordering,}){
final _that = this;
switch (_that) {
case _Started():
return started(_that);case _Reordering():
return reordering(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Started value)?  started,TResult? Function( _Reordering value)?  reordering,}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _Reordering() when reordering != null:
return reordering(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  started,TResult Function( int orderId)?  reordering,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _Reordering() when reordering != null:
return reordering(_that.orderId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  started,required TResult Function( int orderId)  reordering,}) {final _that = this;
switch (_that) {
case _Started():
return started();case _Reordering():
return reordering(_that.orderId);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  started,TResult? Function( int orderId)?  reordering,}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _Reordering() when reordering != null:
return reordering(_that.orderId);case _:
  return null;

}
}

}

/// @nodoc


class _Started implements ReorderEvent {
  const _Started();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Started);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ReorderEvent.started()';
}


}




/// @nodoc


class _Reordering implements ReorderEvent {
  const _Reordering(this.orderId);
  

 final  int orderId;

/// Create a copy of ReorderEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReorderingCopyWith<_Reordering> get copyWith => __$ReorderingCopyWithImpl<_Reordering>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Reordering&&(identical(other.orderId, orderId) || other.orderId == orderId));
}


@override
int get hashCode => Object.hash(runtimeType,orderId);

@override
String toString() {
  return 'ReorderEvent.reordering(orderId: $orderId)';
}


}

/// @nodoc
abstract mixin class _$ReorderingCopyWith<$Res> implements $ReorderEventCopyWith<$Res> {
  factory _$ReorderingCopyWith(_Reordering value, $Res Function(_Reordering) _then) = __$ReorderingCopyWithImpl;
@useResult
$Res call({
 int orderId
});




}
/// @nodoc
class __$ReorderingCopyWithImpl<$Res>
    implements _$ReorderingCopyWith<$Res> {
  __$ReorderingCopyWithImpl(this._self, this._then);

  final _Reordering _self;
  final $Res Function(_Reordering) _then;

/// Create a copy of ReorderEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? orderId = null,}) {
  return _then(_Reordering(
null == orderId ? _self.orderId : orderId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
mixin _$ReorderState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReorderState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ReorderState()';
}


}

/// @nodoc
class $ReorderStateCopyWith<$Res>  {
$ReorderStateCopyWith(ReorderState _, $Res Function(ReorderState) __);
}


/// Adds pattern-matching-related methods to [ReorderState].
extension ReorderStatePatterns on ReorderState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ReorderInitial value)?  initial,TResult Function( ReorderLoading value)?  reorderLoading,TResult Function( ReorderError value)?  reorderError,TResult Function( ReorderSuccess value)?  reorderSuccess,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ReorderInitial() when initial != null:
return initial(_that);case ReorderLoading() when reorderLoading != null:
return reorderLoading(_that);case ReorderError() when reorderError != null:
return reorderError(_that);case ReorderSuccess() when reorderSuccess != null:
return reorderSuccess(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ReorderInitial value)  initial,required TResult Function( ReorderLoading value)  reorderLoading,required TResult Function( ReorderError value)  reorderError,required TResult Function( ReorderSuccess value)  reorderSuccess,}){
final _that = this;
switch (_that) {
case ReorderInitial():
return initial(_that);case ReorderLoading():
return reorderLoading(_that);case ReorderError():
return reorderError(_that);case ReorderSuccess():
return reorderSuccess(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ReorderInitial value)?  initial,TResult? Function( ReorderLoading value)?  reorderLoading,TResult? Function( ReorderError value)?  reorderError,TResult? Function( ReorderSuccess value)?  reorderSuccess,}){
final _that = this;
switch (_that) {
case ReorderInitial() when initial != null:
return initial(_that);case ReorderLoading() when reorderLoading != null:
return reorderLoading(_that);case ReorderError() when reorderError != null:
return reorderError(_that);case ReorderSuccess() when reorderSuccess != null:
return reorderSuccess(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  reorderLoading,TResult Function( String errorMessage)?  reorderError,TResult Function( ReorderResponseModel response)?  reorderSuccess,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ReorderInitial() when initial != null:
return initial();case ReorderLoading() when reorderLoading != null:
return reorderLoading();case ReorderError() when reorderError != null:
return reorderError(_that.errorMessage);case ReorderSuccess() when reorderSuccess != null:
return reorderSuccess(_that.response);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  reorderLoading,required TResult Function( String errorMessage)  reorderError,required TResult Function( ReorderResponseModel response)  reorderSuccess,}) {final _that = this;
switch (_that) {
case ReorderInitial():
return initial();case ReorderLoading():
return reorderLoading();case ReorderError():
return reorderError(_that.errorMessage);case ReorderSuccess():
return reorderSuccess(_that.response);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  reorderLoading,TResult? Function( String errorMessage)?  reorderError,TResult? Function( ReorderResponseModel response)?  reorderSuccess,}) {final _that = this;
switch (_that) {
case ReorderInitial() when initial != null:
return initial();case ReorderLoading() when reorderLoading != null:
return reorderLoading();case ReorderError() when reorderError != null:
return reorderError(_that.errorMessage);case ReorderSuccess() when reorderSuccess != null:
return reorderSuccess(_that.response);case _:
  return null;

}
}

}

/// @nodoc


class ReorderInitial implements ReorderState {
  const ReorderInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReorderInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ReorderState.initial()';
}


}




/// @nodoc


class ReorderLoading implements ReorderState {
  const ReorderLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReorderLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ReorderState.reorderLoading()';
}


}




/// @nodoc


class ReorderError implements ReorderState {
  const ReorderError(this.errorMessage);
  

 final  String errorMessage;

/// Create a copy of ReorderState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReorderErrorCopyWith<ReorderError> get copyWith => _$ReorderErrorCopyWithImpl<ReorderError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReorderError&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,errorMessage);

@override
String toString() {
  return 'ReorderState.reorderError(errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $ReorderErrorCopyWith<$Res> implements $ReorderStateCopyWith<$Res> {
  factory $ReorderErrorCopyWith(ReorderError value, $Res Function(ReorderError) _then) = _$ReorderErrorCopyWithImpl;
@useResult
$Res call({
 String errorMessage
});




}
/// @nodoc
class _$ReorderErrorCopyWithImpl<$Res>
    implements $ReorderErrorCopyWith<$Res> {
  _$ReorderErrorCopyWithImpl(this._self, this._then);

  final ReorderError _self;
  final $Res Function(ReorderError) _then;

/// Create a copy of ReorderState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? errorMessage = null,}) {
  return _then(ReorderError(
null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class ReorderSuccess implements ReorderState {
  const ReorderSuccess(this.response);
  

 final  ReorderResponseModel response;

/// Create a copy of ReorderState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReorderSuccessCopyWith<ReorderSuccess> get copyWith => _$ReorderSuccessCopyWithImpl<ReorderSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReorderSuccess&&(identical(other.response, response) || other.response == response));
}


@override
int get hashCode => Object.hash(runtimeType,response);

@override
String toString() {
  return 'ReorderState.reorderSuccess(response: $response)';
}


}

/// @nodoc
abstract mixin class $ReorderSuccessCopyWith<$Res> implements $ReorderStateCopyWith<$Res> {
  factory $ReorderSuccessCopyWith(ReorderSuccess value, $Res Function(ReorderSuccess) _then) = _$ReorderSuccessCopyWithImpl;
@useResult
$Res call({
 ReorderResponseModel response
});




}
/// @nodoc
class _$ReorderSuccessCopyWithImpl<$Res>
    implements $ReorderSuccessCopyWith<$Res> {
  _$ReorderSuccessCopyWithImpl(this._self, this._then);

  final ReorderSuccess _self;
  final $Res Function(ReorderSuccess) _then;

/// Create a copy of ReorderState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? response = null,}) {
  return _then(ReorderSuccess(
null == response ? _self.response : response // ignore: cast_nullable_to_non_nullable
as ReorderResponseModel,
  ));
}


}

// dart format on
