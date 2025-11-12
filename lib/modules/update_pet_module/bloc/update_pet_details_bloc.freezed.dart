// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'update_pet_details_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$UpdatePetDetailsEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdatePetDetailsEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'UpdatePetDetailsEvent()';
}


}

/// @nodoc
class $UpdatePetDetailsEventCopyWith<$Res>  {
$UpdatePetDetailsEventCopyWith(UpdatePetDetailsEvent _, $Res Function(UpdatePetDetailsEvent) __);
}


/// Adds pattern-matching-related methods to [UpdatePetDetailsEvent].
extension UpdatePetDetailsEventPatterns on UpdatePetDetailsEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Started value)?  started,TResult Function( _UpdatingPetDetails value)?  updatingPetDetails,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _UpdatingPetDetails() when updatingPetDetails != null:
return updatingPetDetails(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Started value)  started,required TResult Function( _UpdatingPetDetails value)  updatingPetDetails,}){
final _that = this;
switch (_that) {
case _Started():
return started(_that);case _UpdatingPetDetails():
return updatingPetDetails(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Started value)?  started,TResult? Function( _UpdatingPetDetails value)?  updatingPetDetails,}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _UpdatingPetDetails() when updatingPetDetails != null:
return updatingPetDetails(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  started,TResult Function( int petId,  UpdatePetDetails petDetails)?  updatingPetDetails,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _UpdatingPetDetails() when updatingPetDetails != null:
return updatingPetDetails(_that.petId,_that.petDetails);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  started,required TResult Function( int petId,  UpdatePetDetails petDetails)  updatingPetDetails,}) {final _that = this;
switch (_that) {
case _Started():
return started();case _UpdatingPetDetails():
return updatingPetDetails(_that.petId,_that.petDetails);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  started,TResult? Function( int petId,  UpdatePetDetails petDetails)?  updatingPetDetails,}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _UpdatingPetDetails() when updatingPetDetails != null:
return updatingPetDetails(_that.petId,_that.petDetails);case _:
  return null;

}
}

}

/// @nodoc


class _Started implements UpdatePetDetailsEvent {
  const _Started();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Started);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'UpdatePetDetailsEvent.started()';
}


}




/// @nodoc


class _UpdatingPetDetails implements UpdatePetDetailsEvent {
  const _UpdatingPetDetails(this.petId, this.petDetails);
  

 final  int petId;
 final  UpdatePetDetails petDetails;

/// Create a copy of UpdatePetDetailsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdatingPetDetailsCopyWith<_UpdatingPetDetails> get copyWith => __$UpdatingPetDetailsCopyWithImpl<_UpdatingPetDetails>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdatingPetDetails&&(identical(other.petId, petId) || other.petId == petId)&&(identical(other.petDetails, petDetails) || other.petDetails == petDetails));
}


@override
int get hashCode => Object.hash(runtimeType,petId,petDetails);

@override
String toString() {
  return 'UpdatePetDetailsEvent.updatingPetDetails(petId: $petId, petDetails: $petDetails)';
}


}

/// @nodoc
abstract mixin class _$UpdatingPetDetailsCopyWith<$Res> implements $UpdatePetDetailsEventCopyWith<$Res> {
  factory _$UpdatingPetDetailsCopyWith(_UpdatingPetDetails value, $Res Function(_UpdatingPetDetails) _then) = __$UpdatingPetDetailsCopyWithImpl;
@useResult
$Res call({
 int petId, UpdatePetDetails petDetails
});




}
/// @nodoc
class __$UpdatingPetDetailsCopyWithImpl<$Res>
    implements _$UpdatingPetDetailsCopyWith<$Res> {
  __$UpdatingPetDetailsCopyWithImpl(this._self, this._then);

  final _UpdatingPetDetails _self;
  final $Res Function(_UpdatingPetDetails) _then;

/// Create a copy of UpdatePetDetailsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? petId = null,Object? petDetails = null,}) {
  return _then(_UpdatingPetDetails(
null == petId ? _self.petId : petId // ignore: cast_nullable_to_non_nullable
as int,null == petDetails ? _self.petDetails : petDetails // ignore: cast_nullable_to_non_nullable
as UpdatePetDetails,
  ));
}


}

