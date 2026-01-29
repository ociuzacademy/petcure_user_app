// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'complaints_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ComplaintsState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ComplaintsState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ComplaintsState()';
}


}

/// @nodoc
class $ComplaintsStateCopyWith<$Res>  {
$ComplaintsStateCopyWith(ComplaintsState _, $Res Function(ComplaintsState) __);
}


/// Adds pattern-matching-related methods to [ComplaintsState].
extension ComplaintsStatePatterns on ComplaintsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ComplaintsInitial value)?  initial,TResult Function( ComplaintsLoading value)?  loading,TResult Function( ComplaintsLoaded value)?  loaded,TResult Function( ComplaintsError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ComplaintsInitial() when initial != null:
return initial(_that);case ComplaintsLoading() when loading != null:
return loading(_that);case ComplaintsLoaded() when loaded != null:
return loaded(_that);case ComplaintsError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ComplaintsInitial value)  initial,required TResult Function( ComplaintsLoading value)  loading,required TResult Function( ComplaintsLoaded value)  loaded,required TResult Function( ComplaintsError value)  error,}){
final _that = this;
switch (_that) {
case ComplaintsInitial():
return initial(_that);case ComplaintsLoading():
return loading(_that);case ComplaintsLoaded():
return loaded(_that);case ComplaintsError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ComplaintsInitial value)?  initial,TResult? Function( ComplaintsLoading value)?  loading,TResult? Function( ComplaintsLoaded value)?  loaded,TResult? Function( ComplaintsError value)?  error,}){
final _that = this;
switch (_that) {
case ComplaintsInitial() when initial != null:
return initial(_that);case ComplaintsLoading() when loading != null:
return loading(_that);case ComplaintsLoaded() when loaded != null:
return loaded(_that);case ComplaintsError() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( UserComplaintsModel userComplaintsModel)?  loaded,TResult Function( String error)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ComplaintsInitial() when initial != null:
return initial();case ComplaintsLoading() when loading != null:
return loading();case ComplaintsLoaded() when loaded != null:
return loaded(_that.userComplaintsModel);case ComplaintsError() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( UserComplaintsModel userComplaintsModel)  loaded,required TResult Function( String error)  error,}) {final _that = this;
switch (_that) {
case ComplaintsInitial():
return initial();case ComplaintsLoading():
return loading();case ComplaintsLoaded():
return loaded(_that.userComplaintsModel);case ComplaintsError():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( UserComplaintsModel userComplaintsModel)?  loaded,TResult? Function( String error)?  error,}) {final _that = this;
switch (_that) {
case ComplaintsInitial() when initial != null:
return initial();case ComplaintsLoading() when loading != null:
return loading();case ComplaintsLoaded() when loaded != null:
return loaded(_that.userComplaintsModel);case ComplaintsError() when error != null:
return error(_that.error);case _:
  return null;

}
}

}

/// @nodoc


class ComplaintsInitial implements ComplaintsState {
  const ComplaintsInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ComplaintsInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ComplaintsState.initial()';
}


}




/// @nodoc


class ComplaintsLoading implements ComplaintsState {
  const ComplaintsLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ComplaintsLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ComplaintsState.loading()';
}


}




/// @nodoc


class ComplaintsLoaded implements ComplaintsState {
  const ComplaintsLoaded(this.userComplaintsModel);
  

 final  UserComplaintsModel userComplaintsModel;

/// Create a copy of ComplaintsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ComplaintsLoadedCopyWith<ComplaintsLoaded> get copyWith => _$ComplaintsLoadedCopyWithImpl<ComplaintsLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ComplaintsLoaded&&(identical(other.userComplaintsModel, userComplaintsModel) || other.userComplaintsModel == userComplaintsModel));
}


@override
int get hashCode => Object.hash(runtimeType,userComplaintsModel);

@override
String toString() {
  return 'ComplaintsState.loaded(userComplaintsModel: $userComplaintsModel)';
}


}

/// @nodoc
abstract mixin class $ComplaintsLoadedCopyWith<$Res> implements $ComplaintsStateCopyWith<$Res> {
  factory $ComplaintsLoadedCopyWith(ComplaintsLoaded value, $Res Function(ComplaintsLoaded) _then) = _$ComplaintsLoadedCopyWithImpl;
@useResult
$Res call({
 UserComplaintsModel userComplaintsModel
});




}
/// @nodoc
class _$ComplaintsLoadedCopyWithImpl<$Res>
    implements $ComplaintsLoadedCopyWith<$Res> {
  _$ComplaintsLoadedCopyWithImpl(this._self, this._then);

  final ComplaintsLoaded _self;
  final $Res Function(ComplaintsLoaded) _then;

/// Create a copy of ComplaintsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? userComplaintsModel = null,}) {
  return _then(ComplaintsLoaded(
null == userComplaintsModel ? _self.userComplaintsModel : userComplaintsModel // ignore: cast_nullable_to_non_nullable
as UserComplaintsModel,
  ));
}


}

/// @nodoc


class ComplaintsError implements ComplaintsState {
  const ComplaintsError(this.error);
  

 final  String error;

/// Create a copy of ComplaintsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ComplaintsErrorCopyWith<ComplaintsError> get copyWith => _$ComplaintsErrorCopyWithImpl<ComplaintsError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ComplaintsError&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,error);

@override
String toString() {
  return 'ComplaintsState.error(error: $error)';
}


}

/// @nodoc
abstract mixin class $ComplaintsErrorCopyWith<$Res> implements $ComplaintsStateCopyWith<$Res> {
  factory $ComplaintsErrorCopyWith(ComplaintsError value, $Res Function(ComplaintsError) _then) = _$ComplaintsErrorCopyWithImpl;
@useResult
$Res call({
 String error
});




}
/// @nodoc
class _$ComplaintsErrorCopyWithImpl<$Res>
    implements $ComplaintsErrorCopyWith<$Res> {
  _$ComplaintsErrorCopyWithImpl(this._self, this._then);

  final ComplaintsError _self;
  final $Res Function(ComplaintsError) _then;

/// Create a copy of ComplaintsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(ComplaintsError(
null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
