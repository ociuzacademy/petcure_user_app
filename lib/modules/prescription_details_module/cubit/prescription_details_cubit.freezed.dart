// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'prescription_details_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PrescriptionDetailsState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PrescriptionDetailsState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PrescriptionDetailsState()';
}


}

/// @nodoc
class $PrescriptionDetailsStateCopyWith<$Res>  {
$PrescriptionDetailsStateCopyWith(PrescriptionDetailsState _, $Res Function(PrescriptionDetailsState) __);
}


/// Adds pattern-matching-related methods to [PrescriptionDetailsState].
extension PrescriptionDetailsStatePatterns on PrescriptionDetailsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( PrescriptionDetailsInitial value)?  initial,TResult Function( PrescriptionDetailsLoading value)?  loading,TResult Function( PrescriptionDetailsLoaded value)?  loaded,TResult Function( PrescriptionDetailsError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case PrescriptionDetailsInitial() when initial != null:
return initial(_that);case PrescriptionDetailsLoading() when loading != null:
return loading(_that);case PrescriptionDetailsLoaded() when loaded != null:
return loaded(_that);case PrescriptionDetailsError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( PrescriptionDetailsInitial value)  initial,required TResult Function( PrescriptionDetailsLoading value)  loading,required TResult Function( PrescriptionDetailsLoaded value)  loaded,required TResult Function( PrescriptionDetailsError value)  error,}){
final _that = this;
switch (_that) {
case PrescriptionDetailsInitial():
return initial(_that);case PrescriptionDetailsLoading():
return loading(_that);case PrescriptionDetailsLoaded():
return loaded(_that);case PrescriptionDetailsError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( PrescriptionDetailsInitial value)?  initial,TResult? Function( PrescriptionDetailsLoading value)?  loading,TResult? Function( PrescriptionDetailsLoaded value)?  loaded,TResult? Function( PrescriptionDetailsError value)?  error,}){
final _that = this;
switch (_that) {
case PrescriptionDetailsInitial() when initial != null:
return initial(_that);case PrescriptionDetailsLoading() when loading != null:
return loading(_that);case PrescriptionDetailsLoaded() when loaded != null:
return loaded(_that);case PrescriptionDetailsError() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( PrescriptionDetailsModel prescriptions)?  loaded,TResult Function( String error)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case PrescriptionDetailsInitial() when initial != null:
return initial();case PrescriptionDetailsLoading() when loading != null:
return loading();case PrescriptionDetailsLoaded() when loaded != null:
return loaded(_that.prescriptions);case PrescriptionDetailsError() when error != null:
return error(_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( PrescriptionDetailsModel prescriptions)  loaded,required TResult Function( String error)  error,}) {final _that = this;
switch (_that) {
case PrescriptionDetailsInitial():
return initial();case PrescriptionDetailsLoading():
return loading();case PrescriptionDetailsLoaded():
return loaded(_that.prescriptions);case PrescriptionDetailsError():
return error(_that.error);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( PrescriptionDetailsModel prescriptions)?  loaded,TResult? Function( String error)?  error,}) {final _that = this;
switch (_that) {
case PrescriptionDetailsInitial() when initial != null:
return initial();case PrescriptionDetailsLoading() when loading != null:
return loading();case PrescriptionDetailsLoaded() when loaded != null:
return loaded(_that.prescriptions);case PrescriptionDetailsError() when error != null:
return error(_that.error);case _:
  return null;

}
}

}

/// @nodoc


class PrescriptionDetailsInitial implements PrescriptionDetailsState {
  const PrescriptionDetailsInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PrescriptionDetailsInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PrescriptionDetailsState.initial()';
}


}




/// @nodoc


class PrescriptionDetailsLoading implements PrescriptionDetailsState {
  const PrescriptionDetailsLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PrescriptionDetailsLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PrescriptionDetailsState.loading()';
}


}




/// @nodoc


class PrescriptionDetailsLoaded implements PrescriptionDetailsState {
  const PrescriptionDetailsLoaded(this.prescriptions);
  

 final  PrescriptionDetailsModel prescriptions;

/// Create a copy of PrescriptionDetailsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PrescriptionDetailsLoadedCopyWith<PrescriptionDetailsLoaded> get copyWith => _$PrescriptionDetailsLoadedCopyWithImpl<PrescriptionDetailsLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PrescriptionDetailsLoaded&&(identical(other.prescriptions, prescriptions) || other.prescriptions == prescriptions));
}


@override
int get hashCode => Object.hash(runtimeType,prescriptions);

@override
String toString() {
  return 'PrescriptionDetailsState.loaded(prescriptions: $prescriptions)';
}


}

/// @nodoc
abstract mixin class $PrescriptionDetailsLoadedCopyWith<$Res> implements $PrescriptionDetailsStateCopyWith<$Res> {
  factory $PrescriptionDetailsLoadedCopyWith(PrescriptionDetailsLoaded value, $Res Function(PrescriptionDetailsLoaded) _then) = _$PrescriptionDetailsLoadedCopyWithImpl;
@useResult
$Res call({
 PrescriptionDetailsModel prescriptions
});




}
/// @nodoc
class _$PrescriptionDetailsLoadedCopyWithImpl<$Res>
    implements $PrescriptionDetailsLoadedCopyWith<$Res> {
  _$PrescriptionDetailsLoadedCopyWithImpl(this._self, this._then);

  final PrescriptionDetailsLoaded _self;
  final $Res Function(PrescriptionDetailsLoaded) _then;

/// Create a copy of PrescriptionDetailsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? prescriptions = null,}) {
  return _then(PrescriptionDetailsLoaded(
null == prescriptions ? _self.prescriptions : prescriptions // ignore: cast_nullable_to_non_nullable
as PrescriptionDetailsModel,
  ));
}


}

/// @nodoc


class PrescriptionDetailsError implements PrescriptionDetailsState {
  const PrescriptionDetailsError(this.error);
  

 final  String error;

/// Create a copy of PrescriptionDetailsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PrescriptionDetailsErrorCopyWith<PrescriptionDetailsError> get copyWith => _$PrescriptionDetailsErrorCopyWithImpl<PrescriptionDetailsError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PrescriptionDetailsError&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,error);

@override
String toString() {
  return 'PrescriptionDetailsState.error(error: $error)';
}


}

/// @nodoc
abstract mixin class $PrescriptionDetailsErrorCopyWith<$Res> implements $PrescriptionDetailsStateCopyWith<$Res> {
  factory $PrescriptionDetailsErrorCopyWith(PrescriptionDetailsError value, $Res Function(PrescriptionDetailsError) _then) = _$PrescriptionDetailsErrorCopyWithImpl;
@useResult
$Res call({
 String error
});




}
/// @nodoc
class _$PrescriptionDetailsErrorCopyWithImpl<$Res>
    implements $PrescriptionDetailsErrorCopyWith<$Res> {
  _$PrescriptionDetailsErrorCopyWithImpl(this._self, this._then);

  final PrescriptionDetailsError _self;
  final $Res Function(PrescriptionDetailsError) _then;

/// Create a copy of PrescriptionDetailsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(PrescriptionDetailsError(
null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
