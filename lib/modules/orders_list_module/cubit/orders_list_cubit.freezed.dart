// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'orders_list_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$OrdersListState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrdersListState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'OrdersListState()';
}


}

/// @nodoc
class $OrdersListStateCopyWith<$Res>  {
$OrdersListStateCopyWith(OrdersListState _, $Res Function(OrdersListState) __);
}


/// Adds pattern-matching-related methods to [OrdersListState].
extension OrdersListStatePatterns on OrdersListState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( OrdersListInitial value)?  initial,TResult Function( OrdersListLoading value)?  ordersListLoading,TResult Function( OrdersListError value)?  ordersListError,TResult Function( OrdersListEmpty value)?  ordersListEmpty,TResult Function( OrdersListSuccess value)?  ordersListSuccess,required TResult orElse(),}){
final _that = this;
switch (_that) {
case OrdersListInitial() when initial != null:
return initial(_that);case OrdersListLoading() when ordersListLoading != null:
return ordersListLoading(_that);case OrdersListError() when ordersListError != null:
return ordersListError(_that);case OrdersListEmpty() when ordersListEmpty != null:
return ordersListEmpty(_that);case OrdersListSuccess() when ordersListSuccess != null:
return ordersListSuccess(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( OrdersListInitial value)  initial,required TResult Function( OrdersListLoading value)  ordersListLoading,required TResult Function( OrdersListError value)  ordersListError,required TResult Function( OrdersListEmpty value)  ordersListEmpty,required TResult Function( OrdersListSuccess value)  ordersListSuccess,}){
final _that = this;
switch (_that) {
case OrdersListInitial():
return initial(_that);case OrdersListLoading():
return ordersListLoading(_that);case OrdersListError():
return ordersListError(_that);case OrdersListEmpty():
return ordersListEmpty(_that);case OrdersListSuccess():
return ordersListSuccess(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( OrdersListInitial value)?  initial,TResult? Function( OrdersListLoading value)?  ordersListLoading,TResult? Function( OrdersListError value)?  ordersListError,TResult? Function( OrdersListEmpty value)?  ordersListEmpty,TResult? Function( OrdersListSuccess value)?  ordersListSuccess,}){
final _that = this;
switch (_that) {
case OrdersListInitial() when initial != null:
return initial(_that);case OrdersListLoading() when ordersListLoading != null:
return ordersListLoading(_that);case OrdersListError() when ordersListError != null:
return ordersListError(_that);case OrdersListEmpty() when ordersListEmpty != null:
return ordersListEmpty(_that);case OrdersListSuccess() when ordersListSuccess != null:
return ordersListSuccess(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  ordersListLoading,TResult Function( String errorMessage)?  ordersListError,TResult Function()?  ordersListEmpty,TResult Function( List<UserOrderListModel> orders)?  ordersListSuccess,required TResult orElse(),}) {final _that = this;
switch (_that) {
case OrdersListInitial() when initial != null:
return initial();case OrdersListLoading() when ordersListLoading != null:
return ordersListLoading();case OrdersListError() when ordersListError != null:
return ordersListError(_that.errorMessage);case OrdersListEmpty() when ordersListEmpty != null:
return ordersListEmpty();case OrdersListSuccess() when ordersListSuccess != null:
return ordersListSuccess(_that.orders);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  ordersListLoading,required TResult Function( String errorMessage)  ordersListError,required TResult Function()  ordersListEmpty,required TResult Function( List<UserOrderListModel> orders)  ordersListSuccess,}) {final _that = this;
switch (_that) {
case OrdersListInitial():
return initial();case OrdersListLoading():
return ordersListLoading();case OrdersListError():
return ordersListError(_that.errorMessage);case OrdersListEmpty():
return ordersListEmpty();case OrdersListSuccess():
return ordersListSuccess(_that.orders);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  ordersListLoading,TResult? Function( String errorMessage)?  ordersListError,TResult? Function()?  ordersListEmpty,TResult? Function( List<UserOrderListModel> orders)?  ordersListSuccess,}) {final _that = this;
switch (_that) {
case OrdersListInitial() when initial != null:
return initial();case OrdersListLoading() when ordersListLoading != null:
return ordersListLoading();case OrdersListError() when ordersListError != null:
return ordersListError(_that.errorMessage);case OrdersListEmpty() when ordersListEmpty != null:
return ordersListEmpty();case OrdersListSuccess() when ordersListSuccess != null:
return ordersListSuccess(_that.orders);case _:
  return null;

}
}

}

/// @nodoc


class OrdersListInitial implements OrdersListState {
  const OrdersListInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrdersListInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'OrdersListState.initial()';
}


}




/// @nodoc


class OrdersListLoading implements OrdersListState {
  const OrdersListLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrdersListLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'OrdersListState.ordersListLoading()';
}


}