/// @nodoc
mixin _$UpdatePetDetailsState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdatePetDetailsState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'UpdatePetDetailsState()';
}


}

/// @nodoc
class $UpdatePetDetailsStateCopyWith<$Res>  {
$UpdatePetDetailsStateCopyWith(UpdatePetDetailsState _, $Res Function(UpdatePetDetailsState) __);
}


/// Adds pattern-matching-related methods to [UpdatePetDetailsState].
extension UpdatePetDetailsStatePatterns on UpdatePetDetailsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( UpdatePetDetailsInitial value)?  initial,TResult Function( UpdatePetDetailsLoading value)?  updatePetDetailsLoading,TResult Function( UpdatePetDetailsError value)?  updatePetDetailsError,TResult Function( UpdatePetDetailsSuccess value)?  updatePetDetailsSuccess,required TResult orElse(),}){
final _that = this;
switch (_that) {
case UpdatePetDetailsInitial() when initial != null:
return initial(_that);case UpdatePetDetailsLoading() when updatePetDetailsLoading != null:
return updatePetDetailsLoading(_that);case UpdatePetDetailsError() when updatePetDetailsError != null:
return updatePetDetailsError(_that);case UpdatePetDetailsSuccess() when updatePetDetailsSuccess != null:
return updatePetDetailsSuccess(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( UpdatePetDetailsInitial value)  initial,required TResult Function( UpdatePetDetailsLoading value)  updatePetDetailsLoading,required TResult Function( UpdatePetDetailsError value)  updatePetDetailsError,required TResult Function( UpdatePetDetailsSuccess value)  updatePetDetailsSuccess,}){
final _that = this;
switch (_that) {
case UpdatePetDetailsInitial():
return initial(_that);case UpdatePetDetailsLoading():
return updatePetDetailsLoading(_that);case UpdatePetDetailsError():
return updatePetDetailsError(_that);case UpdatePetDetailsSuccess():
return updatePetDetailsSuccess(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( UpdatePetDetailsInitial value)?  initial,TResult? Function( UpdatePetDetailsLoading value)?  updatePetDetailsLoading,TResult? Function( UpdatePetDetailsError value)?  updatePetDetailsError,TResult? Function( UpdatePetDetailsSuccess value)?  updatePetDetailsSuccess,}){
final _that = this;
switch (_that) {
case UpdatePetDetailsInitial() when initial != null:
return initial(_that);case UpdatePetDetailsLoading() when updatePetDetailsLoading != null:
return updatePetDetailsLoading(_that);case UpdatePetDetailsError() when updatePetDetailsError != null:
return updatePetDetailsError(_that);case UpdatePetDetailsSuccess() when updatePetDetailsSuccess != null:
return updatePetDetailsSuccess(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  updatePetDetailsLoading,TResult Function( String errorMessage)?  updatePetDetailsError,TResult Function( PetUpdateResponseModel response)?  updatePetDetailsSuccess,required TResult orElse(),}) {final _that = this;
switch (_that) {
case UpdatePetDetailsInitial() when initial != null:
return initial();case UpdatePetDetailsLoading() when updatePetDetailsLoading != null:
return updatePetDetailsLoading();case UpdatePetDetailsError() when updatePetDetailsError != null:
return updatePetDetailsError(_that.errorMessage);case UpdatePetDetailsSuccess() when updatePetDetailsSuccess != null:
return updatePetDetailsSuccess(_that.response);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  updatePetDetailsLoading,required TResult Function( String errorMessage)  updatePetDetailsError,required TResult Function( PetUpdateResponseModel response)  updatePetDetailsSuccess,}) {final _that = this;
switch (_that) {
case UpdatePetDetailsInitial():
return initial();case UpdatePetDetailsLoading():
return updatePetDetailsLoading();case UpdatePetDetailsError():
return updatePetDetailsError(_that.errorMessage);case UpdatePetDetailsSuccess():
return updatePetDetailsSuccess(_that.response);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  updatePetDetailsLoading,TResult? Function( String errorMessage)?  updatePetDetailsError,TResult? Function( PetUpdateResponseModel response)?  updatePetDetailsSuccess,}) {final _that = this;
switch (_that) {
case UpdatePetDetailsInitial() when initial != null:
return initial();case UpdatePetDetailsLoading() when updatePetDetailsLoading != null:
return updatePetDetailsLoading();case UpdatePetDetailsError() when updatePetDetailsError != null:
return updatePetDetailsError(_that.errorMessage);case UpdatePetDetailsSuccess() when updatePetDetailsSuccess != null:
return updatePetDetailsSuccess(_that.response);case _:
  return null;

}
}

}

/// @nodoc


class UpdatePetDetailsInitial implements UpdatePetDetailsState {
  const UpdatePetDetailsInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdatePetDetailsInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'UpdatePetDetailsState.initial()';
}


}




/// @nodoc


class UpdatePetDetailsLoading implements UpdatePetDetailsState {
  const UpdatePetDetailsLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdatePetDetailsLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'UpdatePetDetailsState.updatePetDetailsLoading()';
}


}




