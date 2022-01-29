import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:market_list/components/alert_dialog_component.dart';
import 'package:market_list/components/card_product_component.dart';
import 'package:market_list/components/floating_button_component.dart';
import 'package:market_list/components/status_bar_component.dart';
import 'package:market_list/models/product_model.dart';
import 'package:market_list/theme/app_colors.dart';
import 'package:market_list/theme/app_dimension.dart';
import 'package:market_list/theme/app_fonts.dart';
import './home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
    if (controller.loading.value) {
      return _buildIsLoadingView();
    }

    if (controller.productList.isEmpty) {
      return _buildEmptyView();
    }

    return _buildContentView(context);
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.only(top: AppDimension.dm_8),
      child: Row(
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
              backgroundImage: AssetImage('assets/tais.jpeg'),
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
          SizedBox(height: AppDimension.dm_8),
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
      child: Column(
        children: <Widget>[
          Expanded(
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    FontAwesomeIcons.exclamationTriangle,
                    color: AppColors.neutral[800],
                    size: AppDimension.dm_32,
                  ),
                  const SizedBox(height: AppDimension.dm_16),
                  Text(
                    'Carrinho vazio!',
                    style: AppFonts.size_10(),
                  ),
                  const SizedBox(height: AppDimension.dm_16),
                  Text(
                    'Você ainda não possui produtos em seu carrinho, clique em adicionar e faça já suas compras!',
                    style: AppFonts.size_3(color: AppColors.neutral[600]),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildContentView(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const SizedBox(height: AppDimension.dm_48),
          _buildPurchaseInfo(),
          const SizedBox(height: AppDimension.dm_48),
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
            style: AppFonts.size_2(color: AppColors.neutral[600]),
          ),
          Text(
            ProductModel.formatCurrency(controller.listFullPriceCalculate()),
            style: AppFonts.size_10(color: AppColors.pink[400]),
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
                style: AppFonts.size_4(weight: FontWeight.bold, color: AppColors.neutral[700]),
              ),
              IconButton(
                onPressed: () {
                  showDialog<AlertDialog>(
                    context: context,
                    builder: (BuildContext context) => AlertDialogComponent(
                      title: 'Atenção!',
                      content: 'Você deseja realmente excluir todos itens da lista?',
                      primaryButtonText: 'Não',
                      primaryFunction: () => Navigator.pop(context),
                      secondaryButtonText: 'Sim',
                      secondaryFunction: () {
                        controller.removeAll();
                        Navigator.pop(context);
                      },
                    ),
                  );
                },
                icon: Icon(FontAwesomeIcons.trashAlt, color: AppColors.pink[400]),
              )
            ],
          ),
          const SizedBox(height: AppDimension.dm_8),
          Expanded(
            child: RefreshIndicator(
              onRefresh: () => controller.readAll(),
              child: ListView.builder(
                physics: const AlwaysScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  final ProductModel product = controller.productList[index];
                  return Padding(
                    padding: const EdgeInsets.only(top: AppDimension.dm_8),
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
                          icon: FontAwesomeIcons.edit,
                          foregroundColor: AppColors.pink[400],
                          onTap: () => controller.goToEditPage(product),
                        ),
                      ],
                      secondaryActions: <Widget>[
                        IconSlideAction(
                          caption: 'Excluir',
                          color: Colors.transparent,
                          icon: FontAwesomeIcons.trashAlt,
                          foregroundColor: AppColors.pink[400],
                          onTap: () => controller.remove(product),
                        ),
                      ],
                    ),
                  );
                },
                itemCount: controller.productList.length,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
