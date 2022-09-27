import 'package:tech_interview/features/checkout_show/data/dtos/card_data.dart';
import 'package:tech_interview/features/checkout_show/data/dtos/show.dart';
import 'package:tech_interview/features/checkout_show/domain/entities/order.dart';

abstract class DataSourceCheckout {
  Future<List<Show>> getShows();
  Future<bool> executeCheckout(CardData cardData);
  Future<bool> executePayment(List<ItemOrdened> orden);
}
