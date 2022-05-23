import 'package:flutter/material.dart';
import 'package:shop_ui/components/product_card.dart';
import 'package:shop_ui/components/selection_tile.dart';
import 'package:shop_ui/constants.dart';

import '../model/products.dart';

class NewArrival extends StatelessWidget {
  const NewArrival({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SelectionTile(
          title: 'New Arrival',
          pressSeeAll: () {},
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(
                demo_product.length,
                (index) => Padding(
                      padding: const EdgeInsets.only(right: defaultPadding),
                      child: ProductCard(
                        image: demo_product[index].image,
                        title: demo_product[index].title,
                        bgColor: demo_product[index].bgColor,
                        price: demo_product[index].price,
                        press: () {},
                      ),
                    )),
          ),
        ),
      ],
    );
  }
}
