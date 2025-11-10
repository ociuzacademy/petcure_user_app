// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'edit_user_profile_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$EditUserProfileEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EditUserProfileEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'EditUserProfileEvent()';
}


}

/// @nodoc
class $EditUserProfileEventCopyWith<$Res>  {
$EditUserProfileEventCopyWith(EditUserProfileEvent _, $Res Function(EditUserProfileEvent) __);
}


/// Adds pattern-matching-related methods to [EditUserProfileEvent].
extension EditUserProfileEventPatterns on EditUserProfileEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Started value)?  started,TResult Function( _UpdatingUserProfile value)?  updatingUserProfile,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _UpdatingUserProfile() when updatingUserProfile != null:
return updatingUserProfile(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Started value)  started,required TResult Function( _UpdatingUserProfile value)  updatingUserProfile,}){
final _that = this;
switch (_that) {
case _Started():
return started(_that);case _UpdatingUserProfile():
return updatingUserProfile(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Started value)?  started,TResult? Function( _UpdatingUserProfile value)?  updatingUserProfile,}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _UpdatingUserProfile() when updatingUserProfile != null:
return updatingUserProfile(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  started,TResult Function( EditProfileData updatedUserProfileData)?  updatingUserProfile,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _UpdatingUserProfile() when updatingUserProfile != null:
return updatingUserProfile(_that.updatedUserProfileData);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  started,required TResult Function( EditProfileData updatedUserProfileData)  updatingUserProfile,}) {final _that = this;
switch (_that) {
case _Started():
return started();case _UpdatingUserProfile():
return updatingUserProfile(_that.updatedUserProfileData);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  started,TResult? Function( EditProfileData updatedUserProfileData)?  updatingUserProfile,}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _UpdatingUserProfile() when updatingUserProfile != null:
return updatingUserProfile(_that.updatedUserProfileData);case _:
  return null;

}
}

}

/// @nodoc


class _Started implements EditUserProfileEvent {
  const _Started();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Started);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'EditUserProfileEvent.started()';
}


}




/// @nodoc


class _UpdatingUserProfile implements EditUserProfileEvent {
  const _UpdatingUserProfile(this.updatedUserProfileData);
  

 final  EditProfileData updatedUserProfileData;

/// Create a copy of EditUserProfileEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdatingUserProfileCopyWith<_UpdatingUserProfile> get copyWith => __$UpdatingUserProfileCopyWithImpl<_UpdatingUserProfile>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdatingUserProfile&&(identical(other.updatedUserProfileData, updatedUserProfileData) || other.updatedUserProfileData == updatedUserProfileData));
}


@override
int get hashCode => Object.hash(runtimeType,updatedUserProfileData);

@override
String toString() {
  return 'EditUserProfileEvent.updatingUserProfile(updatedUserProfileData: $updatedUserProfileData)';
}


}

/// @nodoc
abstract mixin class _$UpdatingUserProfileCopyWith<$Res> implements $EditUserProfileEventCopyWith<$Res> {
  factory _$UpdatingUserProfileCopyWith(_UpdatingUserProfile value, $Res Function(_UpdatingUserProfile) _then) = __$UpdatingUserProfileCopyWithImpl;
@useResult
$Res call({
 EditProfileData updatedUserProfileData
});




}
/// @nodoc
class __$UpdatingUserProfileCopyWithImpl<$Res>
    implements _$UpdatingUserProfileCopyWith<$Res> {
  __$UpdatingUserProfileCopyWithImpl(this._self, this._then);

  final _UpdatingUserProfile _self;
  final $Res Function(_UpdatingUserProfile) _then;

/// Create a copy of EditUserProfileEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? updatedUserProfileData = null,}) {
  return _then(_UpdatingUserProfile(
null == updatedUserProfileData ? _self.updatedUserProfileData : updatedUserProfileData // ignore: cast_nullable_to_non_nullable
as EditProfileData,
  ));
}


}

/// @nodoc
mixin _$EditUserProfileState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EditUserProfileState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'EditUserProfileState()';
}


}

/// @nodoc
class $EditUserProfileStateCopyWith<$Res>  {
$EditUserProfileStateCopyWith(EditUserProfileState _, $Res Function(EditUserProfileState) __);
}


