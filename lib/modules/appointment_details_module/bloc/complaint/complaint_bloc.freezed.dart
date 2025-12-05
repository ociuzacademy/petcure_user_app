// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'complaint_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ComplaintEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ComplaintEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ComplaintEvent()';
}


}

/// @nodoc
class $ComplaintEventCopyWith<$Res>  {
$ComplaintEventCopyWith(ComplaintEvent _, $Res Function(ComplaintEvent) __);
}


/// Adds pattern-matching-related methods to [ComplaintEvent].
extension ComplaintEventPatterns on ComplaintEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Started value)?  started,TResult Function( _SubmittingComplaint value)?  submittingComplaint,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _SubmittingComplaint() when submittingComplaint != null:
return submittingComplaint(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Started value)  started,required TResult Function( _SubmittingComplaint value)  submittingComplaint,}){
final _that = this;
switch (_that) {
case _Started():
return started(_that);case _SubmittingComplaint():
return submittingComplaint(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Started value)?  started,TResult? Function( _SubmittingComplaint value)?  submittingComplaint,}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _SubmittingComplaint() when submittingComplaint != null:
return submittingComplaint(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  started,TResult Function( ComplaintData complaintData)?  submittingComplaint,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _SubmittingComplaint() when submittingComplaint != null:
return submittingComplaint(_that.complaintData);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  started,required TResult Function( ComplaintData complaintData)  submittingComplaint,}) {final _that = this;
switch (_that) {
case _Started():
return started();case _SubmittingComplaint():
return submittingComplaint(_that.complaintData);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  started,TResult? Function( ComplaintData complaintData)?  submittingComplaint,}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _SubmittingComplaint() when submittingComplaint != null:
return submittingComplaint(_that.complaintData);case _:
  return null;

}
}

}

/// @nodoc


class _Started implements ComplaintEvent {
  const _Started();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Started);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ComplaintEvent.started()';
}


}




/// @nodoc


class _SubmittingComplaint implements ComplaintEvent {
  const _SubmittingComplaint(this.complaintData);
  

 final  ComplaintData complaintData;

/// Create a copy of ComplaintEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SubmittingComplaintCopyWith<_SubmittingComplaint> get copyWith => __$SubmittingComplaintCopyWithImpl<_SubmittingComplaint>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SubmittingComplaint&&(identical(other.complaintData, complaintData) || other.complaintData == complaintData));
}


@override
int get hashCode => Object.hash(runtimeType,complaintData);

@override
String toString() {
  return 'ComplaintEvent.submittingComplaint(complaintData: $complaintData)';
}


}

/// @nodoc
abstract mixin class _$SubmittingComplaintCopyWith<$Res> implements $ComplaintEventCopyWith<$Res> {
  factory _$SubmittingComplaintCopyWith(_SubmittingComplaint value, $Res Function(_SubmittingComplaint) _then) = __$SubmittingComplaintCopyWithImpl;
@useResult
$Res call({
 ComplaintData complaintData
});




}
/// @nodoc
class __$SubmittingComplaintCopyWithImpl<$Res>
    implements _$SubmittingComplaintCopyWith<$Res> {
  __$SubmittingComplaintCopyWithImpl(this._self, this._then);

  final _SubmittingComplaint _self;
  final $Res Function(_SubmittingComplaint) _then;

/// Create a copy of ComplaintEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? complaintData = null,}) {
  return _then(_SubmittingComplaint(
null == complaintData ? _self.complaintData : complaintData // ignore: cast_nullable_to_non_nullable
as ComplaintData,
  ));
}


}

/// @nodoc
mixin _$ComplaintState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ComplaintState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ComplaintState()';
}


}

/// @nodoc
class $ComplaintStateCopyWith<$Res>  {
$ComplaintStateCopyWith(ComplaintState _, $Res Function(ComplaintState) __);
}


