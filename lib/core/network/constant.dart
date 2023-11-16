class ApiContest {
  static const String baseUrl = 'https://accept.paymob.com/api';
  static const String paymentApiKey =
      "ZXlKaGJHY2lPaUpJVXpVeE1pSXNJblI1Y0NJNklrcFhWQ0o5LmV5SmpiR0Z6Y3lJNklrMWxjbU5vWVc1MElpd2ljSEp2Wm1sc1pWOXdheUk2T1RNNE9ERXpMQ0p1WVcxbElqb2lhVzVwZEdsaGJDSjkuMzhSYjlGdll5a1RoV3BubE0yUGJzY3I5MTlqZE9zdnpqbmR4T0xlOHpyOVhuelFka25nM21penpYNXNtdXVqNm1oWHlTaTh2OXpHRXYwcC1NTExaYlE=";
  static const String getAuthToken = '/auth/tokens';
  static const getOrderId = '/ecommerce/orders';
  static const getPaymentRequest = '/acceptance/payment_keys';
  static const getRefCode = '/acceptance/payments/pay';
  static String visaUrl =
      '$baseUrl/acceptance/iframes/800735?payment_token=$finalToken';
  static String paymentFirstToken = '';

  static String paymentOrderId = '';

  static String finalToken = '';

  static const String integrationIdCard = '4337985';
  static const String integrationIdKiosk = '4339508';

  static String refCode = '';
}
