import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/auth/bloc/auth_bloc.dart';
import 'package:e_commerce_app/auth/repositories/auth_repo.dart';
import 'package:e_commerce_app/product/model/product.dart';
import 'package:e_commerce_app/product/screens/product_details_screen.dart';
import 'package:e_commerce_app/views/shared/fonts/google_font.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final AuthBloc _authBloc = AuthBloc(repo: AuthRepo());

  @override
  Widget build(BuildContext context) {
    User? user = _authBloc.repo.getCurrentUser();
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
          child: Column(
            children: [
              Row(
                children: [
                  CircleAvatar(
                    // backgroundColor: Colors.blue,
                    backgroundImage: NetworkImage(user?.photoURL ??
                        'https://icons.iconarchive.com/icons/papirus-team/papirus-status/256/avatar-default-icon.png'),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Hello,',
                      ),
                      Text(
                        user?.displayName ?? 'unknown',
                        style: textStyle(
                            20,
                            Theme.of(context).colorScheme.inversePrimary,
                            FontWeight.bold,
                            1),
                      ),
                    ],
                  ),
                  const Spacer(),
                  const Icon(Icons.notifications),
                ],
              ),
              Expanded(
                child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection('products')
                      .snapshots(),
                  builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
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
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, 
                        crossAxisSpacing: 8.0,
                        mainAxisSpacing: 8.0,
                      ),
                      itemCount: products.length,
                      itemBuilder: (context, index) {
                        final product = products[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    ProductDetailsScreen(product: product),
                              ),
                            );
                          },
                          child: Card(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.network(
                                  product.imageUrl,
                                  height: 90, 
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        product.name,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text('\$${product.price}'),
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
    );
  }
}
