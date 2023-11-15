import 'package:flutter/material.dart';
import 'package:payment_app/core/network/constant.dart';

class ReferenceCodeScreen extends StatelessWidget {
  const ReferenceCodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
        elevation: 0.0,
        centerTitle: true,
        backgroundColor: Colors.white,
        title: const Text(
          "Reference Code",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Code",
              style: TextStyle(color: Colors.black, fontSize: 30),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
                width: 200,
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.black),
                child: Center(
                  child: Text(
                    ApiContest.refCode.isEmpty ? '🚫' : ApiContest.refCode,
                    style: const TextStyle(color: Colors.white, fontSize: 20),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
