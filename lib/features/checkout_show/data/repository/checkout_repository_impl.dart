import 'package:tech_interview/features/checkout_show/data/data_sources/data_source_checkout.dart';
import 'package:tech_interview/features/checkout_show/data/dtos/card_data.dart';
import 'package:tech_interview/features/checkout_show/data/dtos/show.dart';
import 'package:tech_interview/features/checkout_show/data/repository/checkout_repository.dart';
import 'package:tech_interview/features/checkout_show/domain/entities/order.dart';
import 'package:tech_interview/features/checkout_show/domain/entities/show_entity.dart';

class CheckoutRepositoryImpl implements CheckoutRepository {
  DataSourceCheckout dataSourceCheckout;

  CheckoutRepositoryImpl({required this.dataSourceCheckout});

  @override
  Future<bool> executeCheckout(CardData cardData) async {
    return await dataSourceCheckout.executeCheckout(cardData);
  }

  @override
  Future<bool> executePayment(List<ItemOrdened> payment) {
    return dataSourceCheckout.executePayment(payment);
  }

  @override
  Future<List<ShowEntity>> getShows() async {
    List<Show> listShows = await dataSourceCheckout.getShows();
    return listShows
        .map((e) => ShowEntity(
              nameShow: e.nameShow,
              descriptionShow: e.descriptionShow,
              priceShow: e.priceShow,
              serviceFee: e.serviceFee,
              orderProcessingFee: e.orderProcessingFee,
              deliveryPrice: e.deliveryPrice,
              notesFromSeller: e.notesFromSeller,
              addressShow: e.addressShow,
            ))
        .toList();
  }
}
