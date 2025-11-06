// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pet_sub_category_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PetSubCategoryState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PetSubCategoryState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PetSubCategoryState()';
}


}

/// @nodoc
class $PetSubCategoryStateCopyWith<$Res>  {
$PetSubCategoryStateCopyWith(PetSubCategoryState _, $Res Function(PetSubCategoryState) __);
}


/// Adds pattern-matching-related methods to [PetSubCategoryState].
extension PetSubCategoryStatePatterns on PetSubCategoryState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( PetSubCategoryInitial value)?  initial,TResult Function( PetSubCategoryLoading value)?  petSubCategoryLoading,TResult Function( PetSubCategoryError value)?  petSubCategoryError,TResult Function( PetSubCategorySuccess value)?  petSubCategorySuccess,required TResult orElse(),}){
final _that = this;
switch (_that) {
case PetSubCategoryInitial() when initial != null:
return initial(_that);case PetSubCategoryLoading() when petSubCategoryLoading != null:
return petSubCategoryLoading(_that);case PetSubCategoryError() when petSubCategoryError != null:
return petSubCategoryError(_that);case PetSubCategorySuccess() when petSubCategorySuccess != null:
return petSubCategorySuccess(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( PetSubCategoryInitial value)  initial,required TResult Function( PetSubCategoryLoading value)  petSubCategoryLoading,required TResult Function( PetSubCategoryError value)  petSubCategoryError,required TResult Function( PetSubCategorySuccess value)  petSubCategorySuccess,}){
final _that = this;
switch (_that) {
case PetSubCategoryInitial():
return initial(_that);case PetSubCategoryLoading():
return petSubCategoryLoading(_that);case PetSubCategoryError():
return petSubCategoryError(_that);case PetSubCategorySuccess():
return petSubCategorySuccess(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( PetSubCategoryInitial value)?  initial,TResult? Function( PetSubCategoryLoading value)?  petSubCategoryLoading,TResult? Function( PetSubCategoryError value)?  petSubCategoryError,TResult? Function( PetSubCategorySuccess value)?  petSubCategorySuccess,}){
final _that = this;
switch (_that) {
case PetSubCategoryInitial() when initial != null:
return initial(_that);case PetSubCategoryLoading() when petSubCategoryLoading != null:
return petSubCategoryLoading(_that);case PetSubCategoryError() when petSubCategoryError != null:
return petSubCategoryError(_that);case PetSubCategorySuccess() when petSubCategorySuccess != null:
return petSubCategorySuccess(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  petSubCategoryLoading,TResult Function( String errorMessage)?  petSubCategoryError,TResult Function( PetSubCategoryModel petSubCategories)?  petSubCategorySuccess,required TResult orElse(),}) {final _that = this;
switch (_that) {
case PetSubCategoryInitial() when initial != null:
return initial();case PetSubCategoryLoading() when petSubCategoryLoading != null:
return petSubCategoryLoading();case PetSubCategoryError() when petSubCategoryError != null:
return petSubCategoryError(_that.errorMessage);case PetSubCategorySuccess() when petSubCategorySuccess != null:
return petSubCategorySuccess(_that.petSubCategories);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  petSubCategoryLoading,required TResult Function( String errorMessage)  petSubCategoryError,required TResult Function( PetSubCategoryModel petSubCategories)  petSubCategorySuccess,}) {final _that = this;
switch (_that) {
case PetSubCategoryInitial():
return initial();case PetSubCategoryLoading():
return petSubCategoryLoading();case PetSubCategoryError():
return petSubCategoryError(_that.errorMessage);case PetSubCategorySuccess():
return petSubCategorySuccess(_that.petSubCategories);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  petSubCategoryLoading,TResult? Function( String errorMessage)?  petSubCategoryError,TResult? Function( PetSubCategoryModel petSubCategories)?  petSubCategorySuccess,}) {final _that = this;
switch (_that) {
case PetSubCategoryInitial() when initial != null:
return initial();case PetSubCategoryLoading() when petSubCategoryLoading != null:
return petSubCategoryLoading();case PetSubCategoryError() when petSubCategoryError != null:
return petSubCategoryError(_that.errorMessage);case PetSubCategorySuccess() when petSubCategorySuccess != null:
return petSubCategorySuccess(_that.petSubCategories);case _:
  return null;

}
}

}

/// @nodoc


class PetSubCategoryInitial implements PetSubCategoryState {
  const PetSubCategoryInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PetSubCategoryInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PetSubCategoryState.initial()';
}


}




/// @nodoc


class PetSubCategoryLoading implements PetSubCategoryState {
  const PetSubCategoryLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PetSubCategoryLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PetSubCategoryState.petSubCategoryLoading()';
}


}




