import 'package:e_commerce_app/views/shared/fonts/google_font.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class QuantityWidget extends StatefulWidget {
  final Function(int) onQuantityChanged;
  final int initialQuantity;

  const QuantityWidget({
    Key? key,
    required this.onQuantityChanged,
    required this.initialQuantity,
  }) : super(key: key);

  @override
  _QuantityWidgetState createState() => _QuantityWidgetState();
}

class _QuantityWidgetState extends State<QuantityWidget> {
  late int quantity;

  @override
  void initState() {
    super.initState();
    quantity = widget.initialQuantity;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              quantity--;
              widget.onQuantityChanged(quantity);
            });
          },
          child: const CircleAvatar(
            radius: 12,
            backgroundColor: Colors.deepPurple,
            child: Icon(Icons.remove),
          ),
        ),
        SizedBox(width: 8.w),
        Text(
          quantity.toString(),
          style: textStyle(
            16.sp,
            Theme.of(context).colorScheme.inversePrimary,
            FontWeight.bold,
            1.3,
          ),
        ),
        SizedBox(width: 8.w),
        GestureDetector(
          onTap: () {
            setState(() {
              quantity++;
              widget.onQuantityChanged(quantity);
            });
          },
          child: CircleAvatar(
            radius: 12,
            backgroundColor: Colors.deepPurple,
            child: Icon(Icons.add),
          ),
        ),
      ],
    );
  }
}