/// @nodoc


class OrdersListError implements OrdersListState {
  const OrdersListError(this.errorMessage);
  

 final  String errorMessage;

/// Create a copy of OrdersListState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrdersListErrorCopyWith<OrdersListError> get copyWith => _$OrdersListErrorCopyWithImpl<OrdersListError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrdersListError&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,errorMessage);

@override
String toString() {
  return 'OrdersListState.ordersListError(errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $OrdersListErrorCopyWith<$Res> implements $OrdersListStateCopyWith<$Res> {
  factory $OrdersListErrorCopyWith(OrdersListError value, $Res Function(OrdersListError) _then) = _$OrdersListErrorCopyWithImpl;
@useResult
$Res call({
 String errorMessage
});




}
/// @nodoc
class _$OrdersListErrorCopyWithImpl<$Res>
    implements $OrdersListErrorCopyWith<$Res> {
  _$OrdersListErrorCopyWithImpl(this._self, this._then);

  final OrdersListError _self;
  final $Res Function(OrdersListError) _then;

/// Create a copy of OrdersListState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? errorMessage = null,}) {
  return _then(OrdersListError(
null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class OrdersListEmpty implements OrdersListState {
  const OrdersListEmpty();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrdersListEmpty);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'OrdersListState.ordersListEmpty()';
}


}




/// @nodoc


class OrdersListSuccess implements OrdersListState {
  const OrdersListSuccess(final  List<UserOrderListModel> orders): _orders = orders;
  

 final  List<UserOrderListModel> _orders;
 List<UserOrderListModel> get orders {
  if (_orders is EqualUnmodifiableListView) return _orders;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_orders);
}


/// Create a copy of OrdersListState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrdersListSuccessCopyWith<OrdersListSuccess> get copyWith => _$OrdersListSuccessCopyWithImpl<OrdersListSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrdersListSuccess&&const DeepCollectionEquality().equals(other._orders, _orders));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_orders));

@override
String toString() {
  return 'OrdersListState.ordersListSuccess(orders: $orders)';
}


}

/// @nodoc
abstract mixin class $OrdersListSuccessCopyWith<$Res> implements $OrdersListStateCopyWith<$Res> {
  factory $OrdersListSuccessCopyWith(OrdersListSuccess value, $Res Function(OrdersListSuccess) _then) = _$OrdersListSuccessCopyWithImpl;
@useResult
$Res call({
 List<UserOrderListModel> orders
});




}
/// @nodoc
class _$OrdersListSuccessCopyWithImpl<$Res>
    implements $OrdersListSuccessCopyWith<$Res> {
  _$OrdersListSuccessCopyWithImpl(this._self, this._then);

  final OrdersListSuccess _self;
  final $Res Function(OrdersListSuccess) _then;

/// Create a copy of OrdersListState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? orders = null,}) {
  return _then(OrdersListSuccess(
null == orders ? _self._orders : orders // ignore: cast_nullable_to_non_nullable
as List<UserOrderListModel>,
  ));
}


}

// dart format on
