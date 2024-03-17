
import 'package:e_commerce_app/views/pages/tabs/source/order_source.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CompletedTab extends StatelessWidget {
  const CompletedTab({required this.user, super.key});
  final User? user;

  @override
  Widget build(BuildContext context) {
    return OrderSource(user, 'completed');
  }
}
