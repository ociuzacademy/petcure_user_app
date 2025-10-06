// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:petcure_user_app/core/theme/app_palette.dart';
import 'package:petcure_user_app/modules/payment_module/utils/payment_helper.dart';
import 'package:petcure_user_app/widgets/buttons/custom_button.dart';

class PaymentPage extends StatefulWidget {
  final String orderId;
  final double totalRate;
  const PaymentPage({
    super.key,
    required this.orderId,
    required this.totalRate,
  });

  @override
  State<PaymentPage> createState() => _PaymentPageState();

  static route({required String orderId, required double totalRate}) =>
      MaterialPageRoute(
        builder: (context) =>
            PaymentPage(orderId: orderId, totalRate: totalRate),
      );
}

class _PaymentPageState extends State<PaymentPage> {
  late final PaymentHelper _paymentHelper;
  late final ValueNotifier<String?> _selectedMethod;
  final List<Map<String, String>> methods = [
    {'name': 'UPI', 'image': 'assets/icons/icons8-google-pay-48.png'},
    {
      'name': 'Credit/Debit Cards',
      'image': 'assets/icons/icons8-credit-card-48.png',
    },
  ];
  late TextEditingController pricecontroller;

  @override
  void initState() {
    super.initState();
    _selectedMethod = ValueNotifier<String?>(
      methods.isNotEmpty ? methods.first['name'] : null,
    );
    pricecontroller = TextEditingController(
      text: widget.totalRate.toStringAsFixed(2),
    );
    _paymentHelper = PaymentHelper(
      context: context,
      orderId: widget.orderId,
      totalRate: widget.totalRate,
      selectedMethod: _selectedMethod,
    );
  }

  @override
  void dispose() {
    pricecontroller.dispose();
    _selectedMethod.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      context,
      designSize: const Size(375, 812),
      minTextAdapt: true,
    );

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Payment Option",
          style: TextStyle(fontSize: 18.sp, color: Colors.black),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back, size: 20.sp, color: Colors.black),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: pricecontroller,
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: '₹0',
              ),
              style: TextStyle(fontSize: 70.sp),
              readOnly: true,
            ),
            SizedBox(height: 20.h),
            const Spacer(),
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Padding(
                padding: EdgeInsets.all(16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Choose Your transaction method",
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(height: 15.h),
                    ValueListenableBuilder(
                      valueListenable: _selectedMethod,
                      builder: (context, selectedMethod, child) {
                        return DropdownButtonFormField<String>(
                          value: selectedMethod,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 10.w,
                              vertical: 12.h,
                            ),
                          ),
                          items: methods.map((bank) {
                            return DropdownMenuItem<String>(
                              value: bank['name'],
                              child: Row(
                                children: [
                                  Image.asset(
                                    bank['image']!,
                                    width: 30.w,
                                    height: 30.h,
                                  ),
                                  SizedBox(width: 10.w),
                                  Text(
                                    bank['name']!,
                                    style: TextStyle(fontSize: 14.sp),
                                  ),
                                ],
                              ),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              _selectedMethod.value = newValue;
                            });
                          },
                        );
                      },
                    ),
                    SizedBox(height: 20.h),

                    SizedBox(height: 20.h),
                    CustomButton(
                      buttonWidth: double.infinity,
                      backgroundColor: AppPalette.firstColor,
                      textColor: Colors.white,
                      labelText: "Confirm Payment Method",
                      onClick: _paymentHelper.makePayment,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
