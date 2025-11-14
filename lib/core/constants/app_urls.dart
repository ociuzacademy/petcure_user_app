class AppUrls {
  static const String baseUrl = 'https://k75h4jwq-8001.inc1.devtunnels.ms';
  static const String userUrl = '$baseUrl/user';

  static const String loginUrl = '$userUrl/login/';
  static const String userRegisterUrl = '$userUrl/user_registration/';

  static const String getPetCategoryListUrl = '$userUrl/view_pet_category/';
  static const String getPetSubCategoryListUrl =
      '$userUrl/view_pet_subcategory/';
  static const String addPetUrl = '$userUrl/add_pet/';

  static const String getUserPetsUrl = '$userUrl/user_pets/';
  static const String getPetDetailsUrl = '$userUrl/pet_details/';

  static const String getPetProductsListUrl = '$userUrl/view_all_products/';
  static const String getUserProfileDataUrl = '$userUrl/view_profile/';

  static const String getPetProductDetailsUrl = '$userUrl/product_details/';

  static const String editProfileUrl = '$userUrl/update_profile/';

  static const String getNearbyDoctorsListUrl = '$userUrl/nearby_doctors/';

  static const String updatePetUrl = '$userUrl/update_pet_details/';

  static const String addToCartUrl = '$userUrl/add_to_cart/';
  static const String buyNowUrl = '$userUrl/buy_now/';

  static const String getUserCartItemsUrl = '$userUrl/cart_items/';
  static const String updateCartItemQuantityUrl =
      '$userUrl/update_cart_quantity/';
  static const String makePurchaseUrl = '$userUrl/make_purchase/';

  static const String upiPaymentUrl = '$userUrl/upi-payment/';
  static const String cardPaymentUrl = '$userUrl/card-payment/';
}
