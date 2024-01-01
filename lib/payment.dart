import 'dart:math';

import 'package:chapasdk/chapasdk.dart';
import 'package:flutter/material.dart';

class Payment extends StatefulWidget {
  @override
  _PaymentState createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  var args;

  @override
  void initState() {
    Future.delayed(Duration.zero, () {
      setState(() {
        if (ModalRoute.of(context)?.settings.arguments != null) {
          args = ModalRoute.of(context)?.settings.arguments;
          print('message after payment');
          print(args['message']);
        }
      });
    });

    super.initState();
    // context.read<CheckoutPage>().getData();
  }

  // controllers
  TextEditingController amount = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Payment')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: amount,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Amount',
              ),
            ),
            SizedBox(height: 10),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(200, 50),
                ),
                onPressed: () async {
                  print("processing......" + amount.text);
                  Chapa result = await Chapa.paymentParameters(
                    context: context, // context
                    publicKey: 'CHASECK_TEST-fQkKrSJl9oBIrxe6ICgcKAV0mRfSGTQr',
                    currency: 'ETB',
                    amount: amount.text,
                    email: 'geme@gmail.com',
                    // phone: '+251911223344',
                    firstName: 'Geme',
                    lastName: 'Ela',
                    txRef:
                        '34shkdjhkjTXTHHgb' + Random().nextInt(10).toString(),
                    title: 'Payment',
                    desc: 'This is description',
                    namedRouteFallBack: '/checkout', // fall back route name
                  );
                  // result.initPayment();
                  // print(result.title);
                },
                child: const Text(
                  'Pay',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
