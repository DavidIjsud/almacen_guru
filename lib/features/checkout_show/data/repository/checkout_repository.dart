import 'package:tech_interview/features/checkout_show/data/dtos/card_data.dart';
import 'package:tech_interview/features/checkout_show/data/dtos/payment.dart';
import 'package:tech_interview/features/checkout_show/domain/entities/order.dart';
import 'package:tech_interview/features/checkout_show/domain/entities/show_entity.dart';

abstract class CheckoutRepository {
  Future<bool> executeCheckout(CardData cardData);
  Future<bool> executePayment(List<ItemOrdened> orden);
  Future<List<ShowEntity>> getShows();
}