/// Adds pattern-matching-related methods to [ComplaintState].
extension ComplaintStatePatterns on ComplaintState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ComplaintInitial value)?  initial,TResult Function( ComplaintLoading value)?  loading,TResult Function( ComplaintSuccess value)?  success,TResult Function( ComplaintError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ComplaintInitial() when initial != null:
return initial(_that);case ComplaintLoading() when loading != null:
return loading(_that);case ComplaintSuccess() when success != null:
return success(_that);case ComplaintError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ComplaintInitial value)  initial,required TResult Function( ComplaintLoading value)  loading,required TResult Function( ComplaintSuccess value)  success,required TResult Function( ComplaintError value)  error,}){
final _that = this;
switch (_that) {
case ComplaintInitial():
return initial(_that);case ComplaintLoading():
return loading(_that);case ComplaintSuccess():
return success(_that);case ComplaintError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ComplaintInitial value)?  initial,TResult? Function( ComplaintLoading value)?  loading,TResult? Function( ComplaintSuccess value)?  success,TResult? Function( ComplaintError value)?  error,}){
final _that = this;
switch (_that) {
case ComplaintInitial() when initial != null:
return initial(_that);case ComplaintLoading() when loading != null:
return loading(_that);case ComplaintSuccess() when success != null:
return success(_that);case ComplaintError() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( ComplaintResponseModel response)?  success,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ComplaintInitial() when initial != null:
return initial();case ComplaintLoading() when loading != null:
return loading();case ComplaintSuccess() when success != null:
return success(_that.response);case ComplaintError() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( ComplaintResponseModel response)  success,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case ComplaintInitial():
return initial();case ComplaintLoading():
return loading();case ComplaintSuccess():
return success(_that.response);case ComplaintError():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( ComplaintResponseModel response)?  success,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case ComplaintInitial() when initial != null:
return initial();case ComplaintLoading() when loading != null:
return loading();case ComplaintSuccess() when success != null:
return success(_that.response);case ComplaintError() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class ComplaintInitial implements ComplaintState {
  const ComplaintInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ComplaintInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ComplaintState.initial()';
}


}




/// @nodoc


class ComplaintLoading implements ComplaintState {
  const ComplaintLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ComplaintLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ComplaintState.loading()';
}


}




/// @nodoc


class ComplaintSuccess implements ComplaintState {
  const ComplaintSuccess(this.response);
  

 final  ComplaintResponseModel response;

/// Create a copy of ComplaintState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ComplaintSuccessCopyWith<ComplaintSuccess> get copyWith => _$ComplaintSuccessCopyWithImpl<ComplaintSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ComplaintSuccess&&(identical(other.response, response) || other.response == response));
}


@override
int get hashCode => Object.hash(runtimeType,response);

@override
String toString() {
  return 'ComplaintState.success(response: $response)';
}


}

/// @nodoc
abstract mixin class $ComplaintSuccessCopyWith<$Res> implements $ComplaintStateCopyWith<$Res> {
  factory $ComplaintSuccessCopyWith(ComplaintSuccess value, $Res Function(ComplaintSuccess) _then) = _$ComplaintSuccessCopyWithImpl;
@useResult
$Res call({
 ComplaintResponseModel response
});




}
/// @nodoc
class _$ComplaintSuccessCopyWithImpl<$Res>
    implements $ComplaintSuccessCopyWith<$Res> {
  _$ComplaintSuccessCopyWithImpl(this._self, this._then);

  final ComplaintSuccess _self;
  final $Res Function(ComplaintSuccess) _then;

/// Create a copy of ComplaintState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? response = null,}) {
  return _then(ComplaintSuccess(
null == response ? _self.response : response // ignore: cast_nullable_to_non_nullable
as ComplaintResponseModel,
  ));
}


}

/// @nodoc


class ComplaintError implements ComplaintState {
  const ComplaintError(this.message);
  

 final  String message;

/// Create a copy of ComplaintState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ComplaintErrorCopyWith<ComplaintError> get copyWith => _$ComplaintErrorCopyWithImpl<ComplaintError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ComplaintError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'ComplaintState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $ComplaintErrorCopyWith<$Res> implements $ComplaintStateCopyWith<$Res> {
  factory $ComplaintErrorCopyWith(ComplaintError value, $Res Function(ComplaintError) _then) = _$ComplaintErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$ComplaintErrorCopyWithImpl<$Res>
    implements $ComplaintErrorCopyWith<$Res> {
  _$ComplaintErrorCopyWithImpl(this._self, this._then);

  final ComplaintError _self;
  final $Res Function(ComplaintError) _then;

/// Create a copy of ComplaintState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(ComplaintError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
