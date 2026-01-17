// payment_provider.dart
import 'package:flutter/material.dart';
import 'package:petcure_user_app/core/enums/payment_purpose.dart';
import 'package:petcure_user_app/modules/payment_module/classes/card_data.dart';
import 'package:petcure_user_app/modules/payment_module/classes/order_data.dart';
import 'package:petcure_user_app/modules/payment_module/classes/u_p_i_data.dart';
import 'package:petcure_user_app/modules/payment_module/enums/payment_method.dart';

class PaymentProvider with ChangeNotifier {
  // Payment method state using enum
  PaymentMethod? _selectedMethod;
  final List<Map<PaymentMethod, String>> _paymentMethods = [
    {PaymentMethod.upi: 'assets/icons/icons8-google-pay-48.png'},
    {PaymentMethod.card: 'assets/icons/icons8-credit-card-48.png'},
  ];

  // Form state
  final GlobalKey<FormState> _cardFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _upiFormKey = GlobalKey<FormState>();

  // Text controllers
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _cardNameController = TextEditingController();
  final TextEditingController _cardNumberController = TextEditingController();
  final TextEditingController _expiryDateController = TextEditingController();
  final TextEditingController _cvvController = TextEditingController();
  final TextEditingController _upiController = TextEditingController();

  // Order details
  final int? _orderId;
  final int? _appointmentId;
  final PaymentPurpose _paymentPurpose;
  final String _totalRate;

  PaymentProvider({
    int? orderId,
    required String totalRate,
    int? appointmentId,
    required PaymentPurpose paymentPurpose,
  }) : _orderId = orderId,
       _totalRate = totalRate,
       _appointmentId = appointmentId,
       _paymentPurpose = paymentPurpose {
    // Initialize price controller with total rate
    _priceController.text = double.parse(totalRate).toStringAsFixed(2);
  }

  // Getters
  PaymentMethod? get selectedMethod => _selectedMethod;
  List<Map<PaymentMethod, String>> get paymentMethods => _paymentMethods;
  GlobalKey<FormState> get cardFormKey => _cardFormKey;
  GlobalKey<FormState> get upiFormKey => _upiFormKey;
  TextEditingController get priceController => _priceController;
  TextEditingController get cardNameController => _cardNameController;
  TextEditingController get cardNumberController => _cardNumberController;
  TextEditingController get expiryDateController => _expiryDateController;
  TextEditingController get cvvController => _cvvController;
  TextEditingController get upiController => _upiController;
  int? get orderId => _orderId;
  int? get appointmentId => _appointmentId;
  PaymentPurpose get paymentPurpose => _paymentPurpose;
  String get totalRate => _totalRate;

  // Get payment methods for UI (converts enum to display name)
  List<Map<String, dynamic>> get paymentMethodsForUI {
    return _paymentMethods.map((methodMap) {
      final method = methodMap.keys.first;
      final image = methodMap.values.first;
      return {
        'method': method,
        'name': _getDisplayName(method),
        'image': image,
      };
    }).toList();
  }

  // Helper to get display name from enum
  String _getDisplayName(PaymentMethod method) {
    switch (method) {
      case PaymentMethod.upi:
        return 'UPI';
      case PaymentMethod.card:
        return 'Credit/Debit Cards';
    }
  }

  // Setters
  void setSelectedMethod(PaymentMethod? method) {
    _selectedMethod = method;
    notifyListeners();
  }

  void setSelectedMethodFromString(String? methodString) {
    _selectedMethod = PaymentMethod.tryFromLabel(methodString);
    notifyListeners();
  }

  // Payment method selection
  void initializePaymentMethod() {
    if (_paymentMethods.isNotEmpty) {
      _selectedMethod = _paymentMethods.first.keys.first;
    }
    notifyListeners();
  }

  // Card payment validation
  CardData? validateCardPayment() {
    if (_cardFormKey.currentState!.validate()) {
      final String cardHolderName = _cardNameController.text.trim();
      final String cardNumber = _cardNumberController.text.replaceAll(' ', '');
      final String expiryDate = _expiryDateController.text.trim();
      final String cvvNumber = _cvvController.text.trim();
      return CardData(
        orderData: OrderData(
          orderId: orderId,
          appointmentId: appointmentId,
          paymentPurpose: paymentPurpose,
          amount: _totalRate,
        ),
        cardHolderName: cardHolderName,
        cardNumber: cardNumber,
        expiryDate: expiryDate,
        cvvNumber: cvvNumber,
      );
    } else {
      return null;
    }
  }

  // UPI payment validation
  UPIData? validateUPIPayment() {
    if (_upiFormKey.currentState!.validate()) {
      final String upiId = _upiController.text.trim();
      return UPIData(
        orderData: OrderData(
          orderId: orderId,
          appointmentId: appointmentId,
          paymentPurpose: paymentPurpose,
          amount: _totalRate,
        ),
        upiId: upiId,
      );
    } else {
      return null;
    }
  }

  // Card name formatting (uppercase)
  void formatCardName(String? value) {
    if (value == null || value.isEmpty) return;

    _cardNameController.value = _cardNameController.value.copyWith(
      text: value.toUpperCase(),
      selection: TextSelection.collapsed(offset: value.length),
    );
    notifyListeners();
  }

  // Clear all form data
  void clearAllForms() {
    _cardNameController.clear();
    _cardNumberController.clear();
    _expiryDateController.clear();
    _cvvController.clear();
    _upiController.clear();
    notifyListeners();
  }

  // Reset payment state
  void resetPayment() {
    _selectedMethod = _paymentMethods.isNotEmpty
        ? _paymentMethods.first.keys.first
        : null;
    clearAllForms();
    notifyListeners();
  }

  // Get selected method as string for APIs
  String? get selectedMethodString => _selectedMethod?.toJson();

  // Check if a specific method is selected
  bool isMethodSelected(PaymentMethod method) => _selectedMethod == method;

  @override
  void dispose() {
    _priceController.dispose();
    _cardNameController.dispose();
    _cardNumberController.dispose();
    _expiryDateController.dispose();
    _cvvController.dispose();
    _upiController.dispose();
    super.dispose();
  }
}
