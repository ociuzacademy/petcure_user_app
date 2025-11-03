// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'register_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$RegisterEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RegisterEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'RegisterEvent()';
}


}

/// @nodoc
class $RegisterEventCopyWith<$Res>  {
$RegisterEventCopyWith(RegisterEvent _, $Res Function(RegisterEvent) __);
}


/// Adds pattern-matching-related methods to [RegisterEvent].
extension RegisterEventPatterns on RegisterEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Started value)?  started,TResult Function( UserRegistering value)?  userRegistering,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case UserRegistering() when userRegistering != null:
return userRegistering(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Started value)  started,required TResult Function( UserRegistering value)  userRegistering,}){
final _that = this;
switch (_that) {
case _Started():
return started(_that);case UserRegistering():
return userRegistering(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Started value)?  started,TResult? Function( UserRegistering value)?  userRegistering,}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case UserRegistering() when userRegistering != null:
return userRegistering(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  started,TResult Function( UserRegisterDetails userRegisterDetails)?  userRegistering,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case UserRegistering() when userRegistering != null:
return userRegistering(_that.userRegisterDetails);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  started,required TResult Function( UserRegisterDetails userRegisterDetails)  userRegistering,}) {final _that = this;
switch (_that) {
case _Started():
return started();case UserRegistering():
return userRegistering(_that.userRegisterDetails);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  started,TResult? Function( UserRegisterDetails userRegisterDetails)?  userRegistering,}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case UserRegistering() when userRegistering != null:
return userRegistering(_that.userRegisterDetails);case _:
  return null;

}
}

}

/// @nodoc


class _Started implements RegisterEvent {
  const _Started();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Started);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'RegisterEvent.started()';
}


}




/// @nodoc


class UserRegistering implements RegisterEvent {
  const UserRegistering(this.userRegisterDetails);
  

 final  UserRegisterDetails userRegisterDetails;

/// Create a copy of RegisterEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserRegisteringCopyWith<UserRegistering> get copyWith => _$UserRegisteringCopyWithImpl<UserRegistering>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserRegistering&&(identical(other.userRegisterDetails, userRegisterDetails) || other.userRegisterDetails == userRegisterDetails));
}


@override
int get hashCode => Object.hash(runtimeType,userRegisterDetails);

@override
String toString() {
  return 'RegisterEvent.userRegistering(userRegisterDetails: $userRegisterDetails)';
}


}

/// @nodoc
abstract mixin class $UserRegisteringCopyWith<$Res> implements $RegisterEventCopyWith<$Res> {
  factory $UserRegisteringCopyWith(UserRegistering value, $Res Function(UserRegistering) _then) = _$UserRegisteringCopyWithImpl;
@useResult
$Res call({
 UserRegisterDetails userRegisterDetails
});




}
/// @nodoc
class _$UserRegisteringCopyWithImpl<$Res>
    implements $UserRegisteringCopyWith<$Res> {
  _$UserRegisteringCopyWithImpl(this._self, this._then);

  final UserRegistering _self;
  final $Res Function(UserRegistering) _then;

/// Create a copy of RegisterEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? userRegisterDetails = null,}) {
  return _then(UserRegistering(
null == userRegisterDetails ? _self.userRegisterDetails : userRegisterDetails // ignore: cast_nullable_to_non_nullable
as UserRegisterDetails,
  ));
}


}

/// @nodoc
mixin _$RegisterState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RegisterState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'RegisterState()';
}


}

/// @nodoc
class $RegisterStateCopyWith<$Res>  {
$RegisterStateCopyWith(RegisterState _, $Res Function(RegisterState) __);
}


