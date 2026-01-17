// payment_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:petcure_user_app/core/exports/bloc_exports.dart';
import 'package:petcure_user_app/modules/home_module/view/home_page.dart';
import 'package:petcure_user_app/core/enums/payment_purpose.dart';
import 'package:petcure_user_app/modules/payment_module/utils/payment_helper.dart';
import 'package:petcure_user_app/widgets/app_widget_export.dart';
import 'package:provider/provider.dart';

import 'package:petcure_user_app/core/theme/app_palette.dart';
import 'package:petcure_user_app/modules/payment_module/enums/payment_method.dart';
import 'package:petcure_user_app/modules/payment_module/providers/payment_provider.dart';

class PaymentPage extends StatefulWidget {
  final int? orderId;
  final int? appointmentId;
  final PaymentPurpose paymentPurpose;
  final String totalRate;
  const PaymentPage({
    super.key,
    this.orderId,
    this.appointmentId,
    required this.paymentPurpose,
    required this.totalRate,
  });

  @override
  State<PaymentPage> createState() => _PaymentPageState();

  static route({
    int? orderId,
    int? appointmentId,
    required PaymentPurpose paymentPurpose,
    required String totalRate,
  }) => MaterialPageRoute(
    builder: (context) => PaymentPage(
      orderId: orderId,
      appointmentId: appointmentId,
      paymentPurpose: paymentPurpose,
      totalRate: totalRate,
    ),
  );
}

class _PaymentPageState extends State<PaymentPage> {
  late final PaymentHelper _paymentHelper;

  @override
  void initState() {
    super.initState();
    _paymentHelper = PaymentHelper(
      context: context,
      orderId: widget.orderId,
      appointmentId: widget.appointmentId,
      paymentPurpose: widget.paymentPurpose,
      totalRate: widget.totalRate,
    );
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      context,
      designSize: const Size(375, 812),
      minTextAdapt: true,
    );

    return ChangeNotifierProvider(
      create: (context) => PaymentProvider(
        orderId: widget.orderId,
        appointmentId: widget.appointmentId,
        paymentPurpose: widget.paymentPurpose,
        totalRate: widget.totalRate,
      )..initializePaymentMethod(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            'Payment Option',
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
        body: BlocListener<PaymentBloc, PaymentState>(
          listener: (context, state) {
            switch (state) {
              case PaymentInitial _:
              case PaymentLoading _:
                OverlayLoader.show(context, message: 'Submitting payment...');
                break;
              case PaymentError(:final errorMessage):
                OverlayLoader.hide();
                CustomSnackBar.showError(context, message: errorMessage);
                break;
              case PaymentSuccess(:final response):
                OverlayLoader.hide();
                CustomSnackBar.showSuccess(context, message: response.message);
                Navigator.pushAndRemoveUntil(
                  context,
                  HomePage.route(),
                  (_) => false,
                );
            }
          },
          child: Consumer<PaymentProvider>(
            builder: (context, provider, child) {
              return SafeArea(
                child: Padding(
                  padding: EdgeInsets.all(16.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextField(
                        controller: provider.priceController,
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
                                'Choose Your transaction method',
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey,
                                ),
                              ),
                              SizedBox(height: 15.h),
                              DropdownButtonFormField<PaymentMethod>(
                                value: provider.selectedMethod,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8.r),
                                  ),
                                  contentPadding: EdgeInsets.symmetric(
                                    horizontal: 10.w,
                                    vertical: 12.h,
                                  ),
                                ),
                                items: provider.paymentMethodsForUI.map((
                                  methodData,
                                ) {
                                  return DropdownMenuItem<PaymentMethod>(
                                    value:
                                        methodData['method'] as PaymentMethod,
                                    child: Row(
                                      children: [
                                        Image.asset(
                                          methodData['image'] as String,
                                          width: 30.w,
                                          height: 30.h,
                                        ),
                                        SizedBox(width: 10.w),
                                        Text(
                                          methodData['name'] as String,
                                          style: TextStyle(fontSize: 14.sp),
                                        ),
                                      ],
                                    ),
                                  );
                                }).toList(),
                                onChanged: (PaymentMethod? newValue) {
                                  provider.setSelectedMethod(newValue);
                                },
                              ),
                              SizedBox(height: 20.h),
                              CustomButton(
                                buttonWidth: double.infinity,
                                backgroundColor: AppPalette.firstColor,
                                textColor: Colors.white,
                                labelText: 'Confirm Payment Method',
                                onClick: () =>
                                    _paymentHelper.makePayment(context),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
