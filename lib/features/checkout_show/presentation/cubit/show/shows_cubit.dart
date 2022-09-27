import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tech_interview/features/checkout_show/data/dtos/card_data.dart';
import 'package:tech_interview/features/checkout_show/data/dtos/payment.dart';
import 'package:tech_interview/features/checkout_show/data/dtos/payment_amount.dart';
import 'package:tech_interview/features/checkout_show/domain/entities/order.dart';
import 'package:tech_interview/features/checkout_show/domain/entities/show_entity.dart';
import 'package:tech_interview/features/checkout_show/domain/use_cases/fetch_shows_case.dart';
import 'package:collection/collection.dart';

part 'shows_state.dart';

class ShowsCubit extends Cubit<ShowsState> {
  final FetchShowCase fetchShowCase;
  final List<ItemOrdened> _ordens = [];
  ShowsCubit({required this.fetchShowCase}) : super(ShowsInitial());

  int amountTicketsByShow(ShowEntity show) {
    ItemOrdened? itemOrdened = _ordens.firstWhereOrNull(
        (ItemOrdened item) => item.show.nameShow == show.nameShow);
    return itemOrdened?.payment.paymentAmount.totalTickets ?? 0;
  }

  List<ItemOrdened> get ordens => _ordens;

  num getTotalAmount() {
    num totalAmount = 0;
    for (ItemOrdened item in _ordens) {
      totalAmount += item.payment.paymentAmount.totalAmount!;
    }
    return totalAmount;
  }

  num getTotalAmountByShow(ShowEntity show) {
    ItemOrdened? itemOrdened = _ordens.firstWhereOrNull(
        (ItemOrdened item) => item.show.nameShow == show.nameShow);
    return itemOrdened?.payment.paymentAmount.totalAmount ?? 0;
  }

  void removeShow(ShowEntity show) {
    ItemOrdened? itemOrdened = _ordens.firstWhereOrNull(
        (ItemOrdened item) => item.show.nameShow == show.nameShow);
    if (itemOrdened == null) return;
    int amountTickets = itemOrdened.payment.paymentAmount.totalTickets!;
    if (amountTickets == 0) return;
    int tickets = itemOrdened.payment.paymentAmount.totalTickets! - 1;
    PaymentAmount paymentAmount = itemOrdened.payment.paymentAmount.copyWith(
        totalTickets: itemOrdened.payment.paymentAmount.totalTickets! - 1,
        totalAmount: show.priceShow * tickets);
    int indexOf = _ordens.indexOf(itemOrdened);
    _ordens[indexOf] = itemOrdened.copyWith(
        payment: itemOrdened.payment.copyWith(paymentAmount: paymentAmount));
    emit(ListOrdersChanged(ordens: _ordens));
  }

  void addShow(ShowEntity show) {
    ItemOrdened? itemOrdened = _ordens.firstWhereOrNull(
        (ItemOrdened item) => item.show.nameShow == show.nameShow);
    if (itemOrdened == null) {
      _ordens.add(ItemOrdened(
          show: show,
          payment: Payment(
              cardData: CardData(),
              paymentAmount: PaymentAmount(
                  totalTickets: 1,
                  totalAmountWithFees: show.priceShow + show.serviceFee,
                  totalAmountWithFeesAndOrderProcessingFee: show.priceShow +
                      show.serviceFee +
                      show.orderProcessingFee +
                      show.deliveryPrice,
                  totalAmount: show.priceShow))));
      emit(ListOrdersChanged(ordens: _ordens));
    } else {
      int totalTickets = itemOrdened.payment.paymentAmount.totalTickets! + 1;
      PaymentAmount paymentAmount = itemOrdened.payment.paymentAmount.copyWith(
          totalTickets: itemOrdened.payment.paymentAmount.totalTickets! + 1,
          totalAmount: show.priceShow * totalTickets);
      int indexOf = _ordens.indexOf(itemOrdened);
      _ordens[indexOf] = itemOrdened.copyWith(
          payment: itemOrdened.payment.copyWith(paymentAmount: paymentAmount));
      emit(ListOrdersChanged(ordens: _ordens));
    }
  }

  Future<void> fetchShows() async {
    emit(ShowsLoading());
    try {
      final shows = await fetchShowCase.fetchShows();
      emit(ShowsLoaded(shows: shows));
    } catch (e) {
      emit(ShowsErrorLoading(message: e.toString()));
    }
  }
}
