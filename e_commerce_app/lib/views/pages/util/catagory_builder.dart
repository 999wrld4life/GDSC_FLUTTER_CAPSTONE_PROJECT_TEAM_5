import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/product/model/product.dart';
import 'package:e_commerce_app/product/screens/details.dart';
import 'package:e_commerce_app/views/shared/fonts/google_font.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CatagoryBuilder extends StatefulWidget {
  const CatagoryBuilder({super.key});

  @override
  State<CatagoryBuilder> createState() => _CatagoryBuilderState();
}

class _CatagoryBuilderState extends State<CatagoryBuilder> {
  final List<bool> _favList = [];
  final List<Product> _likedProductList = [];

  void createFavList(int lenght) {
    for (int i = 0; i < lenght; i++) {
      _favList.add(false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120.h,
      child: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('products').snapshots(),
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
            Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
            return Product.fromMap(data, id: doc.id);
          }).toList();
          createFavList(products.length);

          return GridView.builder(
            scrollDirection: Axis.horizontal,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
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
                          DetailsPage(product: product),
                    ),
                  );
                },
                child: Container(
                  margin: const EdgeInsets.only(right: 10),
                  height: 320,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(248, 247, 247, 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(12),
                                topRight: Radius.circular(12)),
                            child: Image.network(
                              product.imageUrl,
                              height: 100,
                              width: double.infinity,
                              fit: BoxFit.fill,
                            ),
                          ),
                          Positioned(
                            top: 4.h,
                            right: 8.w,
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  _favList[index] = !_favList[index];
                                  _favList[index]
                                      ? _likedProductList.add(product)
                                      : _likedProductList.remove(product);
                                });
                              },
                              child: Icon(
                                _favList[index]
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                                size: 35,
                                color: _favList[index]
                                    ? Colors.pink
                                    : Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              product.name,
                              style: textStyle(
                                  15.sp,
                                  Theme.of(context).colorScheme.inversePrimary,
                                  FontWeight.bold,
                                  1.1),
                            ),
                            Text(
                              '\$${product.price}',
                              style: const TextStyle(
                                  color: Color(0xFF6055D8),
                                  fontWeight: FontWeight.bold),
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
    );
  }
}