/// Adds pattern-matching-related methods to [EditUserProfileState].
extension EditUserProfileStatePatterns on EditUserProfileState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( EditUserProfileInitial value)?  initial,TResult Function( EditUserProfileLoading value)?  editUserProfileLoading,TResult Function( EditUserProfileError value)?  editUserProfileError,TResult Function( UpdateUserProfileSuccess value)?  updateUserProfileSuccess,required TResult orElse(),}){
final _that = this;
switch (_that) {
case EditUserProfileInitial() when initial != null:
return initial(_that);case EditUserProfileLoading() when editUserProfileLoading != null:
return editUserProfileLoading(_that);case EditUserProfileError() when editUserProfileError != null:
return editUserProfileError(_that);case UpdateUserProfileSuccess() when updateUserProfileSuccess != null:
return updateUserProfileSuccess(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( EditUserProfileInitial value)  initial,required TResult Function( EditUserProfileLoading value)  editUserProfileLoading,required TResult Function( EditUserProfileError value)  editUserProfileError,required TResult Function( UpdateUserProfileSuccess value)  updateUserProfileSuccess,}){
final _that = this;
switch (_that) {
case EditUserProfileInitial():
return initial(_that);case EditUserProfileLoading():
return editUserProfileLoading(_that);case EditUserProfileError():
return editUserProfileError(_that);case UpdateUserProfileSuccess():
return updateUserProfileSuccess(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( EditUserProfileInitial value)?  initial,TResult? Function( EditUserProfileLoading value)?  editUserProfileLoading,TResult? Function( EditUserProfileError value)?  editUserProfileError,TResult? Function( UpdateUserProfileSuccess value)?  updateUserProfileSuccess,}){
final _that = this;
switch (_that) {
case EditUserProfileInitial() when initial != null:
return initial(_that);case EditUserProfileLoading() when editUserProfileLoading != null:
return editUserProfileLoading(_that);case EditUserProfileError() when editUserProfileError != null:
return editUserProfileError(_that);case UpdateUserProfileSuccess() when updateUserProfileSuccess != null:
return updateUserProfileSuccess(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  editUserProfileLoading,TResult Function( String errorMessage)?  editUserProfileError,TResult Function( UpdateUserProfileResponseModel response)?  updateUserProfileSuccess,required TResult orElse(),}) {final _that = this;
switch (_that) {
case EditUserProfileInitial() when initial != null:
return initial();case EditUserProfileLoading() when editUserProfileLoading != null:
return editUserProfileLoading();case EditUserProfileError() when editUserProfileError != null:
return editUserProfileError(_that.errorMessage);case UpdateUserProfileSuccess() when updateUserProfileSuccess != null:
return updateUserProfileSuccess(_that.response);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  editUserProfileLoading,required TResult Function( String errorMessage)  editUserProfileError,required TResult Function( UpdateUserProfileResponseModel response)  updateUserProfileSuccess,}) {final _that = this;
switch (_that) {
case EditUserProfileInitial():
return initial();case EditUserProfileLoading():
return editUserProfileLoading();case EditUserProfileError():
return editUserProfileError(_that.errorMessage);case UpdateUserProfileSuccess():
return updateUserProfileSuccess(_that.response);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  editUserProfileLoading,TResult? Function( String errorMessage)?  editUserProfileError,TResult? Function( UpdateUserProfileResponseModel response)?  updateUserProfileSuccess,}) {final _that = this;
switch (_that) {
case EditUserProfileInitial() when initial != null:
return initial();case EditUserProfileLoading() when editUserProfileLoading != null:
return editUserProfileLoading();case EditUserProfileError() when editUserProfileError != null:
return editUserProfileError(_that.errorMessage);case UpdateUserProfileSuccess() when updateUserProfileSuccess != null:
return updateUserProfileSuccess(_that.response);case _:
  return null;

}
}

}

/// @nodoc


class EditUserProfileInitial implements EditUserProfileState {
  const EditUserProfileInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EditUserProfileInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'EditUserProfileState.initial()';
}


}




/// @nodoc


class EditUserProfileLoading implements EditUserProfileState {
  const EditUserProfileLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EditUserProfileLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'EditUserProfileState.editUserProfileLoading()';
}


}




/// @nodoc


class EditUserProfileError implements EditUserProfileState {
  const EditUserProfileError(this.errorMessage);
  

 final  String errorMessage;

/// Create a copy of EditUserProfileState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EditUserProfileErrorCopyWith<EditUserProfileError> get copyWith => _$EditUserProfileErrorCopyWithImpl<EditUserProfileError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EditUserProfileError&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,errorMessage);

@override
String toString() {
  return 'EditUserProfileState.editUserProfileError(errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $EditUserProfileErrorCopyWith<$Res> implements $EditUserProfileStateCopyWith<$Res> {
  factory $EditUserProfileErrorCopyWith(EditUserProfileError value, $Res Function(EditUserProfileError) _then) = _$EditUserProfileErrorCopyWithImpl;
@useResult
$Res call({
 String errorMessage
});




}
/// @nodoc
class _$EditUserProfileErrorCopyWithImpl<$Res>
    implements $EditUserProfileErrorCopyWith<$Res> {
  _$EditUserProfileErrorCopyWithImpl(this._self, this._then);

  final EditUserProfileError _self;
  final $Res Function(EditUserProfileError) _then;

/// Create a copy of EditUserProfileState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? errorMessage = null,}) {
  return _then(EditUserProfileError(
null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class UpdateUserProfileSuccess implements EditUserProfileState {
  const UpdateUserProfileSuccess(this.response);
  

 final  UpdateUserProfileResponseModel response;

/// Create a copy of EditUserProfileState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateUserProfileSuccessCopyWith<UpdateUserProfileSuccess> get copyWith => _$UpdateUserProfileSuccessCopyWithImpl<UpdateUserProfileSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateUserProfileSuccess&&(identical(other.response, response) || other.response == response));
}


@override
int get hashCode => Object.hash(runtimeType,response);

@override
String toString() {
  return 'EditUserProfileState.updateUserProfileSuccess(response: $response)';
}


}

/// @nodoc
abstract mixin class $UpdateUserProfileSuccessCopyWith<$Res> implements $EditUserProfileStateCopyWith<$Res> {
  factory $UpdateUserProfileSuccessCopyWith(UpdateUserProfileSuccess value, $Res Function(UpdateUserProfileSuccess) _then) = _$UpdateUserProfileSuccessCopyWithImpl;
@useResult
$Res call({
 UpdateUserProfileResponseModel response
});




}
/// @nodoc
class _$UpdateUserProfileSuccessCopyWithImpl<$Res>
    implements $UpdateUserProfileSuccessCopyWith<$Res> {
  _$UpdateUserProfileSuccessCopyWithImpl(this._self, this._then);

  final UpdateUserProfileSuccess _self;
  final $Res Function(UpdateUserProfileSuccess) _then;

/// Create a copy of EditUserProfileState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? response = null,}) {
  return _then(UpdateUserProfileSuccess(
null == response ? _self.response : response // ignore: cast_nullable_to_non_nullable
as UpdateUserProfileResponseModel,
  ));
}


}

// dart format on
