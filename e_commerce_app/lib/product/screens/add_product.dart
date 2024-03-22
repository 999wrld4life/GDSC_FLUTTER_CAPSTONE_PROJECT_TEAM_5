import 'dart:io';

import 'package:e_commerce_app/product/bloc/product_bloc.dart';
import 'package:e_commerce_app/product/model/product.dart';
import 'package:e_commerce_app/product/screens/product_details_screen.dart';
import 'package:e_commerce_app/views/shared/buttons/button_with_icon.dart';
import 'package:e_commerce_app/views/shared/fonts/google_font.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

class AddProducts extends StatefulWidget {
  const AddProducts({super.key});

  @override
  State<AddProducts> createState() => _EditProductState();
}

class _EditProductState extends State<AddProducts> {
  _EditProductState() {
    _selectedSize = sizeOptions[0];
  }

  String _selectedSize = "";
  List<String> sizeOptions = ['small', 'medium', 'large'];
  late TextEditingController _nameController;
  late TextEditingController _descriptionController;
  late TextEditingController _priceController;
  late File _imageFile;
  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _descriptionController = TextEditingController();
    _priceController = TextEditingController();
    _imageFile = File('');
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    _priceController.dispose();
    super.dispose();
  }

  Future<void> _pickImage() async {
    var image = await _picker.pickImage(source: ImageSource.gallery);
    _imageFile = File(image!.path);
    setState(() {});
  }

  void _addProduct() {
    final productName = _nameController.text;
    final productDescription = _descriptionController.text;
    final productPrice = double.parse(_priceController.text);

    if (productName.isNotEmpty &&
        productDescription.isNotEmpty &&
        productPrice > 0 &&
        _imageFile.existsSync()) {
      final productEvent = AddProduct(
        product: Product(
          name: productName,
          description: productDescription,
          brand: '',
          toWhom: '',
          price: productPrice,
          star: 3.0,
          color: '',
          imageUrl: '',
          review: [],
          size: [],
        ),
        image: _imageFile,
      );

      BlocProvider.of<ProductBloc>(context).add(productEvent);
      // Navigator.pushReplacement(
      //   context,
      //   MaterialPageRoute(
      //     builder: (context) =>
      //         ProductDetailsScreen(product: productEvent.product),
      //   ),
      // );
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Invalid Input'),
            content:
                const Text('Please fill in all fields and select an image.'),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<ProductBloc, ProductState>(
        listener: (context, state) {
          if (state is ProductError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.errorMessage),
              ),
            );
          } else if (state is ProductAdded) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Product successfully added'),
              ),
            );
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
          if (state is ProductLoading) {
            return Center(
              child: CircularProgressIndicator(
                color: Colors.black,
              ),
            );
          } else {
            return Padding(
              padding: EdgeInsets.only(top: 100.h, left: 20.w, right: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(16.w, 0, 0, 15.h),
                    child: Text(
                      'Add Product',
                      textAlign: TextAlign.center,
                      style: textStyle(
                          24.sp,
                          Theme.of(context).colorScheme.inversePrimary,
                          FontWeight.bold,
                          1.2),
                    ),
                  ),
                  SizedBox(height: .4.h),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 8, 16, 2),
                    child: _imageFile.existsSync()
                        ? Image.file(
                            _imageFile,
                            fit: BoxFit.cover,
                            height: 80,
                            width: 80,
                          )
                        : SizedBox(
                            width: double.infinity,
                            height: 45.h,
                            child: OutlinedButton.icon(
                              onPressed: _pickImage,
                              style: OutlinedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                side: const BorderSide(
                                    color: Color.fromARGB(255, 74, 37, 161)),
                              ),
                              icon: Icon(
                                Icons.file_upload_outlined,
                                color: const Color.fromARGB(255, 74, 35, 161),
                                size: 30.sp,
                              ),
                              label: Text(
                                'Upload Product Picture',
                                style: textStyle(
                                    12.sp,
                                    const Color.fromARGB(255, 74, 35, 161),
                                    FontWeight.bold,
                                    1),
                              ),
                            ),
                          ),
                  ),
                  SizedBox(height: 16.h),
                  ListView(
                    shrinkWrap: true,
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(8.w, 8.h, 0, 0),
                        child: Text(
                          'Product Name',
                          style: textStyle(
                              12.sp,
                              Theme.of(context).colorScheme.inversePrimary,
                              FontWeight.bold,
                              1),
                        ),
                      ),
                      TextField(
                        controller: _nameController,
                        decoration: InputDecoration(
                          hintText: 'eg. Nike',
                          hintStyle: textStyle(
                              11.sp,
                              Theme.of(context).colorScheme.inversePrimary,
                              FontWeight.normal,
                              1),
                          prefixIcon: const Icon(Icons.verified_user_outlined),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(8.w, 22, 0, 0),
                        child: Text(
                          'Product Price',
                          style: textStyle(
                              12.sp,
                              Theme.of(context).colorScheme.inversePrimary,
                              FontWeight.bold,
                              1),
                        ),
                      ),
                      TextField(
                        controller: _priceController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: 'eg. \$300',
                          hintStyle: textStyle(
                              11.sp,
                              Theme.of(context).colorScheme.inversePrimary,
                              FontWeight.normal,
                              1),
                          prefixIcon: const Icon(Icons.verified_user_outlined),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(8.w, 16, 0, 0),
                        child: Text(
                          'Product Description',
                          style: textStyle(
                              12.sp,
                              Theme.of(context).colorScheme.inversePrimary,
                              FontWeight.bold,
                              1),
                        ),
                      ),
                      TextField(
                        controller: _descriptionController,
                        maxLines: 2,
                        decoration: InputDecoration(
                          hintText:
                              "eg. Lorem ipsum dolor sit omet,\nconsectetur adipiscing elit",
                          hintStyle: textStyle(
                              11.sp,
                              Theme.of(context).colorScheme.inversePrimary,
                              FontWeight.normal,
                              1),
                          prefixIcon: const Icon(Icons.verified_user_outlined),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(8.w, 16, 0, 0),
                        child: Text(
                          'Product Size',
                          style: textStyle(
                              12.sp,
                              Theme.of(context).colorScheme.inversePrimary,
                              FontWeight.bold,
                              1),
                        ),
                      ),
                      DropdownButtonFormField<String>(
                        value: _selectedSize,
                        hint: const Text(
                          'Select Size',
                        ),
                        items: sizeOptions.map((String size) {
                          return DropdownMenuItem<String>(
                            value: size,
                            child: Text(size),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            _selectedSize = value as String;
                          });
                        },
                        icon: const Icon(
                          Icons.arrow_drop_down_circle,
                        ),
                        dropdownColor: Colors.deepPurple.shade50,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.verified_user_outlined),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 70.h),
                  ButtonWithIcon(
                    text: 'Add Product',
                    onTap: _addProduct,
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
