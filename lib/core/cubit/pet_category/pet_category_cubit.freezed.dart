// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pet_category_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PetCategoryState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PetCategoryState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PetCategoryState()';
}


}

/// @nodoc
class $PetCategoryStateCopyWith<$Res>  {
$PetCategoryStateCopyWith(PetCategoryState _, $Res Function(PetCategoryState) __);
}


/// Adds pattern-matching-related methods to [PetCategoryState].
extension PetCategoryStatePatterns on PetCategoryState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( PetCategoryInitial value)?  initial,TResult Function( PetCategoriesLoading value)?  petCategoriesLoading,TResult Function( PetCategoriesError value)?  petCategoriesError,TResult Function( PetCategoriesSuccess value)?  petCategoriesSuccess,required TResult orElse(),}){
final _that = this;
switch (_that) {
case PetCategoryInitial() when initial != null:
return initial(_that);case PetCategoriesLoading() when petCategoriesLoading != null:
return petCategoriesLoading(_that);case PetCategoriesError() when petCategoriesError != null:
return petCategoriesError(_that);case PetCategoriesSuccess() when petCategoriesSuccess != null:
return petCategoriesSuccess(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( PetCategoryInitial value)  initial,required TResult Function( PetCategoriesLoading value)  petCategoriesLoading,required TResult Function( PetCategoriesError value)  petCategoriesError,required TResult Function( PetCategoriesSuccess value)  petCategoriesSuccess,}){
final _that = this;
switch (_that) {
case PetCategoryInitial():
return initial(_that);case PetCategoriesLoading():
return petCategoriesLoading(_that);case PetCategoriesError():
return petCategoriesError(_that);case PetCategoriesSuccess():
return petCategoriesSuccess(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( PetCategoryInitial value)?  initial,TResult? Function( PetCategoriesLoading value)?  petCategoriesLoading,TResult? Function( PetCategoriesError value)?  petCategoriesError,TResult? Function( PetCategoriesSuccess value)?  petCategoriesSuccess,}){
final _that = this;
switch (_that) {
case PetCategoryInitial() when initial != null:
return initial(_that);case PetCategoriesLoading() when petCategoriesLoading != null:
return petCategoriesLoading(_that);case PetCategoriesError() when petCategoriesError != null:
return petCategoriesError(_that);case PetCategoriesSuccess() when petCategoriesSuccess != null:
return petCategoriesSuccess(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  petCategoriesLoading,TResult Function( String errorMessage)?  petCategoriesError,TResult Function( List<PetCategoryModel> petCategories)?  petCategoriesSuccess,required TResult orElse(),}) {final _that = this;
switch (_that) {
case PetCategoryInitial() when initial != null:
return initial();case PetCategoriesLoading() when petCategoriesLoading != null:
return petCategoriesLoading();case PetCategoriesError() when petCategoriesError != null:
return petCategoriesError(_that.errorMessage);case PetCategoriesSuccess() when petCategoriesSuccess != null:
return petCategoriesSuccess(_that.petCategories);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  petCategoriesLoading,required TResult Function( String errorMessage)  petCategoriesError,required TResult Function( List<PetCategoryModel> petCategories)  petCategoriesSuccess,}) {final _that = this;
switch (_that) {
case PetCategoryInitial():
return initial();case PetCategoriesLoading():
return petCategoriesLoading();case PetCategoriesError():
return petCategoriesError(_that.errorMessage);case PetCategoriesSuccess():
return petCategoriesSuccess(_that.petCategories);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  petCategoriesLoading,TResult? Function( String errorMessage)?  petCategoriesError,TResult? Function( List<PetCategoryModel> petCategories)?  petCategoriesSuccess,}) {final _that = this;
switch (_that) {
case PetCategoryInitial() when initial != null:
return initial();case PetCategoriesLoading() when petCategoriesLoading != null:
return petCategoriesLoading();case PetCategoriesError() when petCategoriesError != null:
return petCategoriesError(_that.errorMessage);case PetCategoriesSuccess() when petCategoriesSuccess != null:
return petCategoriesSuccess(_that.petCategories);case _:
  return null;

}
}

}

/// @nodoc


class PetCategoryInitial implements PetCategoryState {
  const PetCategoryInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PetCategoryInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PetCategoryState.initial()';
}


}




/// @nodoc


class PetCategoriesLoading implements PetCategoryState {
  const PetCategoriesLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PetCategoriesLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PetCategoryState.petCategoriesLoading()';
}


}




/// @nodoc


class PetCategoriesError implements PetCategoryState {
  const PetCategoriesError(this.errorMessage);
  

 final  String errorMessage;

/// Create a copy of PetCategoryState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PetCategoriesErrorCopyWith<PetCategoriesError> get copyWith => _$PetCategoriesErrorCopyWithImpl<PetCategoriesError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PetCategoriesError&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,errorMessage);

@override
String toString() {
  return 'PetCategoryState.petCategoriesError(errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $PetCategoriesErrorCopyWith<$Res> implements $PetCategoryStateCopyWith<$Res> {
  factory $PetCategoriesErrorCopyWith(PetCategoriesError value, $Res Function(PetCategoriesError) _then) = _$PetCategoriesErrorCopyWithImpl;
@useResult
$Res call({
 String errorMessage
});




}
/// @nodoc
class _$PetCategoriesErrorCopyWithImpl<$Res>
    implements $PetCategoriesErrorCopyWith<$Res> {
  _$PetCategoriesErrorCopyWithImpl(this._self, this._then);

  final PetCategoriesError _self;
  final $Res Function(PetCategoriesError) _then;

/// Create a copy of PetCategoryState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? errorMessage = null,}) {
  return _then(PetCategoriesError(
null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class PetCategoriesSuccess implements PetCategoryState {
  const PetCategoriesSuccess(final  List<PetCategoryModel> petCategories): _petCategories = petCategories;
  

 final  List<PetCategoryModel> _petCategories;
 List<PetCategoryModel> get petCategories {
  if (_petCategories is EqualUnmodifiableListView) return _petCategories;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_petCategories);
}


/// Create a copy of PetCategoryState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PetCategoriesSuccessCopyWith<PetCategoriesSuccess> get copyWith => _$PetCategoriesSuccessCopyWithImpl<PetCategoriesSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PetCategoriesSuccess&&const DeepCollectionEquality().equals(other._petCategories, _petCategories));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_petCategories));

@override
String toString() {
  return 'PetCategoryState.petCategoriesSuccess(petCategories: $petCategories)';
}


}

/// @nodoc
abstract mixin class $PetCategoriesSuccessCopyWith<$Res> implements $PetCategoryStateCopyWith<$Res> {
  factory $PetCategoriesSuccessCopyWith(PetCategoriesSuccess value, $Res Function(PetCategoriesSuccess) _then) = _$PetCategoriesSuccessCopyWithImpl;
@useResult
$Res call({
 List<PetCategoryModel> petCategories
});




}
/// @nodoc
class _$PetCategoriesSuccessCopyWithImpl<$Res>
    implements $PetCategoriesSuccessCopyWith<$Res> {
  _$PetCategoriesSuccessCopyWithImpl(this._self, this._then);

  final PetCategoriesSuccess _self;
  final $Res Function(PetCategoriesSuccess) _then;

/// Create a copy of PetCategoryState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? petCategories = null,}) {
  return _then(PetCategoriesSuccess(
null == petCategories ? _self._petCategories : petCategories // ignore: cast_nullable_to_non_nullable
as List<PetCategoryModel>,
  ));
}


}

// dart format on
