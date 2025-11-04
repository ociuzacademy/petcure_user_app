// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pets_list_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PetsListState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PetsListState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PetsListState()';
}


}

/// @nodoc
class $PetsListStateCopyWith<$Res>  {
$PetsListStateCopyWith(PetsListState _, $Res Function(PetsListState) __);
}


/// Adds pattern-matching-related methods to [PetsListState].
extension PetsListStatePatterns on PetsListState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( PetsListInitial value)?  initial,TResult Function( PetsListLoading value)?  petsListLoading,TResult Function( PetsListError value)?  petsListError,TResult Function( UserPetsSuccess value)?  userPetsSuccess,required TResult orElse(),}){
final _that = this;
switch (_that) {
case PetsListInitial() when initial != null:
return initial(_that);case PetsListLoading() when petsListLoading != null:
return petsListLoading(_that);case PetsListError() when petsListError != null:
return petsListError(_that);case UserPetsSuccess() when userPetsSuccess != null:
return userPetsSuccess(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( PetsListInitial value)  initial,required TResult Function( PetsListLoading value)  petsListLoading,required TResult Function( PetsListError value)  petsListError,required TResult Function( UserPetsSuccess value)  userPetsSuccess,}){
final _that = this;
switch (_that) {
case PetsListInitial():
return initial(_that);case PetsListLoading():
return petsListLoading(_that);case PetsListError():
return petsListError(_that);case UserPetsSuccess():
return userPetsSuccess(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( PetsListInitial value)?  initial,TResult? Function( PetsListLoading value)?  petsListLoading,TResult? Function( PetsListError value)?  petsListError,TResult? Function( UserPetsSuccess value)?  userPetsSuccess,}){
final _that = this;
switch (_that) {
case PetsListInitial() when initial != null:
return initial(_that);case PetsListLoading() when petsListLoading != null:
return petsListLoading(_that);case PetsListError() when petsListError != null:
return petsListError(_that);case UserPetsSuccess() when userPetsSuccess != null:
return userPetsSuccess(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  petsListLoading,TResult Function( String error)?  petsListError,TResult Function( UserPetsModel userPets)?  userPetsSuccess,required TResult orElse(),}) {final _that = this;
switch (_that) {
case PetsListInitial() when initial != null:
return initial();case PetsListLoading() when petsListLoading != null:
return petsListLoading();case PetsListError() when petsListError != null:
return petsListError(_that.error);case UserPetsSuccess() when userPetsSuccess != null:
return userPetsSuccess(_that.userPets);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  petsListLoading,required TResult Function( String error)  petsListError,required TResult Function( UserPetsModel userPets)  userPetsSuccess,}) {final _that = this;
switch (_that) {
case PetsListInitial():
return initial();case PetsListLoading():
return petsListLoading();case PetsListError():
return petsListError(_that.error);case UserPetsSuccess():
return userPetsSuccess(_that.userPets);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  petsListLoading,TResult? Function( String error)?  petsListError,TResult? Function( UserPetsModel userPets)?  userPetsSuccess,}) {final _that = this;
switch (_that) {
case PetsListInitial() when initial != null:
return initial();case PetsListLoading() when petsListLoading != null:
return petsListLoading();case PetsListError() when petsListError != null:
return petsListError(_that.error);case UserPetsSuccess() when userPetsSuccess != null:
return userPetsSuccess(_that.userPets);case _:
  return null;

}
}

}

/// @nodoc


class PetsListInitial implements PetsListState {
  const PetsListInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PetsListInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PetsListState.initial()';
}


}




/// @nodoc


class PetsListLoading implements PetsListState {
  const PetsListLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PetsListLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PetsListState.petsListLoading()';
}


}




/// @nodoc


class PetsListError implements PetsListState {
  const PetsListError(this.error);
  

 final  String error;

/// Create a copy of PetsListState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PetsListErrorCopyWith<PetsListError> get copyWith => _$PetsListErrorCopyWithImpl<PetsListError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PetsListError&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,error);

@override
String toString() {
  return 'PetsListState.petsListError(error: $error)';
}


}

/// @nodoc
abstract mixin class $PetsListErrorCopyWith<$Res> implements $PetsListStateCopyWith<$Res> {
  factory $PetsListErrorCopyWith(PetsListError value, $Res Function(PetsListError) _then) = _$PetsListErrorCopyWithImpl;
@useResult
$Res call({
 String error
});




}
/// @nodoc
class _$PetsListErrorCopyWithImpl<$Res>
    implements $PetsListErrorCopyWith<$Res> {
  _$PetsListErrorCopyWithImpl(this._self, this._then);

  final PetsListError _self;
  final $Res Function(PetsListError) _then;

/// Create a copy of PetsListState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(PetsListError(
null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class UserPetsSuccess implements PetsListState {
  const UserPetsSuccess(this.userPets);
  

 final  UserPetsModel userPets;

/// Create a copy of PetsListState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserPetsSuccessCopyWith<UserPetsSuccess> get copyWith => _$UserPetsSuccessCopyWithImpl<UserPetsSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserPetsSuccess&&(identical(other.userPets, userPets) || other.userPets == userPets));
}


@override
int get hashCode => Object.hash(runtimeType,userPets);

@override
String toString() {
  return 'PetsListState.userPetsSuccess(userPets: $userPets)';
}


}

/// @nodoc
abstract mixin class $UserPetsSuccessCopyWith<$Res> implements $PetsListStateCopyWith<$Res> {
  factory $UserPetsSuccessCopyWith(UserPetsSuccess value, $Res Function(UserPetsSuccess) _then) = _$UserPetsSuccessCopyWithImpl;
@useResult
$Res call({
 UserPetsModel userPets
});




}
/// @nodoc
class _$UserPetsSuccessCopyWithImpl<$Res>
    implements $UserPetsSuccessCopyWith<$Res> {
  _$UserPetsSuccessCopyWithImpl(this._self, this._then);

  final UserPetsSuccess _self;
  final $Res Function(UserPetsSuccess) _then;

/// Create a copy of PetsListState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? userPets = null,}) {
  return _then(UserPetsSuccess(
null == userPets ? _self.userPets : userPets // ignore: cast_nullable_to_non_nullable
as UserPetsModel,
  ));
}


}

// dart format on
