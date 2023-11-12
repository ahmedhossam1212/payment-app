import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment_app/presntation/manager/cubit/payment_cubit.dart';
import 'package:payment_app/presntation/manager/states/payment_states.dart';
import 'package:payment_app/presntation/screens/payment_procces.dart';
import 'package:payment_app/presntation/widgets/form_field.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  final TextEditingController fNameController = TextEditingController();
  final TextEditingController lNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PaymentCubit()..getAuthToken(),
      child: BlocConsumer<PaymentCubit, PaymentStates>(
        listener: (context, state) {
          if (state is GetPaymentRequstSuccessState) {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const PaymentProcces(),
                ));
          }
        },
        builder: (context, state) {
          var cubit = PaymentCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0.0,
            ),
            body: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("SignUp",
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(fontSize: 30)),
                      Text("To Save Your Mony",
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(fontSize: 20, color: Colors.grey)),
                      const SizedBox(
                        height: 50,
                      ),
                      Image.network(
                        "https://paymob.com/images/logoC.png",
                        color: Colors.black,
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: defualtFormField(
                                controller: fNameController,
                                validate: (String value) {
                                  if (value.isEmpty) {
                                    return "this field required";
                                  }
                                },
                                label: "First Name",
                                type: TextInputType.name),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: defualtFormField(
                                controller: lNameController,
                                validate: (String value) {
                                  if (value.isEmpty) {
                                    return "this field required";
                                  }
                                },
                                label: "Last Name",
                                type: TextInputType.name),
                          ),
                        ],
                      ),
                      defualtFormField(
                          controller: emailController,
                          validate: (String value) {
                            if (value.isEmpty) {
                              return "this field required";
                            }
                          },
                          label: "Email",
                          type: TextInputType.emailAddress),
                      defualtFormField(
                          controller: phoneController,
                          validate: (String value) {
                            if (value.isEmpty) {
                              return "this field required";
                            }
                          },
                          label: "Phone",
                          type: TextInputType.number),
                      defualtFormField(
                          controller: priceController,
                          validate: (String value) {
                            if (value.isEmpty) {
                              return "this field required";
                            }
                          },
                          label: "Price",
                          type: TextInputType.number),
                      const SizedBox(
                        height: 40,
                      ),
                      MaterialButton(
                        height: 50,
                        elevation: 10.0,
                        minWidth: double.infinity,
                        color: Colors.black,
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            cubit.getPaymentRequst(
                                fName: fNameController.text,
                                lName: lNameController.text,
                                email: emailController.text,
                                phone: phoneController.text,
                                price: priceController.text);
                          }
                        },
                        child: const Text(
                          "Sign Up",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
