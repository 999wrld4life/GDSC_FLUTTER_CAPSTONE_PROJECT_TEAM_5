import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/auth/bloc/auth_bloc.dart';
import 'package:e_commerce_app/auth/repositories/auth_repo.dart';
import 'package:e_commerce_app/product/model/product.dart';
import 'package:e_commerce_app/product/screens/add_product.dart';
import 'package:e_commerce_app/product/screens/add_product_screen.dart';
import 'package:e_commerce_app/views/pages/admin/tabs.dart';
import 'package:e_commerce_app/views/pages/tabs/active_tab.dart';
import 'package:e_commerce_app/views/pages/tabs/cancel_tab.dart';
import 'package:e_commerce_app/views/pages/tabs/complete_tab.dart';
import 'package:e_commerce_app/views/shared/buttons/button.dart';
import 'package:e_commerce_app/views/shared/fonts/google_font.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AdminScreen extends StatefulWidget {
  const AdminScreen({super.key});

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  final AuthBloc _authBloc = AuthBloc(repo: AuthRepo());
  String selectedPage = 'dashboard';

  Future<int> getUserCount() async {
    return await _authBloc.repo.getNumberOfUsers();
  }

  @override
  Widget build(BuildContext context) {
    User? user = _authBloc.repo.getCurrentUser();

    return Scaffold(
      backgroundColor: Color.fromRGBO(248, 247, 247, 1),
      appBar: AppBar(
        title: const Text(
          'Admin Panel',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w600,
          ),
        ),
        leading: Builder(
          builder: (context) => IconButton(
            icon: Padding(
              padding: const EdgeInsets.all(9.0),
              child: Container(
                  // color: Colors.white,
                  child: const Icon(
                Icons.apps_rounded,
                // color: Colors.grey,
                size: 30,
              )),
            ),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        centerTitle: true,
        actions: const[
           Padding(
            padding:  EdgeInsets.only(right: 20),
            child: Icon(
              Icons.notifications,
              size: 30,
            ),
          )
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text(
                user!.displayName!,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              accountEmail: Text(
                user.email!,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(user.photoURL!),
              ),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    'assets/bg.jpg',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                leading: const Icon(Icons.dashboard),
                title: const Text("Dashboard"),
                onTap: () {
                  setState(() {
                    selectedPage = 'dashboard';
                  });
                  Navigator.pop(context);
                },
              ),
            ),
            ListTile(
              leading: Icon(Icons.category_rounded),
              title: Text("All Products"),
              onTap: () {
                setState(() {
                  selectedPage = 'AllProducts';
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.corporate_fare_outlined),
              title: Text("Orders"),
              onTap: () {
                setState(() {
                  selectedPage = 'Orders';
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.notifications_rounded),
              title: Text("Notifications"),
              onTap: () {
                setState(() {
                  selectedPage = 'Notifications';
                });
              },
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text("Profile"),
              onTap: () {
                setState(() {
                  selectedPage = 'Profile';
                });
              },
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.4,
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text("Logout"),
              onTap: () async {
                await _authBloc.repo.signOut();
              },
            ),
          ],
        ),
      ),
      body: adminBody(context, selectedPage, user),
    );
  }

  Widget adminBody(BuildContext context, String selectedPage, User user) {
    if (selectedPage == 'dashboard') {
      return Padding(
        padding: const EdgeInsets.only(top: 50, right: 20, left: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              GridView(
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 8.0,
                ),
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Material(
                      elevation: 5,
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                              FutureBuilder<int>(
                                future: getUserCount(),
                                builder: (context, snapshot) {
                                  if (snapshot.hasData) {
                                    return Text(
                                      '${snapshot.data!}+ ',
                                      style: const TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    );
                                  } else {
                                    return const Text(
                                      "Loading...",
                                      style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    );
                                  }
                                },
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            const Text('Users')
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Material(
                      elevation: 5,
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '200+',
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Text('Orders')
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Material(
                      elevation: 5,
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '\$ 314,000+',
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Text('Total Sales')
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Material(
                      elevation: 5,
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '\$ 97,000+',
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Text('Profit')
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Material(
                elevation: 5,
                borderRadius: BorderRadius.circular(30),
                child: Container(
                  color: Color.fromRGBO(245, 247, 247, 1),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Material(
                          // elevation: 1,
                          borderRadius: BorderRadius.circular(10),
                          child: Container(
                            height: 270,
                            width: MediaQuery.of(context).size.width * 0.45,
                            child: Image.asset(
                              'assets/1.png',
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Material(
                              elevation: 1,
                              borderRadius: BorderRadius.circular(10),
                              child: Container(
                                height: 130,
                                width: MediaQuery.of(context).size.width * 0.4,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(18.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text('Total income'),
                                          Icon(Icons.more_horiz),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 10, right: 20, left: 20),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            '\$ 314,000',
                                            style: TextStyle(
                                              color: Colors.blueAccent,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20,
                                            ),
                                          ),
                                          Column(
                                            children: [
                                              Icon(
                                                Icons.trending_up,
                                                color: Colors.blueAccent,
                                              ),
                                              Text(
                                                '+32%',
                                                style: TextStyle(
                                                  color: Colors.blueAccent,
                                                  fontWeight: FontWeight.bold,
                                                  // fontSize: 20,
                                                ),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Material(
                              elevation: 1,
                              borderRadius: BorderRadius.circular(10),
                              child: Container(
                                height: 130,
                                width: MediaQuery.of(context).size.width * 0.4,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(18.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text('Total profit'),
                                          Icon(Icons.more_horiz),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 10, right: 20, left: 20),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            '\$ 97,020',
                                            style: TextStyle(
                                              color: Colors.blueAccent,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20,
                                            ),
                                          ),
                                          Column(
                                            children: [
                                              Icon(
                                                Icons.trending_up,
                                                color: Colors.blueAccent,
                                              ),
                                              Text(
                                                '+12%',
                                                style: TextStyle(
                                                  color: Colors.blueAccent,
                                                  fontWeight: FontWeight.bold,
                                                  // fontSize: 20,
                                                ),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Material(
                elevation: 5,
                borderRadius: BorderRadius.circular(10),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Latest activities',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          Icon(Icons.more_vert),
                        ],
                      ),
                    ),
                    Divider(
                      color: Colors.grey,
                    ),
                    Column(
                      children: [
                        ListTile(
                          leading: Icon(
                            Icons.person,
                            color: Colors.red,
                          ),
                          title: Text('Order'),
                          subtitle: Text('Hoodie'),
                          trailing: Text('12:00 PM'),
                        ),
                        ListTile(
                          leading: Icon(
                            Icons.person,
                            color: Colors.blue,
                          ),
                          title: Text('Order'),
                          subtitle: Text('Hoodie'),
                          trailing: Text('12:00 PM'),
                        ),
                        ListTile(
                          leading: Icon(
                            Icons.person,
                            color: Colors.green,
                          ),
                          title: Text('Order'),
                          subtitle: Text('Hoodie'),
                          trailing: Text('12:00 PM'),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      );
    } else if (selectedPage == 'AllProducts') {
      return Padding(
        padding: EdgeInsets.only(top: 50, right: 20, left: 20),
        child: SingleChildScrollView(
          child: Material(
            elevation: 5,
            borderRadius: BorderRadius.circular(20),
            child: Padding(
              padding: EdgeInsets.all(12.0),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(1.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Products',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => AddProducts(),
                                  ));
                            },
                            child: Button(buttonWidth: 100, text: 'Add')),
                      ],
                    ),
                  ),
                  const Divider(),
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            labelText: 'Search',
                            prefixIcon: Icon(Icons.search),
                          ),
                        ),
                      ),
                      IconButton(onPressed: () {}, icon: Icon(Icons.edit)),
                      IconButton(onPressed: () {}, icon: Icon(Icons.delete)),
                    ],
                  ),
                  Divider(),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.8,
                    child: StreamBuilder(
                      stream: FirebaseFirestore.instance
                          .collection('products')
                          .snapshots(),
                      builder:
                          (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        if (snapshot.hasError) {
                          return Center(
                            child: Text(snapshot.error.toString()),
                          );
                        }
                        final products = snapshot.data!.docs.map((doc) {
                          Map<String, dynamic> data =
                              doc.data() as Map<String, dynamic>;
                          return Product.fromMap(data);
                        }).toList();
                        return GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 8.0,
                            mainAxisSpacing: 8.0,
                          ),
                          itemCount: products.length,
                          itemBuilder: (context, index) {
                            final product = products[index];
                            return GestureDetector(
                              onTap: () {},
                              child: Material(
                                elevation: 5,
                                borderRadius: BorderRadius.circular(10),
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Stack(
                                      children: [
                                        Container(
                                          height: 100,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: NetworkImage(
                                                  product.imageUrl),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          top: 8,
                                          right: 8,
                                          child: IconButton(
                                            onPressed: () {},
                                            icon: const Icon(
                                                Icons.circle_outlined),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            product.name,
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          SizedBox(height: 4),
                                          Text(
                                            '\$${product.price.toString()}',
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.blue,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      );
    } else if (selectedPage == 'Orders') {
      return DefaultTabController(
        length: 3,
        animationDuration: const Duration(seconds: 1),
        initialIndex: 1,
        child: Padding(
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
                  AdminActiveTab(user: user),
                  AdminCompletedTab(user: user),
                  AdminCancelTab(user: user),
                ]),
              )
            ],
          ),
        ),
      );
    }
    return Container();
  }
}
