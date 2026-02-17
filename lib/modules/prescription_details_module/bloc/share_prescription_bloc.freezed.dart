// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'share_prescription_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SharePrescriptionEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SharePrescriptionEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SharePrescriptionEvent()';
}


}

/// @nodoc
class $SharePrescriptionEventCopyWith<$Res>  {
$SharePrescriptionEventCopyWith(SharePrescriptionEvent _, $Res Function(SharePrescriptionEvent) __);
}


/// Adds pattern-matching-related methods to [SharePrescriptionEvent].
extension SharePrescriptionEventPatterns on SharePrescriptionEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Started value)?  started,TResult Function( _SharePrescriptionDocument value)?  sharePrescriptionDocument,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _SharePrescriptionDocument() when sharePrescriptionDocument != null:
return sharePrescriptionDocument(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Started value)  started,required TResult Function( _SharePrescriptionDocument value)  sharePrescriptionDocument,}){
final _that = this;
switch (_that) {
case _Started():
return started(_that);case _SharePrescriptionDocument():
return sharePrescriptionDocument(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Started value)?  started,TResult? Function( _SharePrescriptionDocument value)?  sharePrescriptionDocument,}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _SharePrescriptionDocument() when sharePrescriptionDocument != null:
return sharePrescriptionDocument(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  started,TResult Function( int prescriptionId)?  sharePrescriptionDocument,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _SharePrescriptionDocument() when sharePrescriptionDocument != null:
return sharePrescriptionDocument(_that.prescriptionId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  started,required TResult Function( int prescriptionId)  sharePrescriptionDocument,}) {final _that = this;
switch (_that) {
case _Started():
return started();case _SharePrescriptionDocument():
return sharePrescriptionDocument(_that.prescriptionId);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  started,TResult? Function( int prescriptionId)?  sharePrescriptionDocument,}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _SharePrescriptionDocument() when sharePrescriptionDocument != null:
return sharePrescriptionDocument(_that.prescriptionId);case _:
  return null;

}
}

}

/// @nodoc


class _Started implements SharePrescriptionEvent {
  const _Started();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Started);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SharePrescriptionEvent.started()';
}


}




/// @nodoc


class _SharePrescriptionDocument implements SharePrescriptionEvent {
  const _SharePrescriptionDocument({required this.prescriptionId});
  

 final  int prescriptionId;

/// Create a copy of SharePrescriptionEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SharePrescriptionDocumentCopyWith<_SharePrescriptionDocument> get copyWith => __$SharePrescriptionDocumentCopyWithImpl<_SharePrescriptionDocument>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SharePrescriptionDocument&&(identical(other.prescriptionId, prescriptionId) || other.prescriptionId == prescriptionId));
}


@override
int get hashCode => Object.hash(runtimeType,prescriptionId);

@override
String toString() {
  return 'SharePrescriptionEvent.sharePrescriptionDocument(prescriptionId: $prescriptionId)';
}


}

