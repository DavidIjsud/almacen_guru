import 'package:flutter/material.dart';

class PaymentCheckout extends StatefulWidget {
  const PaymentCheckout({Key? key}) : super(key: key);

  @override
  State<PaymentCheckout> createState() => _DetailShowState();
}

class _DetailShowState extends State<PaymentCheckout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Payment'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Form(
            child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Name',
                  ),
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Card Number',
                  ),
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Expiration Date',
                  ),
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'CVV',
                  ),
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Zip Code',
                  ),
                ),
                ElevatedButton(onPressed: () {}, child: const Text('Pay'))
              ],
            ),
          ),
        ));
  }
}
