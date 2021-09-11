import 'package:flutter/material.dart';
import 'package:market_list/components/card_product_component.dart';
import 'package:market_list/components/floating_button_component.dart';
import 'package:market_list/components/status_bar_component.dart';
import 'package:market_list/models/product_model.dart';
import 'package:market_list/repositories/data_test.dart';
import 'package:market_list/theme/app_colors.dart';
import 'package:market_list/theme/app_dimension.dart';
import 'package:market_list/theme/app_fonts.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<ProductModel> list = DataTest.listProducts;

    return StatusBarComponent(
      child: Scaffold(
        backgroundColor: AppColors.celeste[200],
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: AppDimension.dm_16,
              horizontal: AppDimension.dm_24,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const SizedBox(height: AppDimension.dm_8),
                _buildHeader(),
                // const SizedBox(height: AppDimension.dm_32),
                // _buildPurchaseInfo(),
                const SizedBox(height: 150),
                _buildListView(list),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingButtonComponent(
          action: () {},
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Olá, Tais!',
              style: AppFonts.size_8(),
            ),
            Text(
              'Seja bem-vinda',
              style: AppFonts.size_4(
                color: AppColors.neutral[600],
              ),
            ),
          ],
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(
              Radius.circular(AppDimension.dm_32),
            ),
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: AppColors.neutral,
                blurRadius: 10,
                offset: const Offset(3, 3),
              ),
            ],
          ),
          child: const CircleAvatar(
            radius: AppDimension.dm_32,
            backgroundImage: NetworkImage(
              'https://scontent.fcpq14-1.fna.fbcdn.net/v/t39.30808-6/233338025_4343486219051381_6788940961759058423_n.jpg?_nc_cat=108&ccb=1-5&_nc_sid=09cbfe&_nc_ohc=60Ia-7KSizEAX-DKwqy&_nc_ht=scontent.fcpq14-1.fna&oh=61b5b9c6b8772e756a1dd6cb520b52fa&oe=6141AB82',
            ),
          ),
        )
      ],
    );
  }

  Widget _buildPurchaseInfo() {
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Detalhes da sua compra',
            style: AppFonts.size_4(color: AppColors.neutral[700]),
          )
        ],
      ),
    );
  }

  Widget _buildListView(List<ProductModel> list) {
    return Expanded(
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'Seus Produtos',
                style: AppFonts.size_4(weight: FontWeight.bold, color: AppColors.neutral[700]),
              ),
              Text(
                '11/09/2021',
                style: AppFonts.size_2(),
              )
            ],
          ),
          const SizedBox(height: AppDimension.dm_16),
          Expanded(
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                final ProductModel productModel = list[index];
                return Padding(
                  padding: const EdgeInsets.only(top: AppDimension.dm_8),
                  child: CardProductComponent(
                    productModel: productModel,
                  ),
                );
              },
              itemCount: list.length,
            ),
          ),
        ],
      ),
    );
  }
}
