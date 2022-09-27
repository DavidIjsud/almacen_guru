import 'package:tech_interview/features/checkout_show/data/dtos/card_data.dart';
import 'package:tech_interview/features/checkout_show/data/dtos/payment_amount.dart';

class Payment {
  final CardData cardData;
  final PaymentAmount paymentAmount;

  Payment({
    required this.cardData,
    required this.paymentAmount,
  });

  Payment copyWith({
    CardData? cardData,
    PaymentAmount? paymentAmount,
  }) {
    return Payment(
      cardData: cardData ?? this.cardData,
      paymentAmount: paymentAmount ?? this.paymentAmount,
    );
  }
}
