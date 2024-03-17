import 'package:e_commerce_app/views/pages/tabs/source/order_source.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ActiveTab extends StatefulWidget {
  const ActiveTab({required this.user, super.key});
  final User? user;

  @override
  State<ActiveTab> createState() => _ActiveTabState();
}

class _ActiveTabState extends State<ActiveTab> {
  @override
  Widget build(BuildContext context) {
    return OrderSource(widget.user, 'active');
  
  }

 
}
