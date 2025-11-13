// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_order_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProductOrderEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductOrderEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProductOrderEvent()';
}


}

/// @nodoc
class $ProductOrderEventCopyWith<$Res>  {
$ProductOrderEventCopyWith(ProductOrderEvent _, $Res Function(ProductOrderEvent) __);
}


/// Adds pattern-matching-related methods to [ProductOrderEvent].
extension ProductOrderEventPatterns on ProductOrderEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Started value)?  started,TResult Function( _ProductAddingToCart value)?  productAddingToCart,TResult Function( _BuyingProductNow value)?  buyingProductNow,TResult Function( _UpdatingCartItemQuantity value)?  updatingCartItemQuantity,TResult Function( _MakingPurchase value)?  makingPurchase,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _ProductAddingToCart() when productAddingToCart != null:
return productAddingToCart(_that);case _BuyingProductNow() when buyingProductNow != null:
return buyingProductNow(_that);case _UpdatingCartItemQuantity() when updatingCartItemQuantity != null:
return updatingCartItemQuantity(_that);case _MakingPurchase() when makingPurchase != null:
return makingPurchase(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Started value)  started,required TResult Function( _ProductAddingToCart value)  productAddingToCart,required TResult Function( _BuyingProductNow value)  buyingProductNow,required TResult Function( _UpdatingCartItemQuantity value)  updatingCartItemQuantity,required TResult Function( _MakingPurchase value)  makingPurchase,}){
final _that = this;
switch (_that) {
case _Started():
return started(_that);case _ProductAddingToCart():
return productAddingToCart(_that);case _BuyingProductNow():
return buyingProductNow(_that);case _UpdatingCartItemQuantity():
return updatingCartItemQuantity(_that);case _MakingPurchase():
return makingPurchase(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Started value)?  started,TResult? Function( _ProductAddingToCart value)?  productAddingToCart,TResult? Function( _BuyingProductNow value)?  buyingProductNow,TResult? Function( _UpdatingCartItemQuantity value)?  updatingCartItemQuantity,TResult? Function( _MakingPurchase value)?  makingPurchase,}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _ProductAddingToCart() when productAddingToCart != null:
return productAddingToCart(_that);case _BuyingProductNow() when buyingProductNow != null:
return buyingProductNow(_that);case _UpdatingCartItemQuantity() when updatingCartItemQuantity != null:
return updatingCartItemQuantity(_that);case _MakingPurchase() when makingPurchase != null:
return makingPurchase(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  started,TResult Function( int productId)?  productAddingToCart,TResult Function( int productId)?  buyingProductNow,TResult Function( int cartItemId,  int newQuantity)?  updatingCartItemQuantity,TResult Function()?  makingPurchase,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _ProductAddingToCart() when productAddingToCart != null:
return productAddingToCart(_that.productId);case _BuyingProductNow() when buyingProductNow != null:
return buyingProductNow(_that.productId);case _UpdatingCartItemQuantity() when updatingCartItemQuantity != null:
return updatingCartItemQuantity(_that.cartItemId,_that.newQuantity);case _MakingPurchase() when makingPurchase != null:
return makingPurchase();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  started,required TResult Function( int productId)  productAddingToCart,required TResult Function( int productId)  buyingProductNow,required TResult Function( int cartItemId,  int newQuantity)  updatingCartItemQuantity,required TResult Function()  makingPurchase,}) {final _that = this;
switch (_that) {
case _Started():
return started();case _ProductAddingToCart():
return productAddingToCart(_that.productId);case _BuyingProductNow():
return buyingProductNow(_that.productId);case _UpdatingCartItemQuantity():
return updatingCartItemQuantity(_that.cartItemId,_that.newQuantity);case _MakingPurchase():
return makingPurchase();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  started,TResult? Function( int productId)?  productAddingToCart,TResult? Function( int productId)?  buyingProductNow,TResult? Function( int cartItemId,  int newQuantity)?  updatingCartItemQuantity,TResult? Function()?  makingPurchase,}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _ProductAddingToCart() when productAddingToCart != null:
return productAddingToCart(_that.productId);case _BuyingProductNow() when buyingProductNow != null:
return buyingProductNow(_that.productId);case _UpdatingCartItemQuantity() when updatingCartItemQuantity != null:
return updatingCartItemQuantity(_that.cartItemId,_that.newQuantity);case _MakingPurchase() when makingPurchase != null:
return makingPurchase();case _:
  return null;

}
}

}

