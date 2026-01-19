// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'delete_pet_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DeletePetEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeletePetEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DeletePetEvent()';
}


}

/// @nodoc
class $DeletePetEventCopyWith<$Res>  {
$DeletePetEventCopyWith(DeletePetEvent _, $Res Function(DeletePetEvent) __);
}


/// Adds pattern-matching-related methods to [DeletePetEvent].
extension DeletePetEventPatterns on DeletePetEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Started value)?  started,TResult Function( _DeletePet value)?  deletePet,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _DeletePet() when deletePet != null:
return deletePet(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Started value)  started,required TResult Function( _DeletePet value)  deletePet,}){
final _that = this;
switch (_that) {
case _Started():
return started(_that);case _DeletePet():
return deletePet(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Started value)?  started,TResult? Function( _DeletePet value)?  deletePet,}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _DeletePet() when deletePet != null:
return deletePet(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  started,TResult Function( int petId)?  deletePet,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _DeletePet() when deletePet != null:
return deletePet(_that.petId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  started,required TResult Function( int petId)  deletePet,}) {final _that = this;
switch (_that) {
case _Started():
return started();case _DeletePet():
return deletePet(_that.petId);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  started,TResult? Function( int petId)?  deletePet,}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _DeletePet() when deletePet != null:
return deletePet(_that.petId);case _:
  return null;

}
}

}

/// @nodoc


class _Started implements DeletePetEvent {
  const _Started();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Started);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DeletePetEvent.started()';
}


}




/// @nodoc


class _DeletePet implements DeletePetEvent {
  const _DeletePet({required this.petId});
  

 final  int petId;

/// Create a copy of DeletePetEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DeletePetCopyWith<_DeletePet> get copyWith => __$DeletePetCopyWithImpl<_DeletePet>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DeletePet&&(identical(other.petId, petId) || other.petId == petId));
}


@override
int get hashCode => Object.hash(runtimeType,petId);

@override
String toString() {
  return 'DeletePetEvent.deletePet(petId: $petId)';
}


}

