// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cart_items_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CartItemsState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CartItemsState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CartItemsState()';
}


}

/// @nodoc
class $CartItemsStateCopyWith<$Res>  {
$CartItemsStateCopyWith(CartItemsState _, $Res Function(CartItemsState) __);
}


/// Adds pattern-matching-related methods to [CartItemsState].
extension CartItemsStatePatterns on CartItemsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( CartItemsInitial value)?  initial,TResult Function( CartItemsLoading value)?  cartItemsLoading,TResult Function( CartItemsError value)?  cartItemsError,TResult Function( UserCartEmpty value)?  userCartEmpty,TResult Function( UserCartItemsSuccess value)?  userCartItemsSuccess,required TResult orElse(),}){
final _that = this;
switch (_that) {
case CartItemsInitial() when initial != null:
return initial(_that);case CartItemsLoading() when cartItemsLoading != null:
return cartItemsLoading(_that);case CartItemsError() when cartItemsError != null:
return cartItemsError(_that);case UserCartEmpty() when userCartEmpty != null:
return userCartEmpty(_that);case UserCartItemsSuccess() when userCartItemsSuccess != null:
return userCartItemsSuccess(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( CartItemsInitial value)  initial,required TResult Function( CartItemsLoading value)  cartItemsLoading,required TResult Function( CartItemsError value)  cartItemsError,required TResult Function( UserCartEmpty value)  userCartEmpty,required TResult Function( UserCartItemsSuccess value)  userCartItemsSuccess,}){
final _that = this;
switch (_that) {
case CartItemsInitial():
return initial(_that);case CartItemsLoading():
return cartItemsLoading(_that);case CartItemsError():
return cartItemsError(_that);case UserCartEmpty():
return userCartEmpty(_that);case UserCartItemsSuccess():
return userCartItemsSuccess(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( CartItemsInitial value)?  initial,TResult? Function( CartItemsLoading value)?  cartItemsLoading,TResult? Function( CartItemsError value)?  cartItemsError,TResult? Function( UserCartEmpty value)?  userCartEmpty,TResult? Function( UserCartItemsSuccess value)?  userCartItemsSuccess,}){
final _that = this;
switch (_that) {
case CartItemsInitial() when initial != null:
return initial(_that);case CartItemsLoading() when cartItemsLoading != null:
return cartItemsLoading(_that);case CartItemsError() when cartItemsError != null:
return cartItemsError(_that);case UserCartEmpty() when userCartEmpty != null:
return userCartEmpty(_that);case UserCartItemsSuccess() when userCartItemsSuccess != null:
return userCartItemsSuccess(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  cartItemsLoading,TResult Function( String errorMessage)?  cartItemsError,TResult Function()?  userCartEmpty,TResult Function( CartItemsModel cartItemsData)?  userCartItemsSuccess,required TResult orElse(),}) {final _that = this;
switch (_that) {
case CartItemsInitial() when initial != null:
return initial();case CartItemsLoading() when cartItemsLoading != null:
return cartItemsLoading();case CartItemsError() when cartItemsError != null:
return cartItemsError(_that.errorMessage);case UserCartEmpty() when userCartEmpty != null:
return userCartEmpty();case UserCartItemsSuccess() when userCartItemsSuccess != null:
return userCartItemsSuccess(_that.cartItemsData);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  cartItemsLoading,required TResult Function( String errorMessage)  cartItemsError,required TResult Function()  userCartEmpty,required TResult Function( CartItemsModel cartItemsData)  userCartItemsSuccess,}) {final _that = this;
switch (_that) {
case CartItemsInitial():
return initial();case CartItemsLoading():
return cartItemsLoading();case CartItemsError():
return cartItemsError(_that.errorMessage);case UserCartEmpty():
return userCartEmpty();case UserCartItemsSuccess():
return userCartItemsSuccess(_that.cartItemsData);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  cartItemsLoading,TResult? Function( String errorMessage)?  cartItemsError,TResult? Function()?  userCartEmpty,TResult? Function( CartItemsModel cartItemsData)?  userCartItemsSuccess,}) {final _that = this;
switch (_that) {
case CartItemsInitial() when initial != null:
return initial();case CartItemsLoading() when cartItemsLoading != null:
return cartItemsLoading();case CartItemsError() when cartItemsError != null:
return cartItemsError(_that.errorMessage);case UserCartEmpty() when userCartEmpty != null:
return userCartEmpty();case UserCartItemsSuccess() when userCartItemsSuccess != null:
return userCartItemsSuccess(_that.cartItemsData);case _:
  return null;

}
}

}

/// @nodoc


class CartItemsInitial implements CartItemsState {
  const CartItemsInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CartItemsInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CartItemsState.initial()';
}


}




/// @nodoc


class CartItemsLoading implements CartItemsState {
  const CartItemsLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CartItemsLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CartItemsState.cartItemsLoading()';
}


}