/// @nodoc


class PetSubCategoryError implements PetSubCategoryState {
  const PetSubCategoryError(this.errorMessage);
  

 final  String errorMessage;

/// Create a copy of PetSubCategoryState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PetSubCategoryErrorCopyWith<PetSubCategoryError> get copyWith => _$PetSubCategoryErrorCopyWithImpl<PetSubCategoryError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PetSubCategoryError&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,errorMessage);

@override
String toString() {
  return 'PetSubCategoryState.petSubCategoryError(errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $PetSubCategoryErrorCopyWith<$Res> implements $PetSubCategoryStateCopyWith<$Res> {
  factory $PetSubCategoryErrorCopyWith(PetSubCategoryError value, $Res Function(PetSubCategoryError) _then) = _$PetSubCategoryErrorCopyWithImpl;
@useResult
$Res call({
 String errorMessage
});




}
/// @nodoc
class _$PetSubCategoryErrorCopyWithImpl<$Res>
    implements $PetSubCategoryErrorCopyWith<$Res> {
  _$PetSubCategoryErrorCopyWithImpl(this._self, this._then);

  final PetSubCategoryError _self;
  final $Res Function(PetSubCategoryError) _then;

/// Create a copy of PetSubCategoryState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? errorMessage = null,}) {
  return _then(PetSubCategoryError(
null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class PetSubCategorySuccess implements PetSubCategoryState {
  const PetSubCategorySuccess(this.petSubCategories);
  

 final  PetSubCategoryModel petSubCategories;

/// Create a copy of PetSubCategoryState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PetSubCategorySuccessCopyWith<PetSubCategorySuccess> get copyWith => _$PetSubCategorySuccessCopyWithImpl<PetSubCategorySuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PetSubCategorySuccess&&(identical(other.petSubCategories, petSubCategories) || other.petSubCategories == petSubCategories));
}


@override
int get hashCode => Object.hash(runtimeType,petSubCategories);

@override
String toString() {
  return 'PetSubCategoryState.petSubCategorySuccess(petSubCategories: $petSubCategories)';
}


}

/// @nodoc
abstract mixin class $PetSubCategorySuccessCopyWith<$Res> implements $PetSubCategoryStateCopyWith<$Res> {
  factory $PetSubCategorySuccessCopyWith(PetSubCategorySuccess value, $Res Function(PetSubCategorySuccess) _then) = _$PetSubCategorySuccessCopyWithImpl;
@useResult
$Res call({
 PetSubCategoryModel petSubCategories
});




}
/// @nodoc
class _$PetSubCategorySuccessCopyWithImpl<$Res>
    implements $PetSubCategorySuccessCopyWith<$Res> {
  _$PetSubCategorySuccessCopyWithImpl(this._self, this._then);

  final PetSubCategorySuccess _self;
  final $Res Function(PetSubCategorySuccess) _then;

/// Create a copy of PetSubCategoryState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? petSubCategories = null,}) {
  return _then(PetSubCategorySuccess(
null == petSubCategories ? _self.petSubCategories : petSubCategories // ignore: cast_nullable_to_non_nullable
as PetSubCategoryModel,
  ));
}


}

// dart format on
