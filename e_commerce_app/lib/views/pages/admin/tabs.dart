import 'package:e_commerce_app/views/pages/admin/admin_order_source_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AdminActiveTab extends StatefulWidget {
  const AdminActiveTab({required this.user, super.key});
  final User? user;

  @override
  State<AdminActiveTab> createState() => _AdminActiveTabState();
}

class _AdminActiveTabState extends State<AdminActiveTab> {
  @override
  Widget build(BuildContext context) {
    return adminOrderSource(widget.user, 'active');
  
  }

 
}

class AdminCancelTab extends StatelessWidget {
  const AdminCancelTab({required this.user, super.key});
  final User? user;

  @override
  Widget build(BuildContext context) {
    return adminOrderSource(user, 'cancel');
  }
}

class AdminCompletedTab extends StatelessWidget {
  const AdminCompletedTab({required this.user, super.key});
  final User? user;

  @override
  Widget build(BuildContext context) {
    return adminOrderSource(user, 'completed');
  }
}