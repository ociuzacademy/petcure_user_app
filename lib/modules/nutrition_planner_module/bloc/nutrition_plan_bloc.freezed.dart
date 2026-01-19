// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'nutrition_plan_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$NutritionPlanEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NutritionPlanEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NutritionPlanEvent()';
}


}

/// @nodoc
class $NutritionPlanEventCopyWith<$Res>  {
$NutritionPlanEventCopyWith(NutritionPlanEvent _, $Res Function(NutritionPlanEvent) __);
}


/// Adds pattern-matching-related methods to [NutritionPlanEvent].
extension NutritionPlanEventPatterns on NutritionPlanEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Started value)?  started,TResult Function( _GettingNutritionPlan value)?  gettingNutritionPlan,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _GettingNutritionPlan() when gettingNutritionPlan != null:
return gettingNutritionPlan(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Started value)  started,required TResult Function( _GettingNutritionPlan value)  gettingNutritionPlan,}){
final _that = this;
switch (_that) {
case _Started():
return started(_that);case _GettingNutritionPlan():
return gettingNutritionPlan(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Started value)?  started,TResult? Function( _GettingNutritionPlan value)?  gettingNutritionPlan,}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _GettingNutritionPlan() when gettingNutritionPlan != null:
return gettingNutritionPlan(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  started,TResult Function( NutritionPlannerData nutritionPlannerData)?  gettingNutritionPlan,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _GettingNutritionPlan() when gettingNutritionPlan != null:
return gettingNutritionPlan(_that.nutritionPlannerData);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  started,required TResult Function( NutritionPlannerData nutritionPlannerData)  gettingNutritionPlan,}) {final _that = this;
switch (_that) {
case _Started():
return started();case _GettingNutritionPlan():
return gettingNutritionPlan(_that.nutritionPlannerData);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  started,TResult? Function( NutritionPlannerData nutritionPlannerData)?  gettingNutritionPlan,}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _GettingNutritionPlan() when gettingNutritionPlan != null:
return gettingNutritionPlan(_that.nutritionPlannerData);case _:
  return null;

}
}

}

/// @nodoc


class _Started implements NutritionPlanEvent {
  const _Started();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Started);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NutritionPlanEvent.started()';
}


}




/// @nodoc


class _GettingNutritionPlan implements NutritionPlanEvent {
  const _GettingNutritionPlan({required this.nutritionPlannerData});
  

 final  NutritionPlannerData nutritionPlannerData;

/// Create a copy of NutritionPlanEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GettingNutritionPlanCopyWith<_GettingNutritionPlan> get copyWith => __$GettingNutritionPlanCopyWithImpl<_GettingNutritionPlan>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GettingNutritionPlan&&(identical(other.nutritionPlannerData, nutritionPlannerData) || other.nutritionPlannerData == nutritionPlannerData));
}


@override
int get hashCode => Object.hash(runtimeType,nutritionPlannerData);

@override
String toString() {
  return 'NutritionPlanEvent.gettingNutritionPlan(nutritionPlannerData: $nutritionPlannerData)';
}


}

/// @nodoc
abstract mixin class _$GettingNutritionPlanCopyWith<$Res> implements $NutritionPlanEventCopyWith<$Res> {
  factory _$GettingNutritionPlanCopyWith(_GettingNutritionPlan value, $Res Function(_GettingNutritionPlan) _then) = __$GettingNutritionPlanCopyWithImpl;
@useResult
$Res call({
 NutritionPlannerData nutritionPlannerData
});




}
/// @nodoc
class __$GettingNutritionPlanCopyWithImpl<$Res>
    implements _$GettingNutritionPlanCopyWith<$Res> {
  __$GettingNutritionPlanCopyWithImpl(this._self, this._then);

  final _GettingNutritionPlan _self;
  final $Res Function(_GettingNutritionPlan) _then;

/// Create a copy of NutritionPlanEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? nutritionPlannerData = null,}) {
  return _then(_GettingNutritionPlan(
nutritionPlannerData: null == nutritionPlannerData ? _self.nutritionPlannerData : nutritionPlannerData // ignore: cast_nullable_to_non_nullable
as NutritionPlannerData,
  ));
}


}

/// @nodoc
mixin _$NutritionPlanState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NutritionPlanState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NutritionPlanState()';
}


}

/// @nodoc
class $NutritionPlanStateCopyWith<$Res>  {
$NutritionPlanStateCopyWith(NutritionPlanState _, $Res Function(NutritionPlanState) __);
}


