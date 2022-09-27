import 'package:tech_interview/features/checkout_show/data/dtos/card_data.dart';
import 'package:tech_interview/features/checkout_show/data/dtos/payment.dart';
import 'package:tech_interview/features/checkout_show/domain/entities/show_entity.dart';

class ItemOrdened {
  ShowEntity show;
  Payment payment;

  ItemOrdened({
    required this.show,
    required this.payment,
  });

  ItemOrdened copyWith({
    ShowEntity? show,
    Payment? payment,
    CardData? cardData,
  }) {
    return ItemOrdened(
      show: show ?? this.show,
      payment: payment ?? this.payment,
    );
  }
}
