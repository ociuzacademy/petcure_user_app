// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pet_operations_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PetOperationsEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PetOperationsEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PetOperationsEvent()';
}


}

/// @nodoc
class $PetOperationsEventCopyWith<$Res>  {
$PetOperationsEventCopyWith(PetOperationsEvent _, $Res Function(PetOperationsEvent) __);
}


/// Adds pattern-matching-related methods to [PetOperationsEvent].
extension PetOperationsEventPatterns on PetOperationsEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Started value)?  started,TResult Function( _AddingPet value)?  addingPet,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _AddingPet() when addingPet != null:
return addingPet(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Started value)  started,required TResult Function( _AddingPet value)  addingPet,}){
final _that = this;
switch (_that) {
case _Started():
return started(_that);case _AddingPet():
return addingPet(_that);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Started value)?  started,TResult? Function( _AddingPet value)?  addingPet,}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _AddingPet() when addingPet != null:
return addingPet(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  started,TResult Function( AddPetDetails petDetails,  String? userId)?  addingPet,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _AddingPet() when addingPet != null:
return addingPet(_that.petDetails,_that.userId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  started,required TResult Function( AddPetDetails petDetails,  String? userId)  addingPet,}) {final _that = this;
switch (_that) {
case _Started():
return started();case _AddingPet():
return addingPet(_that.petDetails,_that.userId);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  started,TResult? Function( AddPetDetails petDetails,  String? userId)?  addingPet,}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _AddingPet() when addingPet != null:
return addingPet(_that.petDetails,_that.userId);case _:
  return null;

}
}

}

/// @nodoc


class _Started implements PetOperationsEvent {
  const _Started();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Started);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PetOperationsEvent.started()';
}


}




/// @nodoc


class _AddingPet implements PetOperationsEvent {
  const _AddingPet({required this.petDetails, this.userId});
  

 final  AddPetDetails petDetails;
 final  String? userId;

/// Create a copy of PetOperationsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AddingPetCopyWith<_AddingPet> get copyWith => __$AddingPetCopyWithImpl<_AddingPet>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AddingPet&&(identical(other.petDetails, petDetails) || other.petDetails == petDetails)&&(identical(other.userId, userId) || other.userId == userId));
}


@override
int get hashCode => Object.hash(runtimeType,petDetails,userId);

@override
String toString() {
  return 'PetOperationsEvent.addingPet(petDetails: $petDetails, userId: $userId)';
}


}

/// @nodoc
abstract mixin class _$AddingPetCopyWith<$Res> implements $PetOperationsEventCopyWith<$Res> {
  factory _$AddingPetCopyWith(_AddingPet value, $Res Function(_AddingPet) _then) = __$AddingPetCopyWithImpl;
@useResult
$Res call({
 AddPetDetails petDetails, String? userId
});




}
/// @nodoc
class __$AddingPetCopyWithImpl<$Res>
    implements _$AddingPetCopyWith<$Res> {
  __$AddingPetCopyWithImpl(this._self, this._then);

  final _AddingPet _self;
  final $Res Function(_AddingPet) _then;

/// Create a copy of PetOperationsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? petDetails = null,Object? userId = freezed,}) {
  return _then(_AddingPet(
petDetails: null == petDetails ? _self.petDetails : petDetails // ignore: cast_nullable_to_non_nullable
as AddPetDetails,userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc
mixin _$PetOperationsState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PetOperationsState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PetOperationsState()';
}


}

/// @nodoc
class $PetOperationsStateCopyWith<$Res>  {
$PetOperationsStateCopyWith(PetOperationsState _, $Res Function(PetOperationsState) __);
}


/// Adds pattern-matching-related methods to [PetOperationsState].
extension PetOperationsStatePatterns on PetOperationsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( PetOperationsInitial value)?  initial,TResult Function( PetOperationsLoading value)?  petOperationsLoading,TResult Function( PetOperationsError value)?  petOperationsError,TResult Function( AddPetSuccess value)?  addPetSuccess,required TResult orElse(),}){
final _that = this;
switch (_that) {
case PetOperationsInitial() when initial != null:
return initial(_that);case PetOperationsLoading() when petOperationsLoading != null:
return petOperationsLoading(_that);case PetOperationsError() when petOperationsError != null:
return petOperationsError(_that);case AddPetSuccess() when addPetSuccess != null:
return addPetSuccess(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( PetOperationsInitial value)  initial,required TResult Function( PetOperationsLoading value)  petOperationsLoading,required TResult Function( PetOperationsError value)  petOperationsError,required TResult Function( AddPetSuccess value)  addPetSuccess,}){
final _that = this;
switch (_that) {
case PetOperationsInitial():
return initial(_that);case PetOperationsLoading():
return petOperationsLoading(_that);case PetOperationsError():
return petOperationsError(_that);case AddPetSuccess():
return addPetSuccess(_that);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( PetOperationsInitial value)?  initial,TResult? Function( PetOperationsLoading value)?  petOperationsLoading,TResult? Function( PetOperationsError value)?  petOperationsError,TResult? Function( AddPetSuccess value)?  addPetSuccess,}){
final _that = this;
switch (_that) {
case PetOperationsInitial() when initial != null:
return initial(_that);case PetOperationsLoading() when petOperationsLoading != null:
return petOperationsLoading(_that);case PetOperationsError() when petOperationsError != null:
return petOperationsError(_that);case AddPetSuccess() when addPetSuccess != null:
return addPetSuccess(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function( String message)?  petOperationsLoading,TResult Function( String errorMessage)?  petOperationsError,TResult Function( AddPetResponseModel response)?  addPetSuccess,required TResult orElse(),}) {final _that = this;
switch (_that) {
case PetOperationsInitial() when initial != null:
return initial();case PetOperationsLoading() when petOperationsLoading != null:
return petOperationsLoading(_that.message);case PetOperationsError() when petOperationsError != null:
return petOperationsError(_that.errorMessage);case AddPetSuccess() when addPetSuccess != null:
return addPetSuccess(_that.response);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function( String message)  petOperationsLoading,required TResult Function( String errorMessage)  petOperationsError,required TResult Function( AddPetResponseModel response)  addPetSuccess,}) {final _that = this;
switch (_that) {
case PetOperationsInitial():
return initial();case PetOperationsLoading():
return petOperationsLoading(_that.message);case PetOperationsError():
return petOperationsError(_that.errorMessage);case AddPetSuccess():
return addPetSuccess(_that.response);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function( String message)?  petOperationsLoading,TResult? Function( String errorMessage)?  petOperationsError,TResult? Function( AddPetResponseModel response)?  addPetSuccess,}) {final _that = this;
switch (_that) {
case PetOperationsInitial() when initial != null:
return initial();case PetOperationsLoading() when petOperationsLoading != null:
return petOperationsLoading(_that.message);case PetOperationsError() when petOperationsError != null:
return petOperationsError(_that.errorMessage);case AddPetSuccess() when addPetSuccess != null:
return addPetSuccess(_that.response);case _:
  return null;

}
}

}

/// @nodoc


class PetOperationsInitial implements PetOperationsState {
  const PetOperationsInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PetOperationsInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PetOperationsState.initial()';
}


}