/// @nodoc


class _Started implements ProductOrderEvent {
  const _Started();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Started);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProductOrderEvent.started()';
}


}




/// @nodoc


class _ProductAddingToCart implements ProductOrderEvent {
  const _ProductAddingToCart(this.productId);
  

 final  int productId;

/// Create a copy of ProductOrderEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProductAddingToCartCopyWith<_ProductAddingToCart> get copyWith => __$ProductAddingToCartCopyWithImpl<_ProductAddingToCart>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProductAddingToCart&&(identical(other.productId, productId) || other.productId == productId));
}


@override
int get hashCode => Object.hash(runtimeType,productId);

@override
String toString() {
  return 'ProductOrderEvent.productAddingToCart(productId: $productId)';
}


}

/// @nodoc
abstract mixin class _$ProductAddingToCartCopyWith<$Res> implements $ProductOrderEventCopyWith<$Res> {
  factory _$ProductAddingToCartCopyWith(_ProductAddingToCart value, $Res Function(_ProductAddingToCart) _then) = __$ProductAddingToCartCopyWithImpl;
@useResult
$Res call({
 int productId
});




}
/// @nodoc
class __$ProductAddingToCartCopyWithImpl<$Res>
    implements _$ProductAddingToCartCopyWith<$Res> {
  __$ProductAddingToCartCopyWithImpl(this._self, this._then);

  final _ProductAddingToCart _self;
  final $Res Function(_ProductAddingToCart) _then;

/// Create a copy of ProductOrderEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? productId = null,}) {
  return _then(_ProductAddingToCart(
null == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _BuyingProductNow implements ProductOrderEvent {
  const _BuyingProductNow(this.productId);
  

 final  int productId;

/// Create a copy of ProductOrderEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BuyingProductNowCopyWith<_BuyingProductNow> get copyWith => __$BuyingProductNowCopyWithImpl<_BuyingProductNow>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BuyingProductNow&&(identical(other.productId, productId) || other.productId == productId));
}


@override
int get hashCode => Object.hash(runtimeType,productId);

@override
String toString() {
  return 'ProductOrderEvent.buyingProductNow(productId: $productId)';
}


}

/// @nodoc
abstract mixin class _$BuyingProductNowCopyWith<$Res> implements $ProductOrderEventCopyWith<$Res> {
  factory _$BuyingProductNowCopyWith(_BuyingProductNow value, $Res Function(_BuyingProductNow) _then) = __$BuyingProductNowCopyWithImpl;
@useResult
$Res call({
 int productId
});




}
/// @nodoc
class __$BuyingProductNowCopyWithImpl<$Res>
    implements _$BuyingProductNowCopyWith<$Res> {
  __$BuyingProductNowCopyWithImpl(this._self, this._then);

  final _BuyingProductNow _self;
  final $Res Function(_BuyingProductNow) _then;

/// Create a copy of ProductOrderEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? productId = null,}) {
  return _then(_BuyingProductNow(
null == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _UpdatingCartItemQuantity implements ProductOrderEvent {
  const _UpdatingCartItemQuantity(this.cartItemId, this.newQuantity);
  

 final  int cartItemId;
 final  int newQuantity;

/// Create a copy of ProductOrderEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdatingCartItemQuantityCopyWith<_UpdatingCartItemQuantity> get copyWith => __$UpdatingCartItemQuantityCopyWithImpl<_UpdatingCartItemQuantity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdatingCartItemQuantity&&(identical(other.cartItemId, cartItemId) || other.cartItemId == cartItemId)&&(identical(other.newQuantity, newQuantity) || other.newQuantity == newQuantity));
}


@override
int get hashCode => Object.hash(runtimeType,cartItemId,newQuantity);

@override
String toString() {
  return 'ProductOrderEvent.updatingCartItemQuantity(cartItemId: $cartItemId, newQuantity: $newQuantity)';
}


}

/// @nodoc
abstract mixin class _$UpdatingCartItemQuantityCopyWith<$Res> implements $ProductOrderEventCopyWith<$Res> {
  factory _$UpdatingCartItemQuantityCopyWith(_UpdatingCartItemQuantity value, $Res Function(_UpdatingCartItemQuantity) _then) = __$UpdatingCartItemQuantityCopyWithImpl;
@useResult
$Res call({
 int cartItemId, int newQuantity
});




}
/// @nodoc
class __$UpdatingCartItemQuantityCopyWithImpl<$Res>
    implements _$UpdatingCartItemQuantityCopyWith<$Res> {
  __$UpdatingCartItemQuantityCopyWithImpl(this._self, this._then);

  final _UpdatingCartItemQuantity _self;
  final $Res Function(_UpdatingCartItemQuantity) _then;

/// Create a copy of ProductOrderEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? cartItemId = null,Object? newQuantity = null,}) {
  return _then(_UpdatingCartItemQuantity(
null == cartItemId ? _self.cartItemId : cartItemId // ignore: cast_nullable_to_non_nullable
as int,null == newQuantity ? _self.newQuantity : newQuantity // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _MakingPurchase implements ProductOrderEvent {
  const _MakingPurchase();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MakingPurchase);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProductOrderEvent.makingPurchase()';
}


}




/// @nodoc
mixin _$ProductOrderState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductOrderState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProductOrderState()';
}


}

/// @nodoc
class $ProductOrderStateCopyWith<$Res>  {
$ProductOrderStateCopyWith(ProductOrderState _, $Res Function(ProductOrderState) __);
}


/// Adds pattern-matching-related methods to [ProductOrderState].
extension ProductOrderStatePatterns on ProductOrderState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ProductOrderInitial value)?  initial,TResult Function( ProductOrderLoading value)?  productOrderLoading,TResult Function( ProductOrderError value)?  productOrderError,TResult Function( ProductAddToCart value)?  productAddToCart,TResult Function( BuyProductNow value)?  buyProductNow,TResult Function( CartItemQuantityChanged value)?  cartItemQuantityChanged,TResult Function( PurchaseMade value)?  purchaseMade,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ProductOrderInitial() when initial != null:
return initial(_that);case ProductOrderLoading() when productOrderLoading != null:
return productOrderLoading(_that);case ProductOrderError() when productOrderError != null:
return productOrderError(_that);case ProductAddToCart() when productAddToCart != null:
return productAddToCart(_that);case BuyProductNow() when buyProductNow != null:
return buyProductNow(_that);case CartItemQuantityChanged() when cartItemQuantityChanged != null:
return cartItemQuantityChanged(_that);case PurchaseMade() when purchaseMade != null:
return purchaseMade(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ProductOrderInitial value)  initial,required TResult Function( ProductOrderLoading value)  productOrderLoading,required TResult Function( ProductOrderError value)  productOrderError,required TResult Function( ProductAddToCart value)  productAddToCart,required TResult Function( BuyProductNow value)  buyProductNow,required TResult Function( CartItemQuantityChanged value)  cartItemQuantityChanged,required TResult Function( PurchaseMade value)  purchaseMade,}){
final _that = this;
switch (_that) {
case ProductOrderInitial():
return initial(_that);case ProductOrderLoading():
return productOrderLoading(_that);case ProductOrderError():
return productOrderError(_that);case ProductAddToCart():
return productAddToCart(_that);case BuyProductNow():
return buyProductNow(_that);case CartItemQuantityChanged():
return cartItemQuantityChanged(_that);case PurchaseMade():
return purchaseMade(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ProductOrderInitial value)?  initial,TResult? Function( ProductOrderLoading value)?  productOrderLoading,TResult? Function( ProductOrderError value)?  productOrderError,TResult? Function( ProductAddToCart value)?  productAddToCart,TResult? Function( BuyProductNow value)?  buyProductNow,TResult? Function( CartItemQuantityChanged value)?  cartItemQuantityChanged,TResult? Function( PurchaseMade value)?  purchaseMade,}){
final _that = this;
switch (_that) {
case ProductOrderInitial() when initial != null:
return initial(_that);case ProductOrderLoading() when productOrderLoading != null:
return productOrderLoading(_that);case ProductOrderError() when productOrderError != null:
return productOrderError(_that);case ProductAddToCart() when productAddToCart != null:
return productAddToCart(_that);case BuyProductNow() when buyProductNow != null:
return buyProductNow(_that);case CartItemQuantityChanged() when cartItemQuantityChanged != null:
return cartItemQuantityChanged(_that);case PurchaseMade() when purchaseMade != null:
return purchaseMade(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function( String message)?  productOrderLoading,TResult Function( String errorMessage)?  productOrderError,TResult Function( AddToCartResponseModel addToCartResponse)?  productAddToCart,TResult Function( BuyNowResponseModel buyNowResponse)?  buyProductNow,TResult Function( CartItemUpdateQuantityResponseModel response)?  cartItemQuantityChanged,TResult Function( MakePurchaseResponseModel response)?  purchaseMade,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ProductOrderInitial() when initial != null:
return initial();case ProductOrderLoading() when productOrderLoading != null:
return productOrderLoading(_that.message);case ProductOrderError() when productOrderError != null:
return productOrderError(_that.errorMessage);case ProductAddToCart() when productAddToCart != null:
return productAddToCart(_that.addToCartResponse);case BuyProductNow() when buyProductNow != null:
return buyProductNow(_that.buyNowResponse);case CartItemQuantityChanged() when cartItemQuantityChanged != null:
return cartItemQuantityChanged(_that.response);case PurchaseMade() when purchaseMade != null:
return purchaseMade(_that.response);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function( String message)  productOrderLoading,required TResult Function( String errorMessage)  productOrderError,required TResult Function( AddToCartResponseModel addToCartResponse)  productAddToCart,required TResult Function( BuyNowResponseModel buyNowResponse)  buyProductNow,required TResult Function( CartItemUpdateQuantityResponseModel response)  cartItemQuantityChanged,required TResult Function( MakePurchaseResponseModel response)  purchaseMade,}) {final _that = this;
switch (_that) {
case ProductOrderInitial():
return initial();case ProductOrderLoading():
return productOrderLoading(_that.message);case ProductOrderError():
return productOrderError(_that.errorMessage);case ProductAddToCart():
return productAddToCart(_that.addToCartResponse);case BuyProductNow():
return buyProductNow(_that.buyNowResponse);case CartItemQuantityChanged():
return cartItemQuantityChanged(_that.response);case PurchaseMade():
return purchaseMade(_that.response);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function( String message)?  productOrderLoading,TResult? Function( String errorMessage)?  productOrderError,TResult? Function( AddToCartResponseModel addToCartResponse)?  productAddToCart,TResult? Function( BuyNowResponseModel buyNowResponse)?  buyProductNow,TResult? Function( CartItemUpdateQuantityResponseModel response)?  cartItemQuantityChanged,TResult? Function( MakePurchaseResponseModel response)?  purchaseMade,}) {final _that = this;
switch (_that) {
case ProductOrderInitial() when initial != null:
return initial();case ProductOrderLoading() when productOrderLoading != null:
return productOrderLoading(_that.message);case ProductOrderError() when productOrderError != null:
return productOrderError(_that.errorMessage);case ProductAddToCart() when productAddToCart != null:
return productAddToCart(_that.addToCartResponse);case BuyProductNow() when buyProductNow != null:
return buyProductNow(_that.buyNowResponse);case CartItemQuantityChanged() when cartItemQuantityChanged != null:
return cartItemQuantityChanged(_that.response);case PurchaseMade() when purchaseMade != null:
return purchaseMade(_that.response);case _:
  return null;

}
}

}

