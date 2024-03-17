import 'package:e_commerce_app/auth/bloc/auth_bloc.dart';
import 'package:e_commerce_app/auth/repositories/auth_repo.dart';
import 'package:e_commerce_app/views/pages/tabs/active_tab.dart';
import 'package:e_commerce_app/views/pages/tabs/cancel_tab.dart';
import 'package:e_commerce_app/views/pages/tabs/complete_tab.dart';
import 'package:e_commerce_app/views/shared/fonts/google_font.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  final AuthBloc _authBloc = AuthBloc(repo: AuthRepo());

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    User? user = _authBloc.repo.getCurrentUser();
    return DefaultTabController(
      length: 3,
      animationDuration: const Duration(seconds: 1),
      initialIndex: 1,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          toolbarHeight: 120,
          centerTitle: true,
          leading: Container(
            margin: const EdgeInsets.only(left: 10),
            child: CircleAvatar(
                radius: 20,
                backgroundColor: Colors.grey[300],
                child: IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: const Icon(
                    Icons.arrow_back,
                    size: 30,
                    color: Colors.black,
                  ),
                )),
          ),
          title: Text('Orders',
              style: textStyle(20.sp, Colors.black, FontWeight.bold, 1)),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TabBar(
                  indicatorWeight: 6,
                  labelColor: Colors.teal,
                  unselectedLabelColor: Colors.grey,
                  indicatorColor: const Color(0xFF6055D8),
                  tabs: [
                    Tab(
                      icon: Text(
                        'Active',
                        style: textStyle(
                            14.sp,
                            Theme.of(context).colorScheme.inversePrimary,
                            FontWeight.bold,
                            1),
                      ),
                    ),
                    Tab(
                      icon: Text(
                        'Completed',
                        style: textStyle(
                            14.sp,
                            Theme.of(context).colorScheme.inversePrimary,
                            FontWeight.bold,
                            1),
                      ),
                    ),
                    Tab(
                      icon: Text(
                        'Cancel',
                        style: textStyle(
                            14.sp,
                            Theme.of(context).colorScheme.inversePrimary,
                            FontWeight.bold,
                            1),
                      ),
                    ),
                  ]),
              Expanded(
                child: TabBarView(children: [
                  ActiveTab(user: user),
                  CompletedTab(user: user),
                  CancelTab(user: user),
                ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
