import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment_app/presntation/manager/states/payment_states.dart';

class PaymentCubit extends Cubit<PaymentStates> {
  PaymentCubit() : super(PaymentInitStates());

  static PaymentCubit get(context) => BlocProvider.of(context);
}