/// @nodoc


class ProductOrderInitial implements ProductOrderState {
  const ProductOrderInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductOrderInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProductOrderState.initial()';
}


}




/// @nodoc


class ProductOrderLoading implements ProductOrderState {
  const ProductOrderLoading(this.message);
  

 final  String message;

/// Create a copy of ProductOrderState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductOrderLoadingCopyWith<ProductOrderLoading> get copyWith => _$ProductOrderLoadingCopyWithImpl<ProductOrderLoading>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductOrderLoading&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'ProductOrderState.productOrderLoading(message: $message)';
}


}

/// @nodoc
abstract mixin class $ProductOrderLoadingCopyWith<$Res> implements $ProductOrderStateCopyWith<$Res> {
  factory $ProductOrderLoadingCopyWith(ProductOrderLoading value, $Res Function(ProductOrderLoading) _then) = _$ProductOrderLoadingCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$ProductOrderLoadingCopyWithImpl<$Res>
    implements $ProductOrderLoadingCopyWith<$Res> {
  _$ProductOrderLoadingCopyWithImpl(this._self, this._then);

  final ProductOrderLoading _self;
  final $Res Function(ProductOrderLoading) _then;

/// Create a copy of ProductOrderState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(ProductOrderLoading(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class ProductOrderError implements ProductOrderState {
  const ProductOrderError(this.errorMessage);
  

 final  String errorMessage;

/// Create a copy of ProductOrderState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductOrderErrorCopyWith<ProductOrderError> get copyWith => _$ProductOrderErrorCopyWithImpl<ProductOrderError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductOrderError&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,errorMessage);

@override
String toString() {
  return 'ProductOrderState.productOrderError(errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $ProductOrderErrorCopyWith<$Res> implements $ProductOrderStateCopyWith<$Res> {
  factory $ProductOrderErrorCopyWith(ProductOrderError value, $Res Function(ProductOrderError) _then) = _$ProductOrderErrorCopyWithImpl;
@useResult
$Res call({
 String errorMessage
});




}
/// @nodoc
class _$ProductOrderErrorCopyWithImpl<$Res>
    implements $ProductOrderErrorCopyWith<$Res> {
  _$ProductOrderErrorCopyWithImpl(this._self, this._then);

  final ProductOrderError _self;
  final $Res Function(ProductOrderError) _then;

/// Create a copy of ProductOrderState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? errorMessage = null,}) {
  return _then(ProductOrderError(
null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class ProductAddToCart implements ProductOrderState {
  const ProductAddToCart(this.addToCartResponse);
  

 final  AddToCartResponseModel addToCartResponse;

/// Create a copy of ProductOrderState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductAddToCartCopyWith<ProductAddToCart> get copyWith => _$ProductAddToCartCopyWithImpl<ProductAddToCart>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductAddToCart&&(identical(other.addToCartResponse, addToCartResponse) || other.addToCartResponse == addToCartResponse));
}


@override
int get hashCode => Object.hash(runtimeType,addToCartResponse);

@override
String toString() {
  return 'ProductOrderState.productAddToCart(addToCartResponse: $addToCartResponse)';
}


}

/// @nodoc
abstract mixin class $ProductAddToCartCopyWith<$Res> implements $ProductOrderStateCopyWith<$Res> {
  factory $ProductAddToCartCopyWith(ProductAddToCart value, $Res Function(ProductAddToCart) _then) = _$ProductAddToCartCopyWithImpl;
@useResult
$Res call({
 AddToCartResponseModel addToCartResponse
});




}
/// @nodoc
class _$ProductAddToCartCopyWithImpl<$Res>
    implements $ProductAddToCartCopyWith<$Res> {
  _$ProductAddToCartCopyWithImpl(this._self, this._then);

  final ProductAddToCart _self;
  final $Res Function(ProductAddToCart) _then;

/// Create a copy of ProductOrderState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? addToCartResponse = null,}) {
  return _then(ProductAddToCart(
null == addToCartResponse ? _self.addToCartResponse : addToCartResponse // ignore: cast_nullable_to_non_nullable
as AddToCartResponseModel,
  ));
}


}

/// @nodoc


class BuyProductNow implements ProductOrderState {
  const BuyProductNow(this.buyNowResponse);
  

 final  BuyNowResponseModel buyNowResponse;

/// Create a copy of ProductOrderState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BuyProductNowCopyWith<BuyProductNow> get copyWith => _$BuyProductNowCopyWithImpl<BuyProductNow>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BuyProductNow&&(identical(other.buyNowResponse, buyNowResponse) || other.buyNowResponse == buyNowResponse));
}


@override
int get hashCode => Object.hash(runtimeType,buyNowResponse);

@override
String toString() {
  return 'ProductOrderState.buyProductNow(buyNowResponse: $buyNowResponse)';
}


}

/// @nodoc
abstract mixin class $BuyProductNowCopyWith<$Res> implements $ProductOrderStateCopyWith<$Res> {
  factory $BuyProductNowCopyWith(BuyProductNow value, $Res Function(BuyProductNow) _then) = _$BuyProductNowCopyWithImpl;
@useResult
$Res call({
 BuyNowResponseModel buyNowResponse
});




}
/// @nodoc
class _$BuyProductNowCopyWithImpl<$Res>
    implements $BuyProductNowCopyWith<$Res> {
  _$BuyProductNowCopyWithImpl(this._self, this._then);

  final BuyProductNow _self;
  final $Res Function(BuyProductNow) _then;

/// Create a copy of ProductOrderState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? buyNowResponse = null,}) {
  return _then(BuyProductNow(
null == buyNowResponse ? _self.buyNowResponse : buyNowResponse // ignore: cast_nullable_to_non_nullable
as BuyNowResponseModel,
  ));
}


}

/// @nodoc


class CartItemQuantityChanged implements ProductOrderState {
  const CartItemQuantityChanged(this.response);
  

 final  CartItemUpdateQuantityResponseModel response;

/// Create a copy of ProductOrderState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CartItemQuantityChangedCopyWith<CartItemQuantityChanged> get copyWith => _$CartItemQuantityChangedCopyWithImpl<CartItemQuantityChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CartItemQuantityChanged&&(identical(other.response, response) || other.response == response));
}


@override
int get hashCode => Object.hash(runtimeType,response);

@override
String toString() {
  return 'ProductOrderState.cartItemQuantityChanged(response: $response)';
}


}