/// @nodoc


class UpdatePetDetailsError implements UpdatePetDetailsState {
  const UpdatePetDetailsError(this.errorMessage);
  

 final  String errorMessage;

/// Create a copy of UpdatePetDetailsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdatePetDetailsErrorCopyWith<UpdatePetDetailsError> get copyWith => _$UpdatePetDetailsErrorCopyWithImpl<UpdatePetDetailsError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdatePetDetailsError&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,errorMessage);

@override
String toString() {
  return 'UpdatePetDetailsState.updatePetDetailsError(errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $UpdatePetDetailsErrorCopyWith<$Res> implements $UpdatePetDetailsStateCopyWith<$Res> {
  factory $UpdatePetDetailsErrorCopyWith(UpdatePetDetailsError value, $Res Function(UpdatePetDetailsError) _then) = _$UpdatePetDetailsErrorCopyWithImpl;
@useResult
$Res call({
 String errorMessage
});




}
/// @nodoc
class _$UpdatePetDetailsErrorCopyWithImpl<$Res>
    implements $UpdatePetDetailsErrorCopyWith<$Res> {
  _$UpdatePetDetailsErrorCopyWithImpl(this._self, this._then);

  final UpdatePetDetailsError _self;
  final $Res Function(UpdatePetDetailsError) _then;

/// Create a copy of UpdatePetDetailsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? errorMessage = null,}) {
  return _then(UpdatePetDetailsError(
null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class UpdatePetDetailsSuccess implements UpdatePetDetailsState {
  const UpdatePetDetailsSuccess(this.response);
  

 final  PetUpdateResponseModel response;

/// Create a copy of UpdatePetDetailsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdatePetDetailsSuccessCopyWith<UpdatePetDetailsSuccess> get copyWith => _$UpdatePetDetailsSuccessCopyWithImpl<UpdatePetDetailsSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdatePetDetailsSuccess&&(identical(other.response, response) || other.response == response));
}


@override
int get hashCode => Object.hash(runtimeType,response);

@override
String toString() {
  return 'UpdatePetDetailsState.updatePetDetailsSuccess(response: $response)';
}


}

/// @nodoc
abstract mixin class $UpdatePetDetailsSuccessCopyWith<$Res> implements $UpdatePetDetailsStateCopyWith<$Res> {
  factory $UpdatePetDetailsSuccessCopyWith(UpdatePetDetailsSuccess value, $Res Function(UpdatePetDetailsSuccess) _then) = _$UpdatePetDetailsSuccessCopyWithImpl;
@useResult
$Res call({
 PetUpdateResponseModel response
});




}
/// @nodoc
class _$UpdatePetDetailsSuccessCopyWithImpl<$Res>
    implements $UpdatePetDetailsSuccessCopyWith<$Res> {
  _$UpdatePetDetailsSuccessCopyWithImpl(this._self, this._then);

  final UpdatePetDetailsSuccess _self;
  final $Res Function(UpdatePetDetailsSuccess) _then;

/// Create a copy of UpdatePetDetailsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? response = null,}) {
  return _then(UpdatePetDetailsSuccess(
null == response ? _self.response : response // ignore: cast_nullable_to_non_nullable
as PetUpdateResponseModel,
  ));
}


}

// dart format on
