import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class PaymentDemo extends StatefulWidget {
  const PaymentDemo({Key? key}) : super(key: key);

  @override
  State<PaymentDemo> createState() => _PaymentDemoState();
}

class _PaymentDemoState extends State<PaymentDemo> {
  final Razorpay _razorpay = Razorpay();

  @override
  void initState() {
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
    // TODO: implement initState
    super.initState();
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    // Do something when payment succeeds
    log('SUCCESS');
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    // Do something when payment fails
    log('FAIL');
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    // Do something when an external wallet was selected
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("razorpay"),),
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              var options = {
                'key' : 'rzp_test_4Y7Nhiv0EAzD3m',
                'amount': 100,
                'name' : 'Acme Corp.',
                'description' : 'Fine T-Shirt',
                'prefill' : {
                  'contact' : '8888888888',
                  'email' : 'test@razorpay.com',
                }
              };
              _razorpay.open(options);
            }, child: const Text("Pay")),
      ),
    );
  }
}
