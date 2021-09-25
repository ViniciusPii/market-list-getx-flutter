import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:market_list/components/text_input_component.dart';
import 'package:market_list/models/product_model.dart';
import 'package:market_list/repositories/product_list_repository.dart';
import 'package:market_list/theme/app_colors.dart';
import 'package:market_list/theme/app_dimension.dart';
import 'package:market_list/theme/app_fonts.dart';
import 'package:market_list/utils/masks/currency_mask_formatter.dart';
import 'package:market_list/utils/validators/form_validators.dart';
import 'package:provider/provider.dart';

class FormPage extends StatefulWidget {
  const FormPage({
    Key? key,
    this.product,
  }) : super(key: key);

  final ProductModel? product;

  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final GlobalKey<FormState> _form = GlobalKey<FormState>();
  TextEditingController _productEC = TextEditingController();
  TextEditingController _quantityEC = TextEditingController(text: '1');
  TextEditingController _priceEC = TextEditingController();

  @override
  void dispose() {
    _productEC.dispose();
    _quantityEC.dispose();
    _priceEC.dispose();
    super.dispose();
  }

  @override
  void initState() {
    if (widget.product != null) {
      _productEC = TextEditingController(text: widget.product!.productName);
      _quantityEC = TextEditingController(text: widget.product!.quantity.toString());
      _priceEC = TextEditingController(text: ProductModel.formatCurrency(widget.product!.price));
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.celeste[200],
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: AppDimension.dm_16,
              horizontal: AppDimension.dm_24,
            ),
            child: Form(
              key: _form,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    widget.product == null
                        ? 'Adicione seu produto!'
                        : 'Editando ${widget.product!.productName}!',
                    style: AppFonts.size_4(weight: FontWeight.bold, color: AppColors.neutral[700]),
                  ),
                  const SizedBox(height: AppDimension.dm_32),
                  TextInputComponent(
                    label: 'Produto',
                    hint: 'Ex: Tomate',
                    formatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.allow(
                        RegExp('[A-Za-záàâãéèêíïóôõöúçñÁÀÂÃÉÈÍÏÓÔÕÖÚÇÑ ]+|s'),
                      ),
                    ],
                    validators: FormValidators.checkNotEmptyProductName,
                    controller: _productEC,
                  ),
                  const SizedBox(height: AppDimension.dm_8),
                  TextInputComponent(
                    label: 'Quantidade',
                    hint: 'Ex: 1',
                    formatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    type: TextInputType.number,
                    validators: FormValidators.checkAmount,
                    controller: _quantityEC,
                  ),
                  const SizedBox(height: AppDimension.dm_8),
                  TextInputComponent(
                    label: 'Preço',
                    hint: 'Ex: R\$ 2,50',
                    formatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly,
                      CurrencyMaskFormatter(),
                    ],
                    type: TextInputType.number,
                    validators: FormValidators.checkPrice,
                    controller: _priceEC,
                  ),
                  const SizedBox(height: AppDimension.dm_24),
                  Consumer<ProductListRepository>(
                    builder: (_, ProductListRepository productListRepository, __) {
                      return productListRepository.isLoading
                          ? Container(
                              width: AppDimension.dm_24,
                              height: AppDimension.dm_24,
                              child: CircularProgressIndicator(
                                color: AppColors.pink[400],
                              ),
                            )
                          : ElevatedButton(
                              onPressed: () => widget.product == null
                                  ? _saveProduct(productListRepository)
                                  : _updateProduct(productListRepository),
                              child: const Text('Adicionar'),
                              style: ElevatedButton.styleFrom(
                                primary: AppColors.pink[400],
                                textStyle: AppFonts.size_3(),
                              ),
                            );
                    },
                  ),
                  const SizedBox(height: AppDimension.dm_16),
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('Voltar ao inicio'),
                    style: TextButton.styleFrom(
                      primary: AppColors.pink[400],
                      textStyle: AppFonts.size_3(),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _saveProduct(ProductListRepository productListRepository) async {
    if (_form.currentState!.validate()) {
      final String productName = _productEC.text.trim();
      final double price = CurrencyMaskFormatter.unMaskFormatted(_priceEC.text);
      final int quantity = int.parse(_quantityEC.text);
      final double fullPrice = ProductModel.changeFullPrice(price, quantity);
      final DateTime timestamp = DateTime.now();

      await productListRepository.save(
        ProductModel(
          productName: productName,
          price: price,
          quantity: quantity,
          fullPrice: fullPrice,
          timestamp: timestamp,
        ),
      );

      Navigator.pop(context);
    }
  }

  Future<void> _updateProduct(ProductListRepository productListRepository) async {
    if (_form.currentState!.validate()) {
      final String id = widget.product!.id;
      final String productName = _productEC.text.trim();
      final double price = CurrencyMaskFormatter.unMaskFormatted(_priceEC.text);
      final int quantity = int.parse(_quantityEC.text);
      final double fullPrice = ProductModel.changeFullPrice(price, quantity);
      final DateTime timestamp = DateTime.now();

      await productListRepository.update(
        ProductModel(
          id: id,
          productName: productName,
          price: price,
          quantity: quantity,
          fullPrice: fullPrice,
          timestamp: timestamp,
        ),
      );

      Navigator.pop(context);
    }
  }
}
