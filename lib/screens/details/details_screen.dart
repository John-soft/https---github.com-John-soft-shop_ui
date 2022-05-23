import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop_ui/constants.dart';
import 'package:shop_ui/model/products.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({Key? key, required this.product}) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: product.bgColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: const BackButton(
          color: Colors.black,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: CircleAvatar(
              backgroundColor: Colors.white,
              child: SvgPicture.asset(
                'assets/icons/Heart.svg',
                height: 20,
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Image.asset(
            product.image,
            height: MediaQuery.of(context).size.height * 0.4,
            fit: BoxFit.cover,
          ),
          const SizedBox(
            height: defaultPadding,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.fromLTRB(
                  defaultPadding,
                  defaultPadding * 1.5,
                  defaultPadding,
                  defaultPadding,
                ),
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(defaultBorderRadius * 3),
                      topRight: Radius.circular(defaultBorderRadius * 3),
                    )),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              product.title,
                              style: Theme.of(context).textTheme.headline6,
                            ),
                          ),
                          Text(
                            "\$" + product.price.toString(),
                            style: Theme.of(context).textTheme.headline6,
                          )
                        ],
                      ),
                      const Text(
                        'A Henly shirt is a collarless pullover shirt, by a round neckline and a placket about 3 to 5 inches(8 to 13cm) long and usually having 2-5 buttons.',
                      ),
                      const Padding(
                          padding: EdgeInsets.only(top: defaultPadding)),
                      const Text(
                        'Colors',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(
                        height: defaultPadding / 2,
                      ),
                      Row(
                        children: [
                          ColorDot(
                            color: const Color(0XFFBEE8EA),
                            isActive: false,
                            press: () {},
                          ),
                          ColorDot(
                            color: const Color(0XFF141B4A),
                            isActive: true,
                            press: () {},
                          ),
                          ColorDot(
                            color: const Color(0XFFF4E5C3),
                            isActive: false,
                            press: () {},
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: defaultPadding * 1.5,
                      ),
                      Center(
                        child: SizedBox(
                          height: 48,
                          width: 200,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              primary: primaryColor,
                              shape: const StadiumBorder(),
                            ),
                            child: Text('Add to cart'),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class ColorDot extends StatelessWidget {
  const ColorDot({
    Key? key,
    required this.color,
    required this.isActive,
    required this.press,
  }) : super(key: key);

  final Color color;
  final bool isActive;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        padding: const EdgeInsets.all(defaultPadding / 4),
        decoration: BoxDecoration(
            border: Border.all(
              color: isActive ? primaryColor : Colors.transparent,
            ),
            shape: BoxShape.circle),
        child: CircleAvatar(
          radius: 10,
          backgroundColor: color,
        ),
      ),
    );
  }
}