/// Adds pattern-matching-related methods to [NutritionPlanState].
extension NutritionPlanStatePatterns on NutritionPlanState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( NutritionPlanInitial value)?  initial,TResult Function( NutritionPlanLoading value)?  loading,TResult Function( NutritionPlanSuccess value)?  success,TResult Function( NutritionPlanError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case NutritionPlanInitial() when initial != null:
return initial(_that);case NutritionPlanLoading() when loading != null:
return loading(_that);case NutritionPlanSuccess() when success != null:
return success(_that);case NutritionPlanError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( NutritionPlanInitial value)  initial,required TResult Function( NutritionPlanLoading value)  loading,required TResult Function( NutritionPlanSuccess value)  success,required TResult Function( NutritionPlanError value)  error,}){
final _that = this;
switch (_that) {
case NutritionPlanInitial():
return initial(_that);case NutritionPlanLoading():
return loading(_that);case NutritionPlanSuccess():
return success(_that);case NutritionPlanError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( NutritionPlanInitial value)?  initial,TResult? Function( NutritionPlanLoading value)?  loading,TResult? Function( NutritionPlanSuccess value)?  success,TResult? Function( NutritionPlanError value)?  error,}){
final _that = this;
switch (_that) {
case NutritionPlanInitial() when initial != null:
return initial(_that);case NutritionPlanLoading() when loading != null:
return loading(_that);case NutritionPlanSuccess() when success != null:
return success(_that);case NutritionPlanError() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( NutritionPlannerResponseModel response)?  success,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case NutritionPlanInitial() when initial != null:
return initial();case NutritionPlanLoading() when loading != null:
return loading();case NutritionPlanSuccess() when success != null:
return success(_that.response);case NutritionPlanError() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( NutritionPlannerResponseModel response)  success,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case NutritionPlanInitial():
return initial();case NutritionPlanLoading():
return loading();case NutritionPlanSuccess():
return success(_that.response);case NutritionPlanError():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( NutritionPlannerResponseModel response)?  success,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case NutritionPlanInitial() when initial != null:
return initial();case NutritionPlanLoading() when loading != null:
return loading();case NutritionPlanSuccess() when success != null:
return success(_that.response);case NutritionPlanError() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class NutritionPlanInitial implements NutritionPlanState {
  const NutritionPlanInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NutritionPlanInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NutritionPlanState.initial()';
}


}




/// @nodoc


class NutritionPlanLoading implements NutritionPlanState {
  const NutritionPlanLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NutritionPlanLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NutritionPlanState.loading()';
}


}




/// @nodoc


class NutritionPlanSuccess implements NutritionPlanState {
  const NutritionPlanSuccess({required this.response});
  

 final  NutritionPlannerResponseModel response;

/// Create a copy of NutritionPlanState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NutritionPlanSuccessCopyWith<NutritionPlanSuccess> get copyWith => _$NutritionPlanSuccessCopyWithImpl<NutritionPlanSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NutritionPlanSuccess&&(identical(other.response, response) || other.response == response));
}


@override
int get hashCode => Object.hash(runtimeType,response);

@override
String toString() {
  return 'NutritionPlanState.success(response: $response)';
}


}

/// @nodoc
abstract mixin class $NutritionPlanSuccessCopyWith<$Res> implements $NutritionPlanStateCopyWith<$Res> {
  factory $NutritionPlanSuccessCopyWith(NutritionPlanSuccess value, $Res Function(NutritionPlanSuccess) _then) = _$NutritionPlanSuccessCopyWithImpl;
@useResult
$Res call({
 NutritionPlannerResponseModel response
});




}
/// @nodoc
class _$NutritionPlanSuccessCopyWithImpl<$Res>
    implements $NutritionPlanSuccessCopyWith<$Res> {
  _$NutritionPlanSuccessCopyWithImpl(this._self, this._then);

  final NutritionPlanSuccess _self;
  final $Res Function(NutritionPlanSuccess) _then;

/// Create a copy of NutritionPlanState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? response = null,}) {
  return _then(NutritionPlanSuccess(
response: null == response ? _self.response : response // ignore: cast_nullable_to_non_nullable
as NutritionPlannerResponseModel,
  ));
}


}

/// @nodoc


class NutritionPlanError implements NutritionPlanState {
  const NutritionPlanError({required this.message});
  

 final  String message;

/// Create a copy of NutritionPlanState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NutritionPlanErrorCopyWith<NutritionPlanError> get copyWith => _$NutritionPlanErrorCopyWithImpl<NutritionPlanError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NutritionPlanError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'NutritionPlanState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $NutritionPlanErrorCopyWith<$Res> implements $NutritionPlanStateCopyWith<$Res> {
  factory $NutritionPlanErrorCopyWith(NutritionPlanError value, $Res Function(NutritionPlanError) _then) = _$NutritionPlanErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$NutritionPlanErrorCopyWithImpl<$Res>
    implements $NutritionPlanErrorCopyWith<$Res> {
  _$NutritionPlanErrorCopyWithImpl(this._self, this._then);

  final NutritionPlanError _self;
  final $Res Function(NutritionPlanError) _then;

/// Create a copy of NutritionPlanState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(NutritionPlanError(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
