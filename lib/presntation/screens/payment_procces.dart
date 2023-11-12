import 'package:flutter/material.dart';

class PaymentProcces extends StatelessWidget {
  const PaymentProcces({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: const Text(
          "Payment Procces",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            InkWell(
              onTap: () {},
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                child: Center(
                  child: Image.network(
                    "https://img.freepik.com/premium-vector/vector-3d-black-nfc-payment-machine-with-approved-status-paper-check-receipt-wifi-wireless-payment-pos-terminal-machine-design-template-bank-payment-contactless-terminal-mockup-top-view_153563-6966.jpg?size=626&ext=jpg&uid=R123558966&ga=GA1.1.1751511546.1692913916&semt=ais",
                    fit: BoxFit.cover,
                    height: 300,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {},
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
                child: Center(
                    child: Image.network(
                  "https://img.freepik.com/premium-vector/black-electronic-credit-card-icon-finance-technology-isolated-white_3482-781.jpg?size=626&ext=jpg&uid=R123558966&ga=GA1.1.1751511546.1692913916&semt=ais",
                  fit: BoxFit.cover,
                  height: 300,
                )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
