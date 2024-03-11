import 'dart:io';

import 'package:e_commerce_app/product/bloc/product_bloc.dart';
import 'package:e_commerce_app/product/model/product.dart';
import 'package:e_commerce_app/product/screens/product_details_screen.dart';
import 'package:e_commerce_app/views/shared/buttons/button_with_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
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
    _imageFile =
        File(''); 
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
          brand:
              '', 
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
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) =>
              ProductDetailsScreen(product: productEvent.product),
        ),
      );
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
      appBar: AppBar(
        title: const Text('Add Product'),
      ),
      body: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  controller: _nameController,
                  decoration: const InputDecoration(labelText: 'Product Name'),
                ),
                TextField(
                  controller: _descriptionController,
                  decoration:
                      const InputDecoration(labelText: 'Product Description'),
                ),
                TextField(
                  controller: _priceController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(labelText: 'Product Price'),
                ),
                const SizedBox(height: 16),
                GestureDetector(
                  onTap: _pickImage,
                  child: Container(
                    height: 100,
                    width: 100,
                    color: Colors.grey,
                    child: _imageFile.existsSync()
                        ? Image.file(
                            _imageFile,
                            fit: BoxFit.cover,
                          )
                        : const Icon(Icons.add_a_photo,
                            size: 40, color: Colors.white),
                  ),
                ),
                const SizedBox(height: 16),
                ButtonWithIcon(
                  text: 'Add Product',
                  onTap: _addProduct,
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
