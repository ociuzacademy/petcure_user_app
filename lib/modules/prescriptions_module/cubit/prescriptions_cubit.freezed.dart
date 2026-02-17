// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'prescriptions_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PrescriptionsState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PrescriptionsState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PrescriptionsState()';
}


}

/// @nodoc
class $PrescriptionsStateCopyWith<$Res>  {
$PrescriptionsStateCopyWith(PrescriptionsState _, $Res Function(PrescriptionsState) __);
}


/// Adds pattern-matching-related methods to [PrescriptionsState].
extension PrescriptionsStatePatterns on PrescriptionsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( PrescriptionsInitial value)?  initial,TResult Function( PrescriptionsLoading value)?  loading,TResult Function( PrescriptionsLoaded value)?  loaded,TResult Function( PrescriptionsError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case PrescriptionsInitial() when initial != null:
return initial(_that);case PrescriptionsLoading() when loading != null:
return loading(_that);case PrescriptionsLoaded() when loaded != null:
return loaded(_that);case PrescriptionsError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( PrescriptionsInitial value)  initial,required TResult Function( PrescriptionsLoading value)  loading,required TResult Function( PrescriptionsLoaded value)  loaded,required TResult Function( PrescriptionsError value)  error,}){
final _that = this;
switch (_that) {
case PrescriptionsInitial():
return initial(_that);case PrescriptionsLoading():
return loading(_that);case PrescriptionsLoaded():
return loaded(_that);case PrescriptionsError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( PrescriptionsInitial value)?  initial,TResult? Function( PrescriptionsLoading value)?  loading,TResult? Function( PrescriptionsLoaded value)?  loaded,TResult? Function( PrescriptionsError value)?  error,}){
final _that = this;
switch (_that) {
case PrescriptionsInitial() when initial != null:
return initial(_that);case PrescriptionsLoading() when loading != null:
return loading(_that);case PrescriptionsLoaded() when loaded != null:
return loaded(_that);case PrescriptionsError() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( PrescriptionListModel prescriptions)?  loaded,TResult Function( String error)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case PrescriptionsInitial() when initial != null:
return initial();case PrescriptionsLoading() when loading != null:
return loading();case PrescriptionsLoaded() when loaded != null:
return loaded(_that.prescriptions);case PrescriptionsError() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( PrescriptionListModel prescriptions)  loaded,required TResult Function( String error)  error,}) {final _that = this;
switch (_that) {
case PrescriptionsInitial():
return initial();case PrescriptionsLoading():
return loading();case PrescriptionsLoaded():
return loaded(_that.prescriptions);case PrescriptionsError():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( PrescriptionListModel prescriptions)?  loaded,TResult? Function( String error)?  error,}) {final _that = this;
switch (_that) {
case PrescriptionsInitial() when initial != null:
return initial();case PrescriptionsLoading() when loading != null:
return loading();case PrescriptionsLoaded() when loaded != null:
return loaded(_that.prescriptions);case PrescriptionsError() when error != null:
return error(_that.error);case _:
  return null;

}
}

}

/// @nodoc


class PrescriptionsInitial implements PrescriptionsState {
  const PrescriptionsInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PrescriptionsInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PrescriptionsState.initial()';
}


}




/// @nodoc


class PrescriptionsLoading implements PrescriptionsState {
  const PrescriptionsLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PrescriptionsLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PrescriptionsState.loading()';
}


}




/// @nodoc


class PrescriptionsLoaded implements PrescriptionsState {
  const PrescriptionsLoaded(this.prescriptions);
  

 final  PrescriptionListModel prescriptions;

/// Create a copy of PrescriptionsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PrescriptionsLoadedCopyWith<PrescriptionsLoaded> get copyWith => _$PrescriptionsLoadedCopyWithImpl<PrescriptionsLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PrescriptionsLoaded&&(identical(other.prescriptions, prescriptions) || other.prescriptions == prescriptions));
}


@override
int get hashCode => Object.hash(runtimeType,prescriptions);

@override
String toString() {
  return 'PrescriptionsState.loaded(prescriptions: $prescriptions)';
}


}

/// @nodoc
abstract mixin class $PrescriptionsLoadedCopyWith<$Res> implements $PrescriptionsStateCopyWith<$Res> {
  factory $PrescriptionsLoadedCopyWith(PrescriptionsLoaded value, $Res Function(PrescriptionsLoaded) _then) = _$PrescriptionsLoadedCopyWithImpl;
@useResult
$Res call({
 PrescriptionListModel prescriptions
});




}
/// @nodoc
class _$PrescriptionsLoadedCopyWithImpl<$Res>
    implements $PrescriptionsLoadedCopyWith<$Res> {
  _$PrescriptionsLoadedCopyWithImpl(this._self, this._then);

  final PrescriptionsLoaded _self;
  final $Res Function(PrescriptionsLoaded) _then;

/// Create a copy of PrescriptionsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? prescriptions = null,}) {
  return _then(PrescriptionsLoaded(
null == prescriptions ? _self.prescriptions : prescriptions // ignore: cast_nullable_to_non_nullable
as PrescriptionListModel,
  ));
}


}

/// @nodoc


class PrescriptionsError implements PrescriptionsState {
  const PrescriptionsError(this.error);
  

 final  String error;

/// Create a copy of PrescriptionsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PrescriptionsErrorCopyWith<PrescriptionsError> get copyWith => _$PrescriptionsErrorCopyWithImpl<PrescriptionsError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PrescriptionsError&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,error);

@override
String toString() {
  return 'PrescriptionsState.error(error: $error)';
}


}

/// @nodoc
abstract mixin class $PrescriptionsErrorCopyWith<$Res> implements $PrescriptionsStateCopyWith<$Res> {
  factory $PrescriptionsErrorCopyWith(PrescriptionsError value, $Res Function(PrescriptionsError) _then) = _$PrescriptionsErrorCopyWithImpl;
@useResult
$Res call({
 String error
});




}
/// @nodoc
class _$PrescriptionsErrorCopyWithImpl<$Res>
    implements $PrescriptionsErrorCopyWith<$Res> {
  _$PrescriptionsErrorCopyWithImpl(this._self, this._then);

  final PrescriptionsError _self;
  final $Res Function(PrescriptionsError) _then;

/// Create a copy of PrescriptionsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(PrescriptionsError(
null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
