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
    required this.action,
  }) : super(key: key);

  final ProductModel productModel;
  final Function() action;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: action,
      child: Container(
        decoration: BoxDecoration(
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: AppColors.neutral.shade200,
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
              Expanded(
                child: Row(
                  children: <Widget>[
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        color: AppColors.primary.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(AppDimension.dm_16),
                      ),
                      child: Icon(
                        FontAwesomeIcons.shoppingBasket,
                        color: AppColors.primary,
                      ),
                    ),
                    const SizedBox(width: AppDimension.dm_16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            productModel.productName,
                            style: AppFonts.sizeMedium_4(
                              color: AppColors.neutral.shade700,
                            ),
                          ),
                          Text(
                            _changeText(),
                            style: AppFonts.size_2(color: AppColors.textColor),
                          ),
                          const SizedBox(height: AppDimension.dm_4),
                          Text(
                            productModel.isSelected
                                ? '${ProductModel.formatCurrency(productModel.price)} Kg'
                                : '${ProductModel.formatCurrency(productModel.price)} cada',
                            style: AppFonts.sizeMedium_1(color: AppColors.primary),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: AppDimension.dm_8),
              Container(
                decoration: BoxDecoration(
                  color: AppColors.primary.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(AppDimension.dm_16),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: AppDimension.dm_8,
                    horizontal: AppDimension.dm_16,
                  ),
                  child: Text(
                    ProductModel.formatCurrency(productModel.fullPrice),
                    style: AppFonts.sizeMedium_3(
                      color: AppColors.primary,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _changeText() {
    if (productModel.quantity > 1) {
      return '${productModel.quantity} unidades';
    } else if (productModel.isSelected) {
      if (productModel.weight >= 1) {
        return '${productModel.weight} Kg';
      } else {
        return '${ProductModel.formatGrams(productModel.weight)} gramas';
      }
    }
    return '${productModel.quantity} unidade';
  }
}
