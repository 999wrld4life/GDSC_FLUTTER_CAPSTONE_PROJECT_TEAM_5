import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gdsc_captone_project/views/shared/fonts/google_font.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(children: [
                Container(
                  width: double.infinity,
                  height: 340.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Image.asset(
                    'assets/images/shoes.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 40.h,
                  left: 20.w,
                  child: Container(
                    width: 50.w,
                    height: 50.h,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(220, 222, 222, 223),
                        foregroundColor: const Color.fromARGB(158, 95, 94, 94),
                        shape: const CircleBorder(),
                        padding: const EdgeInsets.all(1),
                      ),
                      child: const Icon(Icons.arrow_back),
                    ),
                  ),
                ),
                Positioned(
                  top: 40.h,
                  right: 20.w,
                  child: Container(
                    width: 50.w,
                    height: 50.h,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(220, 222, 222, 223),
                        foregroundColor: const Color.fromARGB(158, 95, 94, 94),
                        shape: const CircleBorder(),
                        padding: const EdgeInsets.all(1),
                      ),
                      child: const Icon(Icons.favorite),
                    ),
                  ),
                ),
              ]),
              Padding(
                padding: EdgeInsets.only(
                    top: 8.h, left: 15.w, bottom: 2.h, right: 20.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Nike Shoes',
                      style: textStyle(
                          23,
                          Theme.of(context).colorScheme.inversePrimary,
                          FontWeight.bold,
                          1),
                    ),
                    Text(
                      '\$430',
                      style: textStyle(
                          21,
                          const Color.fromARGB(255, 169, 134, 230),
                          FontWeight.bold,
                          1),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              const MyRatingPage(),
              SizedBox(
                height: 10.h,
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.w),
                child: Text(
                  'Description',
                  style: textStyle(
                      18,
                      Theme.of(context).colorScheme.inversePrimary,
                      FontWeight.bold,
                      1),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              const Description(),
              SizedBox(
                height: 20.h,
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.w),
                child: Text(
                  'Size',
                  style: textStyle(
                      18,
                      Theme.of(context).colorScheme.inversePrimary,
                      FontWeight.bold,
                      1),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 8.w),
                child: const SizedBox(
                  child: Row(
                    children: [
                      SizeOfMaterial(),
                      SizeOfMaterial(),
                      SizeOfMaterial(),
                      SizeOfMaterial(),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: 250.w,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 7, 100, 177),
                          foregroundColor: Colors.white,
                          padding: EdgeInsets.symmetric(
                              vertical: 20.h, horizontal: 60.w),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40),
                          ),
                        ),
                        child: Text(
                          'Buy Now',
                          style: textStyle(
                              18, Colors.white, FontWeight.normal, 1.2),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 80.w,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromRGBO(242, 244, 245, 1),
                          foregroundColor:
                              const Color.fromARGB(255, 122, 121, 121),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40),
                          ),
                        ),
                        child: const Icon(Icons.lock),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class SizeOfMaterial extends StatelessWidget {
  const SizeOfMaterial({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50.w,
      height: 40.h,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            side: const BorderSide(
              color: Color.fromARGB(255, 214, 214, 214),
              width: 1.0,
            ),
          ),
          child: const Text('8'),
        ),
      ),
    );
  }
}

class MyRatingPage extends StatelessWidget {
  const MyRatingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 10.w),
      child: Row(
        children: [
          RatingBar.builder(
            initialRating: 3,
            minRating: 0,
            direction: Axis.horizontal,
            itemCount: 1,
            itemSize: 35,
            itemBuilder: (context, _) => const Icon(
              Icons.star,
              color: Colors.amber,
            ),
            onRatingUpdate: (rating) {
              print(rating);
            },
          ),
          Text(
            '4.5',
            style: textStyle(15, Theme.of(context).colorScheme.inversePrimary,
                FontWeight.bold, 1),
          ),
          Text(
            ' (20 Review)',
            style: textStyle(12, Theme.of(context).colorScheme.inversePrimary,
                FontWeight.normal, 1),
          )
        ],
      ),
    );
  }
}

class Description extends StatelessWidget {
  const Description({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      child: SingleChildScrollView(
          child: Container(
        padding: EdgeInsets.only(left: 15.w),
        child: Text(
          '''
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed pharetra quis velit nec placerat. Curabitur consequat orci libero, nec pulvinar arcu iaculis sit amet. Duis feugiat quam non arcu tincidunt, eget accumsan ex tempor. Vivamus gravida odio at est convallis, vitae fermentum urna fermentum. Nullam id eros eget justo consectetur ultricies a a velit. Cras varius metus sit amet lorem finibus, vel euismod eros elementum. Nullam in mauris ut quam rhoncus congue. Ut euismod enim nec mi placerat, eget venenatis ex pellentesque. Proin ullamcorper erat nec turpis gravida, eu congue est venenatis. Proin iaculis felis quis tortor auctor, eu mollis felis ullamcorper. In nec diam semper, placerat enim sit amet, lacinia felis. Nulla nec lacus id velit dictum euismod. Integer dictum arcu nec nulla luctus, eget ultricies neque varius.

            Phasellus et eros sagittis, venenatis eros ut, scelerisque odio. Sed auctor risus at ipsum dapibus, in malesuada mi mattis. Nullam bibendum justo ut metus fermentum, et consequat eros tincidunt. Suspendisse dictum metus a nibh tristique, vel venenatis urna pharetra. Ut et ultricies dolor, at vehicula est. Suspendisse congue sapien sed urna laoreet lacinia. Sed euismod felis a nunc faucibus gravida. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Phasellus eleifend orci sit amet sem sollicitudin varius. Morbi vitae felis in lacus finibus viverra. Mauris convallis nibh at enim ullamcorper lacinia. Vestibulum bibendum magna non turpis aliquam sodales.

            Fusce ut mi in est laoreet accumsan. Suspendisse ac quam a velit egestas aliquet. Integer vel odio id ex tristique fringilla. Maecenas hendrerit, lectus nec varius fermentum, tortor orci ultricies lectus, at iaculis felis orci vel sapien. Vivamus sit amet lobortis erat. Vestibulum fermentum ligula ut nunc ullamcorper, id fermentum dui tristique. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nam id est sagittis, tristique elit sit amet, eleifend mi. Integer rhoncus lorem et nisl vulputate lacinia. Integer porttitor velit vel ipsum molestie, ut tristique quam luctus. Nullam nec nulla leo.

            ''',
          style: textStyle(12.sp, Theme.of(context).colorScheme.inversePrimary,
              FontWeight.normal, 1),
        ),
      )),
    );
  }
}