/// @nodoc
abstract mixin class _$SharePrescriptionDocumentCopyWith<$Res> implements $SharePrescriptionEventCopyWith<$Res> {
  factory _$SharePrescriptionDocumentCopyWith(_SharePrescriptionDocument value, $Res Function(_SharePrescriptionDocument) _then) = __$SharePrescriptionDocumentCopyWithImpl;
@useResult
$Res call({
 int prescriptionId
});




}
/// @nodoc
class __$SharePrescriptionDocumentCopyWithImpl<$Res>
    implements _$SharePrescriptionDocumentCopyWith<$Res> {
  __$SharePrescriptionDocumentCopyWithImpl(this._self, this._then);

  final _SharePrescriptionDocument _self;
  final $Res Function(_SharePrescriptionDocument) _then;

/// Create a copy of SharePrescriptionEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? prescriptionId = null,}) {
  return _then(_SharePrescriptionDocument(
prescriptionId: null == prescriptionId ? _self.prescriptionId : prescriptionId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
mixin _$SharePrescriptionState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SharePrescriptionState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SharePrescriptionState()';
}


}

/// @nodoc
class $SharePrescriptionStateCopyWith<$Res>  {
$SharePrescriptionStateCopyWith(SharePrescriptionState _, $Res Function(SharePrescriptionState) __);
}


/// Adds pattern-matching-related methods to [SharePrescriptionState].
extension SharePrescriptionStatePatterns on SharePrescriptionState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( SharePrescriptionInitial value)?  initial,TResult Function( SharePrescriptionLoading value)?  loading,TResult Function( SharePrescriptionSuccess value)?  success,TResult Function( SharePrescriptionFailure value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case SharePrescriptionInitial() when initial != null:
return initial(_that);case SharePrescriptionLoading() when loading != null:
return loading(_that);case SharePrescriptionSuccess() when success != null:
return success(_that);case SharePrescriptionFailure() when failure != null:
return failure(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( SharePrescriptionInitial value)  initial,required TResult Function( SharePrescriptionLoading value)  loading,required TResult Function( SharePrescriptionSuccess value)  success,required TResult Function( SharePrescriptionFailure value)  failure,}){
final _that = this;
switch (_that) {
case SharePrescriptionInitial():
return initial(_that);case SharePrescriptionLoading():
return loading(_that);case SharePrescriptionSuccess():
return success(_that);case SharePrescriptionFailure():
return failure(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( SharePrescriptionInitial value)?  initial,TResult? Function( SharePrescriptionLoading value)?  loading,TResult? Function( SharePrescriptionSuccess value)?  success,TResult? Function( SharePrescriptionFailure value)?  failure,}){
final _that = this;
switch (_that) {
case SharePrescriptionInitial() when initial != null:
return initial(_that);case SharePrescriptionLoading() when loading != null:
return loading(_that);case SharePrescriptionSuccess() when success != null:
return success(_that);case SharePrescriptionFailure() when failure != null:
return failure(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function()?  success,TResult Function( String error)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case SharePrescriptionInitial() when initial != null:
return initial();case SharePrescriptionLoading() when loading != null:
return loading();case SharePrescriptionSuccess() when success != null:
return success();case SharePrescriptionFailure() when failure != null:
return failure(_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function()  success,required TResult Function( String error)  failure,}) {final _that = this;
switch (_that) {
case SharePrescriptionInitial():
return initial();case SharePrescriptionLoading():
return loading();case SharePrescriptionSuccess():
return success();case SharePrescriptionFailure():
return failure(_that.error);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function()?  success,TResult? Function( String error)?  failure,}) {final _that = this;
switch (_that) {
case SharePrescriptionInitial() when initial != null:
return initial();case SharePrescriptionLoading() when loading != null:
return loading();case SharePrescriptionSuccess() when success != null:
return success();case SharePrescriptionFailure() when failure != null:
return failure(_that.error);case _:
  return null;

}
}

}

/// @nodoc


class SharePrescriptionInitial implements SharePrescriptionState {
  const SharePrescriptionInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SharePrescriptionInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SharePrescriptionState.initial()';
}


}




/// @nodoc


class SharePrescriptionLoading implements SharePrescriptionState {
  const SharePrescriptionLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SharePrescriptionLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SharePrescriptionState.loading()';
}


}




/// @nodoc


class SharePrescriptionSuccess implements SharePrescriptionState {
  const SharePrescriptionSuccess();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SharePrescriptionSuccess);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SharePrescriptionState.success()';
}


}




/// @nodoc


class SharePrescriptionFailure implements SharePrescriptionState {
  const SharePrescriptionFailure(this.error);
  

 final  String error;

/// Create a copy of SharePrescriptionState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SharePrescriptionFailureCopyWith<SharePrescriptionFailure> get copyWith => _$SharePrescriptionFailureCopyWithImpl<SharePrescriptionFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SharePrescriptionFailure&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,error);

@override
String toString() {
  return 'SharePrescriptionState.failure(error: $error)';
}


}

/// @nodoc
abstract mixin class $SharePrescriptionFailureCopyWith<$Res> implements $SharePrescriptionStateCopyWith<$Res> {
  factory $SharePrescriptionFailureCopyWith(SharePrescriptionFailure value, $Res Function(SharePrescriptionFailure) _then) = _$SharePrescriptionFailureCopyWithImpl;
@useResult
$Res call({
 String error
});




}
/// @nodoc
class _$SharePrescriptionFailureCopyWithImpl<$Res>
    implements $SharePrescriptionFailureCopyWith<$Res> {
  _$SharePrescriptionFailureCopyWithImpl(this._self, this._then);

  final SharePrescriptionFailure _self;
  final $Res Function(SharePrescriptionFailure) _then;

/// Create a copy of SharePrescriptionState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(SharePrescriptionFailure(
null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