/// Adds pattern-matching-related methods to [RegisterState].
extension RegisterStatePatterns on RegisterState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( RegisterInitial value)?  initial,TResult Function( RegisterLoading value)?  registerLoading,TResult Function( RegisterError value)?  registerError,TResult Function( UserRegisterSuccess value)?  userRegisterSuccess,required TResult orElse(),}){
final _that = this;
switch (_that) {
case RegisterInitial() when initial != null:
return initial(_that);case RegisterLoading() when registerLoading != null:
return registerLoading(_that);case RegisterError() when registerError != null:
return registerError(_that);case UserRegisterSuccess() when userRegisterSuccess != null:
return userRegisterSuccess(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( RegisterInitial value)  initial,required TResult Function( RegisterLoading value)  registerLoading,required TResult Function( RegisterError value)  registerError,required TResult Function( UserRegisterSuccess value)  userRegisterSuccess,}){
final _that = this;
switch (_that) {
case RegisterInitial():
return initial(_that);case RegisterLoading():
return registerLoading(_that);case RegisterError():
return registerError(_that);case UserRegisterSuccess():
return userRegisterSuccess(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( RegisterInitial value)?  initial,TResult? Function( RegisterLoading value)?  registerLoading,TResult? Function( RegisterError value)?  registerError,TResult? Function( UserRegisterSuccess value)?  userRegisterSuccess,}){
final _that = this;
switch (_that) {
case RegisterInitial() when initial != null:
return initial(_that);case RegisterLoading() when registerLoading != null:
return registerLoading(_that);case RegisterError() when registerError != null:
return registerError(_that);case UserRegisterSuccess() when userRegisterSuccess != null:
return userRegisterSuccess(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  registerLoading,TResult Function( String errorMessage)?  registerError,TResult Function( UserRegisterModel response)?  userRegisterSuccess,required TResult orElse(),}) {final _that = this;
switch (_that) {
case RegisterInitial() when initial != null:
return initial();case RegisterLoading() when registerLoading != null:
return registerLoading();case RegisterError() when registerError != null:
return registerError(_that.errorMessage);case UserRegisterSuccess() when userRegisterSuccess != null:
return userRegisterSuccess(_that.response);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  registerLoading,required TResult Function( String errorMessage)  registerError,required TResult Function( UserRegisterModel response)  userRegisterSuccess,}) {final _that = this;
switch (_that) {
case RegisterInitial():
return initial();case RegisterLoading():
return registerLoading();case RegisterError():
return registerError(_that.errorMessage);case UserRegisterSuccess():
return userRegisterSuccess(_that.response);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  registerLoading,TResult? Function( String errorMessage)?  registerError,TResult? Function( UserRegisterModel response)?  userRegisterSuccess,}) {final _that = this;
switch (_that) {
case RegisterInitial() when initial != null:
return initial();case RegisterLoading() when registerLoading != null:
return registerLoading();case RegisterError() when registerError != null:
return registerError(_that.errorMessage);case UserRegisterSuccess() when userRegisterSuccess != null:
return userRegisterSuccess(_that.response);case _:
  return null;

}
}

}

/// @nodoc


class RegisterInitial implements RegisterState {
  const RegisterInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RegisterInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'RegisterState.initial()';
}


}




/// @nodoc


class RegisterLoading implements RegisterState {
  const RegisterLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RegisterLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'RegisterState.registerLoading()';
}


}




/// @nodoc


class RegisterError implements RegisterState {
  const RegisterError(this.errorMessage);
  

 final  String errorMessage;

/// Create a copy of RegisterState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RegisterErrorCopyWith<RegisterError> get copyWith => _$RegisterErrorCopyWithImpl<RegisterError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RegisterError&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,errorMessage);

@override
String toString() {
  return 'RegisterState.registerError(errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $RegisterErrorCopyWith<$Res> implements $RegisterStateCopyWith<$Res> {
  factory $RegisterErrorCopyWith(RegisterError value, $Res Function(RegisterError) _then) = _$RegisterErrorCopyWithImpl;
@useResult
$Res call({
 String errorMessage
});




}
/// @nodoc
class _$RegisterErrorCopyWithImpl<$Res>
    implements $RegisterErrorCopyWith<$Res> {
  _$RegisterErrorCopyWithImpl(this._self, this._then);

  final RegisterError _self;
  final $Res Function(RegisterError) _then;

/// Create a copy of RegisterState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? errorMessage = null,}) {
  return _then(RegisterError(
null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class UserRegisterSuccess implements RegisterState {
  const UserRegisterSuccess(this.response);
  

 final  UserRegisterModel response;

/// Create a copy of RegisterState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserRegisterSuccessCopyWith<UserRegisterSuccess> get copyWith => _$UserRegisterSuccessCopyWithImpl<UserRegisterSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserRegisterSuccess&&(identical(other.response, response) || other.response == response));
}


@override
int get hashCode => Object.hash(runtimeType,response);

@override
String toString() {
  return 'RegisterState.userRegisterSuccess(response: $response)';
}


}

/// @nodoc
abstract mixin class $UserRegisterSuccessCopyWith<$Res> implements $RegisterStateCopyWith<$Res> {
  factory $UserRegisterSuccessCopyWith(UserRegisterSuccess value, $Res Function(UserRegisterSuccess) _then) = _$UserRegisterSuccessCopyWithImpl;
@useResult
$Res call({
 UserRegisterModel response
});




}
/// @nodoc
class _$UserRegisterSuccessCopyWithImpl<$Res>
    implements $UserRegisterSuccessCopyWith<$Res> {
  _$UserRegisterSuccessCopyWithImpl(this._self, this._then);

  final UserRegisterSuccess _self;
  final $Res Function(UserRegisterSuccess) _then;

/// Create a copy of RegisterState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? response = null,}) {
  return _then(UserRegisterSuccess(
null == response ? _self.response : response // ignore: cast_nullable_to_non_nullable
as UserRegisterModel,
  ));
}


}

// dart format on
