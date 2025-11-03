// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pet_details_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PetDetailsState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PetDetailsState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PetDetailsState()';
}


}

/// @nodoc
class $PetDetailsStateCopyWith<$Res>  {
$PetDetailsStateCopyWith(PetDetailsState _, $Res Function(PetDetailsState) __);
}


/// Adds pattern-matching-related methods to [PetDetailsState].
extension PetDetailsStatePatterns on PetDetailsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( PetDetailsInitial value)?  initial,TResult Function( PetDetailsLoading value)?  petDetailsLoading,TResult Function( PetDetailsError value)?  petDetailsError,TResult Function( PetDetailsSuccess value)?  petDetailsSuccess,required TResult orElse(),}){
final _that = this;
switch (_that) {
case PetDetailsInitial() when initial != null:
return initial(_that);case PetDetailsLoading() when petDetailsLoading != null:
return petDetailsLoading(_that);case PetDetailsError() when petDetailsError != null:
return petDetailsError(_that);case PetDetailsSuccess() when petDetailsSuccess != null:
return petDetailsSuccess(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( PetDetailsInitial value)  initial,required TResult Function( PetDetailsLoading value)  petDetailsLoading,required TResult Function( PetDetailsError value)  petDetailsError,required TResult Function( PetDetailsSuccess value)  petDetailsSuccess,}){
final _that = this;
switch (_that) {
case PetDetailsInitial():
return initial(_that);case PetDetailsLoading():
return petDetailsLoading(_that);case PetDetailsError():
return petDetailsError(_that);case PetDetailsSuccess():
return petDetailsSuccess(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( PetDetailsInitial value)?  initial,TResult? Function( PetDetailsLoading value)?  petDetailsLoading,TResult? Function( PetDetailsError value)?  petDetailsError,TResult? Function( PetDetailsSuccess value)?  petDetailsSuccess,}){
final _that = this;
switch (_that) {
case PetDetailsInitial() when initial != null:
return initial(_that);case PetDetailsLoading() when petDetailsLoading != null:
return petDetailsLoading(_that);case PetDetailsError() when petDetailsError != null:
return petDetailsError(_that);case PetDetailsSuccess() when petDetailsSuccess != null:
return petDetailsSuccess(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  petDetailsLoading,TResult Function( String errorMessage)?  petDetailsError,TResult Function( PetDetailsModel petDetails)?  petDetailsSuccess,required TResult orElse(),}) {final _that = this;
switch (_that) {
case PetDetailsInitial() when initial != null:
return initial();case PetDetailsLoading() when petDetailsLoading != null:
return petDetailsLoading();case PetDetailsError() when petDetailsError != null:
return petDetailsError(_that.errorMessage);case PetDetailsSuccess() when petDetailsSuccess != null:
return petDetailsSuccess(_that.petDetails);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  petDetailsLoading,required TResult Function( String errorMessage)  petDetailsError,required TResult Function( PetDetailsModel petDetails)  petDetailsSuccess,}) {final _that = this;
switch (_that) {
case PetDetailsInitial():
return initial();case PetDetailsLoading():
return petDetailsLoading();case PetDetailsError():
return petDetailsError(_that.errorMessage);case PetDetailsSuccess():
return petDetailsSuccess(_that.petDetails);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  petDetailsLoading,TResult? Function( String errorMessage)?  petDetailsError,TResult? Function( PetDetailsModel petDetails)?  petDetailsSuccess,}) {final _that = this;
switch (_that) {
case PetDetailsInitial() when initial != null:
return initial();case PetDetailsLoading() when petDetailsLoading != null:
return petDetailsLoading();case PetDetailsError() when petDetailsError != null:
return petDetailsError(_that.errorMessage);case PetDetailsSuccess() when petDetailsSuccess != null:
return petDetailsSuccess(_that.petDetails);case _:
  return null;

}
}

}

/// @nodoc


class PetDetailsInitial implements PetDetailsState {
  const PetDetailsInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PetDetailsInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PetDetailsState.initial()';
}


}




/// @nodoc


class PetDetailsLoading implements PetDetailsState {
  const PetDetailsLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PetDetailsLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PetDetailsState.petDetailsLoading()';
}


}




/// @nodoc


class PetDetailsError implements PetDetailsState {
  const PetDetailsError(this.errorMessage);
  

 final  String errorMessage;

/// Create a copy of PetDetailsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PetDetailsErrorCopyWith<PetDetailsError> get copyWith => _$PetDetailsErrorCopyWithImpl<PetDetailsError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PetDetailsError&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,errorMessage);

@override
String toString() {
  return 'PetDetailsState.petDetailsError(errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $PetDetailsErrorCopyWith<$Res> implements $PetDetailsStateCopyWith<$Res> {
  factory $PetDetailsErrorCopyWith(PetDetailsError value, $Res Function(PetDetailsError) _then) = _$PetDetailsErrorCopyWithImpl;
@useResult
$Res call({
 String errorMessage
});




}
/// @nodoc
class _$PetDetailsErrorCopyWithImpl<$Res>
    implements $PetDetailsErrorCopyWith<$Res> {
  _$PetDetailsErrorCopyWithImpl(this._self, this._then);

  final PetDetailsError _self;
  final $Res Function(PetDetailsError) _then;

/// Create a copy of PetDetailsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? errorMessage = null,}) {
  return _then(PetDetailsError(
null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class PetDetailsSuccess implements PetDetailsState {
  const PetDetailsSuccess(this.petDetails);
  

 final  PetDetailsModel petDetails;

/// Create a copy of PetDetailsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PetDetailsSuccessCopyWith<PetDetailsSuccess> get copyWith => _$PetDetailsSuccessCopyWithImpl<PetDetailsSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PetDetailsSuccess&&const DeepCollectionEquality().equals(other.petDetails, petDetails));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(petDetails));

@override
String toString() {
  return 'PetDetailsState.petDetailsSuccess(petDetails: $petDetails)';
}


}

/// @nodoc
abstract mixin class $PetDetailsSuccessCopyWith<$Res> implements $PetDetailsStateCopyWith<$Res> {
  factory $PetDetailsSuccessCopyWith(PetDetailsSuccess value, $Res Function(PetDetailsSuccess) _then) = _$PetDetailsSuccessCopyWithImpl;
@useResult
$Res call({
 PetDetailsModel petDetails
});




}
/// @nodoc
class _$PetDetailsSuccessCopyWithImpl<$Res>
    implements $PetDetailsSuccessCopyWith<$Res> {
  _$PetDetailsSuccessCopyWithImpl(this._self, this._then);

  final PetDetailsSuccess _self;
  final $Res Function(PetDetailsSuccess) _then;

/// Create a copy of PetDetailsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? petDetails = freezed,}) {
  return _then(PetDetailsSuccess(
freezed == petDetails ? _self.petDetails : petDetails // ignore: cast_nullable_to_non_nullable
as PetDetailsModel,
  ));
}


}

// dart format on
