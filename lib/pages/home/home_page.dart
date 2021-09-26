import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:market_list/components/alert_dialog_component.dart';
import 'package:market_list/components/card_product_component.dart';
import 'package:market_list/components/floating_button_component.dart';
import 'package:market_list/components/status_bar_component.dart';
import 'package:market_list/models/product_model.dart';
import 'package:market_list/repositories/product_list_repository.dart';
import 'package:market_list/theme/app_colors.dart';
import 'package:market_list/theme/app_dimension.dart';
import 'package:market_list/theme/app_fonts.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
                Consumer<ProductListRepository>(
                  builder: (_, ProductListRepository productListRepository, __) {
                    return _buildView(productListRepository);
                  },
                )
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingButtonComponent(
          action: () {
            Navigator.pushNamed(context, '/save');
          },
        ),
      ),
    );
  }

  Widget _buildView(ProductListRepository productListRepository) {
    if (productListRepository.isLoading) {
      return _buildIsLoadingView();
    }

    if (productListRepository.productList.isEmpty) {
      return _buildEmptyView();
    }

    return _buildContentView(productListRepository);
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

  Widget _buildContentView(ProductListRepository productListRepository) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const SizedBox(height: AppDimension.dm_48),
          _buildPurchaseInfo(productListRepository),
          const SizedBox(height: AppDimension.dm_48),
          _buildListView(productListRepository),
        ],
      ),
    );
  }

  Widget _buildPurchaseInfo(ProductListRepository productListRepository) {
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
            ProductModel.formatCurrency(productListRepository.listFullPriceCalculate()),
            style: AppFonts.size_10(color: AppColors.pink[400]),
          ),
        ],
      ),
    );
  }

  Widget _buildListView(ProductListRepository productListRepository) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                productListRepository.listAmountsCalculate() == 1
                    ? '${productListRepository.listAmountsCalculate()} item no seu carrinho!'
                    : '${productListRepository.listAmountsCalculate()} itens no seu carrinho!',
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
                        productListRepository.removeAll();
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
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                final ProductModel product = productListRepository.productList[index];
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
                        onTap: () => Navigator.pushNamed(context, '/edit', arguments: product),
                      ),
                    ],
                    secondaryActions: <Widget>[
                      IconSlideAction(
                        caption: 'Excluir',
                        color: Colors.transparent,
                        icon: FontAwesomeIcons.trashAlt,
                        foregroundColor: AppColors.pink[400],
                        onTap: () async => await productListRepository.remove(product),
                      ),
                    ],
                  ),
                );
              },
              itemCount: productListRepository.productList.length,
            ),
          ),
        ],
      ),
    );
  }
}