/// @nodoc
abstract mixin class $CartItemQuantityChangedCopyWith<$Res> implements $ProductOrderStateCopyWith<$Res> {
  factory $CartItemQuantityChangedCopyWith(CartItemQuantityChanged value, $Res Function(CartItemQuantityChanged) _then) = _$CartItemQuantityChangedCopyWithImpl;
@useResult
$Res call({
 CartItemUpdateQuantityResponseModel response
});




}
/// @nodoc
class _$CartItemQuantityChangedCopyWithImpl<$Res>
    implements $CartItemQuantityChangedCopyWith<$Res> {
  _$CartItemQuantityChangedCopyWithImpl(this._self, this._then);

  final CartItemQuantityChanged _self;
  final $Res Function(CartItemQuantityChanged) _then;

/// Create a copy of ProductOrderState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? response = null,}) {
  return _then(CartItemQuantityChanged(
null == response ? _self.response : response // ignore: cast_nullable_to_non_nullable
as CartItemUpdateQuantityResponseModel,
  ));
}


}

/// @nodoc


class PurchaseMade implements ProductOrderState {
  const PurchaseMade(this.response);
  

 final  MakePurchaseResponseModel response;

/// Create a copy of ProductOrderState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PurchaseMadeCopyWith<PurchaseMade> get copyWith => _$PurchaseMadeCopyWithImpl<PurchaseMade>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PurchaseMade&&(identical(other.response, response) || other.response == response));
}


@override
int get hashCode => Object.hash(runtimeType,response);

@override
String toString() {
  return 'ProductOrderState.purchaseMade(response: $response)';
}


}

/// @nodoc
abstract mixin class $PurchaseMadeCopyWith<$Res> implements $ProductOrderStateCopyWith<$Res> {
  factory $PurchaseMadeCopyWith(PurchaseMade value, $Res Function(PurchaseMade) _then) = _$PurchaseMadeCopyWithImpl;
@useResult
$Res call({
 MakePurchaseResponseModel response
});




}
/// @nodoc
class _$PurchaseMadeCopyWithImpl<$Res>
    implements $PurchaseMadeCopyWith<$Res> {
  _$PurchaseMadeCopyWithImpl(this._self, this._then);

  final PurchaseMade _self;
  final $Res Function(PurchaseMade) _then;

/// Create a copy of ProductOrderState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? response = null,}) {
  return _then(PurchaseMade(
null == response ? _self.response : response // ignore: cast_nullable_to_non_nullable
as MakePurchaseResponseModel,
  ));
}


}

// dart format on
