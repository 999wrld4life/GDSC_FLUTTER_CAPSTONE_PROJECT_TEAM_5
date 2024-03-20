// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:chapa_unofficial/chapa_unofficial.dart';
import 'package:e_commerce_app/auth/bloc/auth_bloc.dart';
import 'package:e_commerce_app/auth/repositories/auth_repo.dart';
import 'package:e_commerce_app/user/bloc/user_bloc.dart';
import 'package:e_commerce_app/user/model/cart_model.dart';
import 'package:e_commerce_app/user/screens/order_summary.dart';
import 'package:e_commerce_app/views/shared/buttons/button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CheckOutScreen extends StatefulWidget {
  final List<Cart> orders;
  const CheckOutScreen({
    Key? key, required this.orders,
  }) : super(key: key);

  @override
  State<CheckOutScreen> createState() => _CheckOutScreenState();
}

class _CheckOutScreenState extends State<CheckOutScreen> {
  final AuthBloc _authBloc = AuthBloc(repo: AuthRepo());
  String message = '';

  double finalTotal = 0;
  void updateTotal(double total) {
    finalTotal = total;
  }

  Future<void> pay() async {
    String txRef = TxRefRandomGenerator.generate(prefix: 'Team-5');
    await Chapa.getInstance.startPayment(
      context: context,
      onInAppPaymentSuccess: (successMsg) {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('Payment successful')));
        message = 'successful';
      },
      onInAppPaymentError: (errorMsg) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('An Error has occurred')));
        message = 'error';
      },
      amount: finalTotal.toString(),
      currency: 'ETB',
      txRef: txRef,
    );
  }

  @override
  Widget build(BuildContext context) {
    User? user = _authBloc.repo.getCurrentUser();
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
              child: Padding(
            padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
            child: Column(
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    const Text(
                      'Check out',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  ],
                ),
                SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        child: const Padding(
                          padding:  EdgeInsets.only(
                              top: 20, left: 20, right: 20),
                          child: Row(
                            children: [
                              Icon(Icons.location_on_outlined),
                               SizedBox(
                                width: 20,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('325 15th Eighth Avenue, NewYork'),
                                  Text(
                                    'Saepe eaque fugiat ea voluptatum veniam',
                                    style: TextStyle(
                                      color: Colors.grey,
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        child: const Padding(
                          padding:  EdgeInsets.only(
                              top: 20, left: 20, right: 20),
                          child: Row(
                            children: [
                              Icon(Icons.access_time),
                               SizedBox(
                                width: 20,
                              ),
                              Text('6:00 pm, Wednesday 20'),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 250.h,
                      ),
                      OrderSummary(
                        onTotalChanged: updateTotal,
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Center(
                        child: GestureDetector(
                            onTap: () async {
                              await pay();
                                context.read<UserBloc>().add(AddOrderFromEvent(products: widget.orders, price: finalTotal,  userId: user!.uid));
                            },
                            child: Button(
                              buttonWidth: 330.w,
                              text: 'Pay now',
                            )),
                      )
                    ],
                  ),
                )
              ],
            ),
          )),
        );
      },
    );
  }
}