/// @nodoc


class PetOperationsLoading implements PetOperationsState {
  const PetOperationsLoading(this.message);
  

 final  String message;

/// Create a copy of PetOperationsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PetOperationsLoadingCopyWith<PetOperationsLoading> get copyWith => _$PetOperationsLoadingCopyWithImpl<PetOperationsLoading>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PetOperationsLoading&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'PetOperationsState.petOperationsLoading(message: $message)';
}


}

/// @nodoc
abstract mixin class $PetOperationsLoadingCopyWith<$Res> implements $PetOperationsStateCopyWith<$Res> {
  factory $PetOperationsLoadingCopyWith(PetOperationsLoading value, $Res Function(PetOperationsLoading) _then) = _$PetOperationsLoadingCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$PetOperationsLoadingCopyWithImpl<$Res>
    implements $PetOperationsLoadingCopyWith<$Res> {
  _$PetOperationsLoadingCopyWithImpl(this._self, this._then);

  final PetOperationsLoading _self;
  final $Res Function(PetOperationsLoading) _then;

/// Create a copy of PetOperationsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(PetOperationsLoading(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class PetOperationsError implements PetOperationsState {
  const PetOperationsError(this.errorMessage);
  

 final  String errorMessage;

/// Create a copy of PetOperationsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PetOperationsErrorCopyWith<PetOperationsError> get copyWith => _$PetOperationsErrorCopyWithImpl<PetOperationsError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PetOperationsError&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,errorMessage);

@override
String toString() {
  return 'PetOperationsState.petOperationsError(errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $PetOperationsErrorCopyWith<$Res> implements $PetOperationsStateCopyWith<$Res> {
  factory $PetOperationsErrorCopyWith(PetOperationsError value, $Res Function(PetOperationsError) _then) = _$PetOperationsErrorCopyWithImpl;
@useResult
$Res call({
 String errorMessage
});




}
/// @nodoc
class _$PetOperationsErrorCopyWithImpl<$Res>
    implements $PetOperationsErrorCopyWith<$Res> {
  _$PetOperationsErrorCopyWithImpl(this._self, this._then);

  final PetOperationsError _self;
  final $Res Function(PetOperationsError) _then;

/// Create a copy of PetOperationsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? errorMessage = null,}) {
  return _then(PetOperationsError(
null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class AddPetSuccess implements PetOperationsState {
  const AddPetSuccess(this.response);
  

 final  AddPetResponseModel response;

/// Create a copy of PetOperationsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AddPetSuccessCopyWith<AddPetSuccess> get copyWith => _$AddPetSuccessCopyWithImpl<AddPetSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AddPetSuccess&&(identical(other.response, response) || other.response == response));
}


@override
int get hashCode => Object.hash(runtimeType,response);

@override
String toString() {
  return 'PetOperationsState.addPetSuccess(response: $response)';
}


}

/// @nodoc
abstract mixin class $AddPetSuccessCopyWith<$Res> implements $PetOperationsStateCopyWith<$Res> {
  factory $AddPetSuccessCopyWith(AddPetSuccess value, $Res Function(AddPetSuccess) _then) = _$AddPetSuccessCopyWithImpl;
@useResult
$Res call({
 AddPetResponseModel response
});




}
/// @nodoc
class _$AddPetSuccessCopyWithImpl<$Res>
    implements $AddPetSuccessCopyWith<$Res> {
  _$AddPetSuccessCopyWithImpl(this._self, this._then);

  final AddPetSuccess _self;
  final $Res Function(AddPetSuccess) _then;

/// Create a copy of PetOperationsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? response = null,}) {
  return _then(AddPetSuccess(
null == response ? _self.response : response // ignore: cast_nullable_to_non_nullable
as AddPetResponseModel,
  ));
}


}

// dart format on
