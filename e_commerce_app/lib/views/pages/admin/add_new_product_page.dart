import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gdsc_captone_project/views/shared/buttons/button.dart';
import 'package:gdsc_captone_project/views/shared/fonts/google_font.dart';

class AddProducts extends StatefulWidget {
  const AddProducts({
    Key? key,
  }) : super(key: key);

  @override
  State<AddProducts> createState() => _EditProductState();
}

class _EditProductState extends State<AddProducts> {
  _EditProductState() {
    _selectedSize = sizeOptions[0];
  }

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  String _selectedSize = "";
  List<String> sizeOptions = ['small', 'medium', 'large'];

  Future<void> _uploadFile() async {
    FilePickerResult? result =
        await FilePicker.platform.pickFiles(allowMultiple: true);

    if (result != null) {
      setState(() {
        sizeOptions = result.paths.map((path) => path!).toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
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
              child: SizedBox(
                width: double.infinity,
                height: 45.h,
                child: OutlinedButton.icon(
                  onPressed: _uploadFile,
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
            Button(buttonWidth: 300.w, text: 'Add Product'),
          ],
        ),
      ),
    );
  }
}
// String productName = _nameController.text;
              // double productPrice = double.parse(_priceController.text);
              // String productDescription = _descriptionController.text;

              // print('Product Name: $productName');
              // print('Product Price: $productPrice');
              // print('Product Description: $productDescription');
              // print('Selected Size: $_selectedSize');
              // print('Selected Files: $sizeOptions');