/// @nodoc


class CartItemsError implements CartItemsState {
  const CartItemsError(this.errorMessage);
  

 final  String errorMessage;

/// Create a copy of CartItemsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CartItemsErrorCopyWith<CartItemsError> get copyWith => _$CartItemsErrorCopyWithImpl<CartItemsError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CartItemsError&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,errorMessage);

@override
String toString() {
  return 'CartItemsState.cartItemsError(errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $CartItemsErrorCopyWith<$Res> implements $CartItemsStateCopyWith<$Res> {
  factory $CartItemsErrorCopyWith(CartItemsError value, $Res Function(CartItemsError) _then) = _$CartItemsErrorCopyWithImpl;
@useResult
$Res call({
 String errorMessage
});




}
/// @nodoc
class _$CartItemsErrorCopyWithImpl<$Res>
    implements $CartItemsErrorCopyWith<$Res> {
  _$CartItemsErrorCopyWithImpl(this._self, this._then);

  final CartItemsError _self;
  final $Res Function(CartItemsError) _then;

/// Create a copy of CartItemsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? errorMessage = null,}) {
  return _then(CartItemsError(
null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class UserCartEmpty implements CartItemsState {
  const UserCartEmpty();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserCartEmpty);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CartItemsState.userCartEmpty()';
}


}




/// @nodoc


class UserCartItemsSuccess implements CartItemsState {
  const UserCartItemsSuccess(this.cartItemsData);
  

 final  CartItemsModel cartItemsData;

/// Create a copy of CartItemsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserCartItemsSuccessCopyWith<UserCartItemsSuccess> get copyWith => _$UserCartItemsSuccessCopyWithImpl<UserCartItemsSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserCartItemsSuccess&&(identical(other.cartItemsData, cartItemsData) || other.cartItemsData == cartItemsData));
}


@override
int get hashCode => Object.hash(runtimeType,cartItemsData);

@override
String toString() {
  return 'CartItemsState.userCartItemsSuccess(cartItemsData: $cartItemsData)';
}


}

/// @nodoc
abstract mixin class $UserCartItemsSuccessCopyWith<$Res> implements $CartItemsStateCopyWith<$Res> {
  factory $UserCartItemsSuccessCopyWith(UserCartItemsSuccess value, $Res Function(UserCartItemsSuccess) _then) = _$UserCartItemsSuccessCopyWithImpl;
@useResult
$Res call({
 CartItemsModel cartItemsData
});




}
/// @nodoc
class _$UserCartItemsSuccessCopyWithImpl<$Res>
    implements $UserCartItemsSuccessCopyWith<$Res> {
  _$UserCartItemsSuccessCopyWithImpl(this._self, this._then);

  final UserCartItemsSuccess _self;
  final $Res Function(UserCartItemsSuccess) _then;

/// Create a copy of CartItemsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? cartItemsData = null,}) {
  return _then(UserCartItemsSuccess(
null == cartItemsData ? _self.cartItemsData : cartItemsData // ignore: cast_nullable_to_non_nullable
as CartItemsModel,
  ));
}


}

// dart format on