/// @nodoc
abstract mixin class _$DeletePetCopyWith<$Res> implements $DeletePetEventCopyWith<$Res> {
  factory _$DeletePetCopyWith(_DeletePet value, $Res Function(_DeletePet) _then) = __$DeletePetCopyWithImpl;
@useResult
$Res call({
 int petId
});




}
/// @nodoc
class __$DeletePetCopyWithImpl<$Res>
    implements _$DeletePetCopyWith<$Res> {
  __$DeletePetCopyWithImpl(this._self, this._then);

  final _DeletePet _self;
  final $Res Function(_DeletePet) _then;

/// Create a copy of DeletePetEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? petId = null,}) {
  return _then(_DeletePet(
petId: null == petId ? _self.petId : petId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
mixin _$DeletePetState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeletePetState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DeletePetState()';
}


}

/// @nodoc
class $DeletePetStateCopyWith<$Res>  {
$DeletePetStateCopyWith(DeletePetState _, $Res Function(DeletePetState) __);
}


/// Adds pattern-matching-related methods to [DeletePetState].
extension DeletePetStatePatterns on DeletePetState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( DeletePetInitial value)?  initial,TResult Function( DeletePetLoading value)?  loading,TResult Function( DeletePetSuccess value)?  success,TResult Function( DeletePetError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case DeletePetInitial() when initial != null:
return initial(_that);case DeletePetLoading() when loading != null:
return loading(_that);case DeletePetSuccess() when success != null:
return success(_that);case DeletePetError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( DeletePetInitial value)  initial,required TResult Function( DeletePetLoading value)  loading,required TResult Function( DeletePetSuccess value)  success,required TResult Function( DeletePetError value)  error,}){
final _that = this;
switch (_that) {
case DeletePetInitial():
return initial(_that);case DeletePetLoading():
return loading(_that);case DeletePetSuccess():
return success(_that);case DeletePetError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( DeletePetInitial value)?  initial,TResult? Function( DeletePetLoading value)?  loading,TResult? Function( DeletePetSuccess value)?  success,TResult? Function( DeletePetError value)?  error,}){
final _that = this;
switch (_that) {
case DeletePetInitial() when initial != null:
return initial(_that);case DeletePetLoading() when loading != null:
return loading(_that);case DeletePetSuccess() when success != null:
return success(_that);case DeletePetError() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( PetDeleteResponseModel response)?  success,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case DeletePetInitial() when initial != null:
return initial();case DeletePetLoading() when loading != null:
return loading();case DeletePetSuccess() when success != null:
return success(_that.response);case DeletePetError() when error != null:
return error(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( PetDeleteResponseModel response)  success,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case DeletePetInitial():
return initial();case DeletePetLoading():
return loading();case DeletePetSuccess():
return success(_that.response);case DeletePetError():
return error(_that.message);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( PetDeleteResponseModel response)?  success,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case DeletePetInitial() when initial != null:
return initial();case DeletePetLoading() when loading != null:
return loading();case DeletePetSuccess() when success != null:
return success(_that.response);case DeletePetError() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class DeletePetInitial implements DeletePetState {
  const DeletePetInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeletePetInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DeletePetState.initial()';
}


}




/// @nodoc


class DeletePetLoading implements DeletePetState {
  const DeletePetLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeletePetLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DeletePetState.loading()';
}


}




/// @nodoc


class DeletePetSuccess implements DeletePetState {
  const DeletePetSuccess(this.response);
  

 final  PetDeleteResponseModel response;

/// Create a copy of DeletePetState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeletePetSuccessCopyWith<DeletePetSuccess> get copyWith => _$DeletePetSuccessCopyWithImpl<DeletePetSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeletePetSuccess&&(identical(other.response, response) || other.response == response));
}


@override
int get hashCode => Object.hash(runtimeType,response);

@override
String toString() {
  return 'DeletePetState.success(response: $response)';
}


}

/// @nodoc
abstract mixin class $DeletePetSuccessCopyWith<$Res> implements $DeletePetStateCopyWith<$Res> {
  factory $DeletePetSuccessCopyWith(DeletePetSuccess value, $Res Function(DeletePetSuccess) _then) = _$DeletePetSuccessCopyWithImpl;
@useResult
$Res call({
 PetDeleteResponseModel response
});




}
/// @nodoc
class _$DeletePetSuccessCopyWithImpl<$Res>
    implements $DeletePetSuccessCopyWith<$Res> {
  _$DeletePetSuccessCopyWithImpl(this._self, this._then);

  final DeletePetSuccess _self;
  final $Res Function(DeletePetSuccess) _then;

/// Create a copy of DeletePetState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? response = null,}) {
  return _then(DeletePetSuccess(
null == response ? _self.response : response // ignore: cast_nullable_to_non_nullable
as PetDeleteResponseModel,
  ));
}


}

/// @nodoc


class DeletePetError implements DeletePetState {
  const DeletePetError(this.message);
  

 final  String message;

/// Create a copy of DeletePetState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeletePetErrorCopyWith<DeletePetError> get copyWith => _$DeletePetErrorCopyWithImpl<DeletePetError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeletePetError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'DeletePetState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $DeletePetErrorCopyWith<$Res> implements $DeletePetStateCopyWith<$Res> {
  factory $DeletePetErrorCopyWith(DeletePetError value, $Res Function(DeletePetError) _then) = _$DeletePetErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$DeletePetErrorCopyWithImpl<$Res>
    implements $DeletePetErrorCopyWith<$Res> {
  _$DeletePetErrorCopyWithImpl(this._self, this._then);

  final DeletePetError _self;
  final $Res Function(DeletePetError) _then;

/// Create a copy of DeletePetState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(DeletePetError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
