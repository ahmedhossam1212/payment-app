import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment_app/core/network/constant.dart';
import 'package:payment_app/core/network/dio_helper.dart';
import 'package:payment_app/presntation/manager/states/payment_states.dart';

class PaymentCubit extends Cubit<PaymentStates> {
  PaymentCubit() : super(PaymentInitStates());

  static PaymentCubit get(context) => BlocProvider.of(context);

  Future<void> getAuthToken() async {
    emit(GetAuthTokenLoadingState());
    DioHelper.postDio(
        url: ApiConstant.getAuthToken,
        data: {'api_key': ApiConstant.apiKey}).then((value) {
      ApiConstant.paymentFirstToken = value.data['token'];
      print("The token :${ApiConstant.paymentFirstToken}");
      emit(GetAuthTokenSuccessState());
    }).catchError((err) {
      print(err.toString());
      emit(GetAuthTokenErrState());
    });
  }

  Future getOrderId({
    required String fName,
    required String lName,
    required String email,
    required String phone,
    required String price,
  }) async {
    emit(GetOrderIdLoadingState());
    DioHelper.postDio(url: ApiConstant.orderId, data: {
      "auth_token": ApiConstant.paymentFirstToken,
      "delivery_needed": "false",
      "amount_cents": price,
      "currency": "EGP",
      "items": [],
    }).then((value) {
      ApiConstant.orderId = value.data['id'];
      getPaymentRequst(
          fName: fName, lName: lName, email: email, phone: phone, price: price);
      emit(GetOrderIdSuccessState());
    }).catchError((err) {
      print(err.toString());
      emit(GetOrderIdErrState());
    });
  }

  Future<void> getPaymentRequst({
    required String fName,
    required String lName,
    required String email,
    required String phone,
    required String price,
  }) async {
    emit(GetPaymentRequstLoadingState());
    DioHelper.postDio(url: ApiConstant.getPaymentId, data: {
      "auth_token": ApiConstant.paymentFirstToken,
      "amount_cents": price,
      "expiration": 3600,
      "order_id": ApiConstant.getOrderId,
      "billing_data": {
        "apartment": "NA",
        "email": email,
        "floor": "NA",
        "first_name": fName,
        "street": "NA",
        "building": "NA",
        "phone_number": phone,
        "shipping_method": "NA",
        "postal_code": "NA",
        "city": "NA",
        "country": "NA",
        "last_name": lName,
        "state": "NA"
      },
      "currency": "EGP",
      "integration_id": ApiConstant.cartId,
      "lock_order_when_paid": "false"
    }).then((value) {
      ApiConstant.finalToken = value.data['token'];
      emit(GetPaymentRequstSuccessState());
    }).catchError((err) {
      print(err.toString());
      emit(GetPaymentRequstErrState());
    });
  }

  Future<void> getRefCode() async {
    emit(GetRefCodeLoadingState());
    DioHelper.postDio(url: ApiConstant.getRefCode, data: {
      "source": {"identifier": "AGGREGATOR", "subtype": "AGGREGATOR"},
      "payment_token": ApiConstant.finalToken,
    }).then((value) {
      ApiConstant.getRefCode = value.data['id'];
      emit(GetRefCodeSuccessState());
    }).catchError((err) {
      print(err.toString());
      emit(GetRefCodeErrState());
    });
  }
}
