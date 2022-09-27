import 'package:flutter/material.dart';

class ItemOrdenSummary extends StatelessWidget {
  ItemOrdenSummary(
      {Key? key,
      required this.numberTickets,
      required this.notesFromSeller,
      required this.total})
      : super(key: key);

  int numberTickets;
  String notesFromSeller;
  num total;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Numero de tickets $numberTickets"),
        Text("Total $total"),
        Text("Nota from seller $notesFromSeller"),
        const SizedBox(
          height: 10.0,
        ),
        const Divider(
          color: Colors.grey,
        )
      ],
    );
  }
}
