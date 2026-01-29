// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'feedbacks_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$FeedbacksState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FeedbacksState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'FeedbacksState()';
}


}

/// @nodoc
class $FeedbacksStateCopyWith<$Res>  {
$FeedbacksStateCopyWith(FeedbacksState _, $Res Function(FeedbacksState) __);
}


/// Adds pattern-matching-related methods to [FeedbacksState].
extension FeedbacksStatePatterns on FeedbacksState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( FeedbacksInitial value)?  initial,TResult Function( FeedbacksLoading value)?  loading,TResult Function( FeedbacksLoaded value)?  loaded,TResult Function( FeedbacksError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case FeedbacksInitial() when initial != null:
return initial(_that);case FeedbacksLoading() when loading != null:
return loading(_that);case FeedbacksLoaded() when loaded != null:
return loaded(_that);case FeedbacksError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( FeedbacksInitial value)  initial,required TResult Function( FeedbacksLoading value)  loading,required TResult Function( FeedbacksLoaded value)  loaded,required TResult Function( FeedbacksError value)  error,}){
final _that = this;
switch (_that) {
case FeedbacksInitial():
return initial(_that);case FeedbacksLoading():
return loading(_that);case FeedbacksLoaded():
return loaded(_that);case FeedbacksError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( FeedbacksInitial value)?  initial,TResult? Function( FeedbacksLoading value)?  loading,TResult? Function( FeedbacksLoaded value)?  loaded,TResult? Function( FeedbacksError value)?  error,}){
final _that = this;
switch (_that) {
case FeedbacksInitial() when initial != null:
return initial(_that);case FeedbacksLoading() when loading != null:
return loading(_that);case FeedbacksLoaded() when loaded != null:
return loaded(_that);case FeedbacksError() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( UserFeedbacksModel userFeedbacksModel)?  loaded,TResult Function( String error)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case FeedbacksInitial() when initial != null:
return initial();case FeedbacksLoading() when loading != null:
return loading();case FeedbacksLoaded() when loaded != null:
return loaded(_that.userFeedbacksModel);case FeedbacksError() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( UserFeedbacksModel userFeedbacksModel)  loaded,required TResult Function( String error)  error,}) {final _that = this;
switch (_that) {
case FeedbacksInitial():
return initial();case FeedbacksLoading():
return loading();case FeedbacksLoaded():
return loaded(_that.userFeedbacksModel);case FeedbacksError():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( UserFeedbacksModel userFeedbacksModel)?  loaded,TResult? Function( String error)?  error,}) {final _that = this;
switch (_that) {
case FeedbacksInitial() when initial != null:
return initial();case FeedbacksLoading() when loading != null:
return loading();case FeedbacksLoaded() when loaded != null:
return loaded(_that.userFeedbacksModel);case FeedbacksError() when error != null:
return error(_that.error);case _:
  return null;

}
}

}

/// @nodoc


class FeedbacksInitial implements FeedbacksState {
  const FeedbacksInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FeedbacksInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'FeedbacksState.initial()';
}


}




/// @nodoc


class FeedbacksLoading implements FeedbacksState {
  const FeedbacksLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FeedbacksLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'FeedbacksState.loading()';
}


}




/// @nodoc


class FeedbacksLoaded implements FeedbacksState {
  const FeedbacksLoaded(this.userFeedbacksModel);
  

 final  UserFeedbacksModel userFeedbacksModel;

/// Create a copy of FeedbacksState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FeedbacksLoadedCopyWith<FeedbacksLoaded> get copyWith => _$FeedbacksLoadedCopyWithImpl<FeedbacksLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FeedbacksLoaded&&(identical(other.userFeedbacksModel, userFeedbacksModel) || other.userFeedbacksModel == userFeedbacksModel));
}


@override
int get hashCode => Object.hash(runtimeType,userFeedbacksModel);

@override
String toString() {
  return 'FeedbacksState.loaded(userFeedbacksModel: $userFeedbacksModel)';
}


}

/// @nodoc
abstract mixin class $FeedbacksLoadedCopyWith<$Res> implements $FeedbacksStateCopyWith<$Res> {
  factory $FeedbacksLoadedCopyWith(FeedbacksLoaded value, $Res Function(FeedbacksLoaded) _then) = _$FeedbacksLoadedCopyWithImpl;
@useResult
$Res call({
 UserFeedbacksModel userFeedbacksModel
});




}
/// @nodoc
class _$FeedbacksLoadedCopyWithImpl<$Res>
    implements $FeedbacksLoadedCopyWith<$Res> {
  _$FeedbacksLoadedCopyWithImpl(this._self, this._then);

  final FeedbacksLoaded _self;
  final $Res Function(FeedbacksLoaded) _then;

/// Create a copy of FeedbacksState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? userFeedbacksModel = null,}) {
  return _then(FeedbacksLoaded(
null == userFeedbacksModel ? _self.userFeedbacksModel : userFeedbacksModel // ignore: cast_nullable_to_non_nullable
as UserFeedbacksModel,
  ));
}


}

/// @nodoc


class FeedbacksError implements FeedbacksState {
  const FeedbacksError(this.error);
  

 final  String error;

/// Create a copy of FeedbacksState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FeedbacksErrorCopyWith<FeedbacksError> get copyWith => _$FeedbacksErrorCopyWithImpl<FeedbacksError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FeedbacksError&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,error);

@override
String toString() {
  return 'FeedbacksState.error(error: $error)';
}


}

/// @nodoc
abstract mixin class $FeedbacksErrorCopyWith<$Res> implements $FeedbacksStateCopyWith<$Res> {
  factory $FeedbacksErrorCopyWith(FeedbacksError value, $Res Function(FeedbacksError) _then) = _$FeedbacksErrorCopyWithImpl;
@useResult
$Res call({
 String error
});




}
/// @nodoc
class _$FeedbacksErrorCopyWithImpl<$Res>
    implements $FeedbacksErrorCopyWith<$Res> {
  _$FeedbacksErrorCopyWithImpl(this._self, this._then);

  final FeedbacksError _self;
  final $Res Function(FeedbacksError) _then;

/// Create a copy of FeedbacksState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(FeedbacksError(
null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
