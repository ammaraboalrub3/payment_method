import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:payment/features/checkout/data/models/payment_intent_input_model.dart';
import 'package:payment/features/checkout/domain/repos/checkout_repo.dart';

part 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  PaymentCubit(this.checkoutRepo) : super(PaymentInitial());
  final CheckoutRepo checkoutRepo;

  Future makePayment({
    required PaymentIntentInputModel paymentIntentInputModel,
  }) async {
    emit(PaymentLoading());
    var result = await checkoutRepo.makePayment(
      paymentIntentInputModel: paymentIntentInputModel,
    );
    result.fold(
      (l) {
        emit(PaymentFauiler(errorMessage: l.errorMessage));
      },
      (r) {
        emit(PaymentSuccess());
      },
    );
  }
}
