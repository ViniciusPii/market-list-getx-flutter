import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:market_list/models/product_model.dart';
import 'package:market_list/theme/app_colors.dart';
import 'package:market_list/theme/app_dimension.dart';
import 'package:market_list/theme/app_fonts.dart';

class CardProductComponent extends StatelessWidget {
  const CardProductComponent({
    Key? key,
    required this.productModel,
  }) : super(key: key);

  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: AppColors.neutral[200]!,
            blurRadius: 10,
            offset: const Offset(1, 5),
          ),
        ],
        color: AppColors.white,
        borderRadius: BorderRadius.circular(AppDimension.dm_8),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: AppDimension.dm_8,
          horizontal: AppDimension.dm_16,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    color: AppColors.pink[100],
                    borderRadius: BorderRadius.circular(AppDimension.dm_16),
                  ),
                  child: Icon(
                    FontAwesomeIcons.shoppingBasket,
                    color: AppColors.pink[300],
                  ),
                ),
                const SizedBox(width: AppDimension.dm_16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      productModel.productName,
                      style:
                          AppFonts.size_4(weight: FontWeight.w500, color: AppColors.neutral[700]),
                    ),
                    Text(
                      productModel.quantity == 1
                          ? '${productModel.quantity} unidade'
                          : '${productModel.quantity} unidades',
                      style: AppFonts.size_2(color: AppColors.neutral[700]),
                    ),
                    const SizedBox(height: AppDimension.dm_4),
                    Text(
                      '${ProductModel.formatCurrency(productModel.price)} cada',
                      style: AppFonts.size_1(color: AppColors.pink[400]),
                    ),
                  ],
                ),
              ],
            ),
            Container(
              decoration: BoxDecoration(
                color: AppColors.pink[50],
                borderRadius: BorderRadius.circular(AppDimension.dm_16),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: AppDimension.dm_8,
                  horizontal: AppDimension.dm_16,
                ),
                child: Text(
                  ProductModel.formatCurrency(productModel.fullPrice),
                  style: AppFonts.size_3(
                    color: AppColors.pink[400],
                    weight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
