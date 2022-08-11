import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../widgets/button.dart';
import '../../../../component/constants.dart';
import '../../../view_models/desserts.dart';
import '../../../widgets/sub_text.dart';

class ProductDetails extends StatefulWidget {
  final Dessert dessert;
  const ProductDetails({Key? key, required this.dessert}) : super(key: key);

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  List<String> size = ['1', '2', '3', '4', '5'];

  List<String> ingredients = ['a', 'b', 'c', 'd', 'e'];
  String? indexValue;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: orange,
          body: SingleChildScrollView(
            child: SizedBox(
              width: double.infinity,
              height: 1075.h,
              child: Stack(
                children: [
                  Image.asset(
                    widget.dessert.image,
                    width: double.infinity,
                    height: 355.h,
                    fit: BoxFit.fill,
                  ),
                  Positioned(
                    top: 320.h,
                    child: SizedBox(
                      height: 787.h,
                      width: 375.w,
                      child: Material(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(50.r),
                              topRight: Radius.circular(50.r)),
                          child: _buildProductDetails(context)),
                    ),
                  ),
                  Positioned(
                    top: 290.h,
                    right: 20.w,
                    child: Image.asset(
                        'assets/images/icons/Add to favorites button.png'),
                  ),
                ],
              ),
            ),
          )),
    );
  }

  Widget _buildProductDetails(BuildContext context) {
    return Column(
      children: [orderInformation(context), totalPriceSection()],
    );
  }

  Widget orderInformation(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            widget.dessert.name,
            style: Theme.of(context).textTheme.headline5,
          ),
          SizedBox(height: 10.h),
          Image.asset('assets/images/icons/Star rating.png'),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${widget.dessert.rating.toString()} Star Ratings',
                style: const TextStyle(color: orange),
              ),
              RichText(
                text: TextSpan(
                    text: 'Rs. ${widget.dessert.price.toString()}',
                    style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w700,
                        color: Colors.black),
                    children: [
                      TextSpan(
                        text: '\n         / per Portion',
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
                    ]),
              ),
            ],
          ),
          SizedBox(height: 20.h),
          Text('Description', style: Theme.of(context).textTheme.titleLarge),
          const SmallText(
            text:
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ornare leo non mollis id cursus. Eu euismod faucibus in leo malesuada',
            textAlign: TextAlign.start,
          ),
          SizedBox(height: 30.h),
          const Divider(),
          SizedBox(height: 20.h),
          Text('Customize your Order',
              style: Theme.of(context).textTheme.titleLarge),
          _buildDropDownList(size),
          // _buildDropDownList(ingredients),
          numberOfPortions(context),
        ],
      ),
    );
  }

  Widget _buildDropDownList(List items) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: 350.w,
        child: DropdownButton<String>(
          underline: Container(),
          isExpanded: true,
          icon: const Icon(Icons.keyboard_arrow_down_rounded),
          value: indexValue,
          hint: const Text('data'),
          items: items
              .map((item) => DropdownMenuItem<String>(
                    value: item,
                    child: Text(item),
                  ))
              .toList(),
          onChanged: (value) {
            setState(() {
              indexValue = value;
            });
          },
        ),
      ),
    );
  }

  Widget numberOfPortions(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            'Number of Portions',
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        smallButton('-', orange, () {}),
        SizedBox(width: 5.w),
        smallButton('2', white, () {}),
        SizedBox(width: 5.w),
        smallButton('+', orange, () {}),
      ],
    );
  }

  Widget smallButton(String text, Color color, onpressed) {
    return Button(
      onPressed: onpressed,
      widget: Text(text),
      color: color,
      height: 30,
      width: 50,
    );
  }

  Widget totalPriceSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: SizedBox(
        width: double.infinity,
        height: 200,
        child: Stack(
          children: [
            Container(
                width: 97.w,
                height: 190.h,
                decoration: const BoxDecoration(
                    color: orange,
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(50),
                        topRight: Radius.circular(50)))),
            Positioned(
              left: 50.w,
              top: 20.h,
              // bottom: 20.h,
              child: SizedBox(
                width: 277.w,
                height: 142.h,
                child: Material(
                  elevation: 5,
                  color: white,
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                      topLeft: Radius.circular(50)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const SmallText(text: 'Total Price'),
                      Text('LKR 1500',
                          style: Theme.of(context).textTheme.titleLarge),
                      SizedBox(
                        width: 157.w,
                        height: 35.h,
                        child: Button(
                            onPressed: () {},
                            widget: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Image.asset(
                                    'assets/images/icons/addToCart.png'),
                                const Text('Add to Cart')
                              ],
                            ),
                            color: orange),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: 60.h,
              left: 310.w,
              child: Material(
                elevation: 5,
                borderRadius: BorderRadius.circular(25),
                color: white,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Image.asset(
                    "assets/images/icons/shopping-cart.png",
                    color: orange,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
