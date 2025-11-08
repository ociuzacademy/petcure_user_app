// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_profile_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$UserProfileState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserProfileState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'UserProfileState()';
}


}

/// @nodoc
class $UserProfileStateCopyWith<$Res>  {
$UserProfileStateCopyWith(UserProfileState _, $Res Function(UserProfileState) __);
}


/// Adds pattern-matching-related methods to [UserProfileState].
extension UserProfileStatePatterns on UserProfileState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( UserProfileInitial value)?  initial,TResult Function( UserProfileLoading value)?  userProfileLoading,TResult Function( UserProfileError value)?  userProfileError,TResult Function( UserPrfoileDataSuccess value)?  userPrfoileDataSuccess,required TResult orElse(),}){
final _that = this;
switch (_that) {
case UserProfileInitial() when initial != null:
return initial(_that);case UserProfileLoading() when userProfileLoading != null:
return userProfileLoading(_that);case UserProfileError() when userProfileError != null:
return userProfileError(_that);case UserPrfoileDataSuccess() when userPrfoileDataSuccess != null:
return userPrfoileDataSuccess(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( UserProfileInitial value)  initial,required TResult Function( UserProfileLoading value)  userProfileLoading,required TResult Function( UserProfileError value)  userProfileError,required TResult Function( UserPrfoileDataSuccess value)  userPrfoileDataSuccess,}){
final _that = this;
switch (_that) {
case UserProfileInitial():
return initial(_that);case UserProfileLoading():
return userProfileLoading(_that);case UserProfileError():
return userProfileError(_that);case UserPrfoileDataSuccess():
return userPrfoileDataSuccess(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( UserProfileInitial value)?  initial,TResult? Function( UserProfileLoading value)?  userProfileLoading,TResult? Function( UserProfileError value)?  userProfileError,TResult? Function( UserPrfoileDataSuccess value)?  userPrfoileDataSuccess,}){
final _that = this;
switch (_that) {
case UserProfileInitial() when initial != null:
return initial(_that);case UserProfileLoading() when userProfileLoading != null:
return userProfileLoading(_that);case UserProfileError() when userProfileError != null:
return userProfileError(_that);case UserPrfoileDataSuccess() when userPrfoileDataSuccess != null:
return userPrfoileDataSuccess(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  userProfileLoading,TResult Function( String errorMessage)?  userProfileError,TResult Function( UserProfileModel userProfileData)?  userPrfoileDataSuccess,required TResult orElse(),}) {final _that = this;
switch (_that) {
case UserProfileInitial() when initial != null:
return initial();case UserProfileLoading() when userProfileLoading != null:
return userProfileLoading();case UserProfileError() when userProfileError != null:
return userProfileError(_that.errorMessage);case UserPrfoileDataSuccess() when userPrfoileDataSuccess != null:
return userPrfoileDataSuccess(_that.userProfileData);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  userProfileLoading,required TResult Function( String errorMessage)  userProfileError,required TResult Function( UserProfileModel userProfileData)  userPrfoileDataSuccess,}) {final _that = this;
switch (_that) {
case UserProfileInitial():
return initial();case UserProfileLoading():
return userProfileLoading();case UserProfileError():
return userProfileError(_that.errorMessage);case UserPrfoileDataSuccess():
return userPrfoileDataSuccess(_that.userProfileData);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  userProfileLoading,TResult? Function( String errorMessage)?  userProfileError,TResult? Function( UserProfileModel userProfileData)?  userPrfoileDataSuccess,}) {final _that = this;
switch (_that) {
case UserProfileInitial() when initial != null:
return initial();case UserProfileLoading() when userProfileLoading != null:
return userProfileLoading();case UserProfileError() when userProfileError != null:
return userProfileError(_that.errorMessage);case UserPrfoileDataSuccess() when userPrfoileDataSuccess != null:
return userPrfoileDataSuccess(_that.userProfileData);case _:
  return null;

}
}

}

/// @nodoc


class UserProfileInitial implements UserProfileState {
  const UserProfileInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserProfileInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'UserProfileState.initial()';
}


}




/// @nodoc


class UserProfileLoading implements UserProfileState {
  const UserProfileLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserProfileLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'UserProfileState.userProfileLoading()';
}


}




/// @nodoc


class UserProfileError implements UserProfileState {
  const UserProfileError(this.errorMessage);
  

 final  String errorMessage;

/// Create a copy of UserProfileState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserProfileErrorCopyWith<UserProfileError> get copyWith => _$UserProfileErrorCopyWithImpl<UserProfileError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserProfileError&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,errorMessage);

@override
String toString() {
  return 'UserProfileState.userProfileError(errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $UserProfileErrorCopyWith<$Res> implements $UserProfileStateCopyWith<$Res> {
  factory $UserProfileErrorCopyWith(UserProfileError value, $Res Function(UserProfileError) _then) = _$UserProfileErrorCopyWithImpl;
@useResult
$Res call({
 String errorMessage
});




}
/// @nodoc
class _$UserProfileErrorCopyWithImpl<$Res>
    implements $UserProfileErrorCopyWith<$Res> {
  _$UserProfileErrorCopyWithImpl(this._self, this._then);

  final UserProfileError _self;
  final $Res Function(UserProfileError) _then;

/// Create a copy of UserProfileState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? errorMessage = null,}) {
  return _then(UserProfileError(
null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class UserPrfoileDataSuccess implements UserProfileState {
  const UserPrfoileDataSuccess(this.userProfileData);
  

 final  UserProfileModel userProfileData;

/// Create a copy of UserProfileState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserPrfoileDataSuccessCopyWith<UserPrfoileDataSuccess> get copyWith => _$UserPrfoileDataSuccessCopyWithImpl<UserPrfoileDataSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserPrfoileDataSuccess&&(identical(other.userProfileData, userProfileData) || other.userProfileData == userProfileData));
}


@override
int get hashCode => Object.hash(runtimeType,userProfileData);

@override
String toString() {
  return 'UserProfileState.userPrfoileDataSuccess(userProfileData: $userProfileData)';
}


}

/// @nodoc
abstract mixin class $UserPrfoileDataSuccessCopyWith<$Res> implements $UserProfileStateCopyWith<$Res> {
  factory $UserPrfoileDataSuccessCopyWith(UserPrfoileDataSuccess value, $Res Function(UserPrfoileDataSuccess) _then) = _$UserPrfoileDataSuccessCopyWithImpl;
@useResult
$Res call({
 UserProfileModel userProfileData
});




}
/// @nodoc
class _$UserPrfoileDataSuccessCopyWithImpl<$Res>
    implements $UserPrfoileDataSuccessCopyWith<$Res> {
  _$UserPrfoileDataSuccessCopyWithImpl(this._self, this._then);

  final UserPrfoileDataSuccess _self;
  final $Res Function(UserPrfoileDataSuccess) _then;

/// Create a copy of UserProfileState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? userProfileData = null,}) {
  return _then(UserPrfoileDataSuccess(
null == userProfileData ? _self.userProfileData : userProfileData // ignore: cast_nullable_to_non_nullable
as UserProfileModel,
  ));
}


}

// dart format on
