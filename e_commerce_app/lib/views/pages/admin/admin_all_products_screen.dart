import 'package:e_commerce_app/views/shared/buttons/button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdminAllProductScreen extends StatefulWidget {
  const AdminAllProductScreen({super.key});

  @override
  State<AdminAllProductScreen> createState() => _AdminAllProductScreenState();
}

class _AdminAllProductScreenState extends State<AdminAllProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Material(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Products',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),),
                    Button(buttonWidth: 50, text: 'Add'),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}