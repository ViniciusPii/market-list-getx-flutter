import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:market_list/components/alert_dialog_component.dart';
import 'package:market_list/components/card_product_component.dart';
import 'package:market_list/components/circle_avatar_component.dart';
import 'package:market_list/components/floating_button_component.dart';
import 'package:market_list/components/status_bar_component.dart';
import 'package:market_list/models/product_model.dart';
import 'package:market_list/theme/app_colors.dart';
import 'package:market_list/theme/app_dimension.dart';
import 'package:market_list/theme/app_extension.dart';
import 'package:market_list/theme/app_fonts.dart';
import './home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StatusBarComponent(
      child: Scaffold(
        backgroundColor: AppExtension.background,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: AppDimension.size_2,
              horizontal: AppDimension.size_3,
            ),
            child: Column(
              children: <Widget>[
                _buildHeader(),
                Obx(() => _buildView(context)),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingButtonComponent(
          action: () => controller.goToSavePage(),
        ),
      ),
    );
  }

  Widget _buildView(BuildContext context) {
    if (controller.productList == null) {
      return _buildIsLoadingView();
    }

    if (controller.productList!.isEmpty) {
      return _buildEmptyView();
    }

    return _buildContentView(context);
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.only(top: AppDimension.size_1),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Olá, ${controller.user?.displayName}!',
                  style: AppFonts.headlineSmall(),
                ),
                Text(
                  'Seja bem-vindo(a)',
                  style: AppFonts.bodyLarge(
                    color: AppExtension.textLightColor,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            width: AppDimension.size_2,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(
                Radius.circular(
                  AppDimension.size_4,
                ),
              ),
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: AppColors.neutral,
                  blurRadius: 10,
                  offset: const Offset(3, 3),
                ),
              ],
            ),
            child: GestureDetector(
              onTap: () => Get.toNamed<dynamic>('/user/details'),
              child: CircleAvatarComponent(
                url: '${controller.user?.photoURL}',
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildIsLoadingView() {
    return Expanded(
      child: Column(
        children: const <Widget>[
          SizedBox(
            height: AppDimension.size_1,
          ),
          Expanded(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildEmptyView() {
    return Expanded(
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('assets/images/empty.png'),
            const SizedBox(
              height: AppDimension.size_2,
            ),
            Text(
              'Carrinho vazio!',
              style: AppFonts.titleLarge(),
            ),
            const SizedBox(height: AppDimension.size_2),
            Text(
              'Você ainda não possui produtos em seu carrinho, clique em adicionar e faça já suas compras!',
              style: AppFonts.bodyLarge(
                color: AppExtension.textLightColor,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContentView(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const SizedBox(
            height: AppDimension.size_6,
          ),
          _buildPurchaseInfo(),
          const SizedBox(
            height: AppDimension.size_6,
          ),
          _buildListView(context),
        ],
      ),
    );
  }

  Widget _buildPurchaseInfo() {
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Valor total',
            style: AppFonts.bodyMedium(
              color: AppExtension.textLightColor,
            ),
          ),
          Text(
            ProductModel.formatCurrency(
              controller.listFullPriceCalculate(),
            ),
            style: AppFonts.headlineSmall(
              color: AppExtension.primary,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildListView(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                controller.listAmountsCalculate() == 1
                    ? '${controller.listAmountsCalculate()} item no seu carrinho!'
                    : '${controller.listAmountsCalculate()} itens no seu carrinho!',
                style: AppFonts.titleMedium(color: AppColors.neutral700),
              ),
              IconButton(
                onPressed: () => showDialog<AlertDialog>(
                  context: context,
                  builder: (BuildContext context) => AlertDialogComponent(
                    title: 'Atenção!',
                    content: 'Você deseja realmente excluir todos itens da lista?',
                    primaryButtonText: 'Não',
                    primaryFunction: () => Get.back<dynamic>(),
                    secondaryButtonText: 'Sim',
                    secondaryFunction: () => controller.removeAll(),
                  ),
                ),
                icon: Icon(
                  EvaIcons.trash2,
                  color: AppExtension.primary,
                ),
              )
            ],
          ),
          const SizedBox(
            height: AppDimension.size_1,
          ),
          Expanded(
            child: ListView.builder(
              physics: const AlwaysScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                final ProductModel product = controller.productList![index];
                return Padding(
                  padding: const EdgeInsets.only(
                    top: AppDimension.size_1,
                  ),
                  child: Slidable(
                    actionPane: const SlidableDrawerActionPane(),
                    child: Builder(
                      builder: (BuildContext context) => CardProductComponent(
                        productModel: product,
                        action: () => Slidable.of(context)!.close(),
                      ),
                    ),
                    actions: <Widget>[
                      IconSlideAction(
                        caption: 'Editar',
                        color: Colors.transparent,
                        icon: EvaIcons.editOutline,
                        foregroundColor: AppExtension.primary,
                        onTap: () => controller.goToEditPage(product),
                      ),
                    ],
                    secondaryActions: <Widget>[
                      IconSlideAction(
                        caption: 'Excluir',
                        color: Colors.transparent,
                        icon: EvaIcons.trash2Outline,
                        foregroundColor: AppExtension.primary,
                        onTap: () => controller.remove(product),
                      ),
                    ],
                  ),
                );
              },
              itemCount: controller.productList!.length,
            ),
          ),
        ],
      ),
    );
  }
}
