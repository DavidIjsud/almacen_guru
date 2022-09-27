import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tech_interview/features/checkout_show/domain/entities/order.dart';
import 'package:tech_interview/features/checkout_show/presentation/cubit/show/shows_cubit.dart';
import 'package:tech_interview/features/checkout_show/presentation/widgets/item_orden_summary.dart';

class DetailOrden extends StatefulWidget {
  DetailOrden({Key? key, required this.totalPayment}) : super(key: key);

  num totalPayment;

  @override
  State<DetailOrden> createState() => _DetailOrdenState();
}

class _DetailOrdenState extends State<DetailOrden> {
  @override
  Widget build(BuildContext context) {
    List<ItemOrdened> itemsOrder = context.read<ShowsCubit>().ordens;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Orden'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Text("Total  ${widget.totalPayment.toStringAsFixed(2)}"),
          const Divider(
            color: Colors.grey,
          ),
          Column(
            children: itemsOrder
                .where((ItemOrdened ordened) =>
                    ordened.payment.paymentAmount.totalTickets != 0)
                .map((ItemOrdened ordened) => ItemOrdenSummary(
                    numberTickets: ordened.payment.paymentAmount.totalTickets!,
                    total: context
                        .read<ShowsCubit>()
                        .getTotalAmountByShow(ordened.show),
                    notesFromSeller: ordened.show.notesFromSeller!))
                .toList(),
          )
        ],
      ),
    );
  }
}
