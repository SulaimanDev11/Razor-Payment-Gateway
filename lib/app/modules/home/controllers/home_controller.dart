import 'package:get/get.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class HomeController extends GetxController {
  Razorpay? razorpay;

  @override
  void onInit() {
    super.onInit();
    razorpay = Razorpay();
    razorpay!.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlerPaymentSuccess);
    razorpay!.on(Razorpay.EVENT_PAYMENT_ERROR, handlerPaymentError);
    razorpay!.on(Razorpay.EVENT_EXTERNAL_WALLET, handlerPaymentWallet);
  }

  void handlerPaymentSuccess() {
    print("Payement Success");
  }

  void handlerPaymentError() {
    print("Payement Error");
  }

  void handlerPaymentWallet() {
    print("Payement Wallet");
  }

  void openCheckout(amount) {
    var options = {
      "key": "rzp_test_s2yZnuYLcpqavi",
      "amount": amount,
      "name": "Sample App",
      "description": "Payment for the random product",
      "prefill": {
        "contact": "3351919767",
        "email": "sulaikhan12@gmail.com",
      },
      "external": {
        "wallets": ["paytm"]
      }
    };
    try {
      razorpay!.open(options);
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    razorpay!.clear();
  }
}
