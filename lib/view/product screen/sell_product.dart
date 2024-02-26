import 'dart:io';

import 'package:ecommersapp/controller/product_provider.dart';
import 'package:ecommersapp/controller/widget_provider.dart';
import 'package:ecommersapp/model/product_model.dart';
import 'package:ecommersapp/view/product%20screen/widgets/widgets.dart';
import 'package:ecommersapp/view/widgets/appbar_widget.dart';
import 'package:ecommersapp/view/widgets/button_widgets.dart';
import 'package:ecommersapp/view/widgets/popup_widget.dart';
import 'package:ecommersapp/view/widgets/text_fields_widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class SellProductPage extends StatefulWidget {
  ProductModel? products;
  SellProductPage({Key? key, this.products}) : super(key: key);

  @override
  State<SellProductPage> createState() => _SellProductPageState();
}

class _SellProductPageState extends State<SellProductPage> {
  @override
  void initState() {
    Provider.of<DatabaseProvider>(context, listen: false)
        .loadDatasForEdit(widget.products!);
    selectedCategory = widget.products!.category;
    super.initState();
  }

  final formKey = GlobalKey<FormState>();

  final List<String> categories = [
    'Mobile',
    'Laptop',
    'Headphones',
    'Camera',
    'Smartwatch',
    'Tablet',
    'Mouse and Keyboard',
    'Speaker',
    'Fitness Tracker',
    'Drone',
    'VR Headset',
    'Wireless Earbuds',
    'Phone Case',
    'Laptop Bag',
    'Camera Lens',
    'External Hard Drive',
    'Tripod',
    'Power Bank',
    'Microphone',
    'USB Flash Drive',
    'Smart Home Devices',
    'E-book Reader',
    'Portable Projector',
    'Action Camera',
    'Digital Drawing Tablet',
    'Wireless Charger',
    'Game Controller',
    'Car Charger',
  ];

  String? selectedCategory;

  @override
  Widget build(BuildContext context) {
    final getProvider = Provider.of<DatabaseProvider>(context, listen: false);
    final widgetProvider = Provider.of<WidgetProviders>(context, listen: false);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBarWidgets().appBar(
        context,
        title: getProvider.isEdit! ? 'Update Product' : 'Sell Product',
      ),
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: GestureDetector(
                    onTap: () async {
                      getProvider.isEdit == false
                          ? await ProductWidgets().showImagePickerBottomSheet(
                              context, widgetProvider)
                          : PopupWidgets().showErrorSnackbar(
                              context, 'The image can never be edited');
                    },
                    child: Row(
                      children: [
                        Consumer<WidgetProviders>(
                            builder: (context, value, child) {
                          return Container(
                            width: size.width * .3,
                            height: size.width * .3,
                            decoration: BoxDecoration(
                              boxShadow: [
                                // BoxShadow(
                                //   color: Colors.grey.withOpacity(0.3),
                                //   spreadRadius: 1,
                                //   blurRadius: 5,
                                //   offset: const Offset(0, 3),
                                // ),
                              ],
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  scale: size.width * .07,
                                  image: value.file == null
                                      ? AssetImage(
                                          'assets/icons/upload image.png',
                                        )
                                      : FileImage(
                                          File(value.file!.path),
                                        ) as ImageProvider),
                              borderRadius: BorderRadius.circular(15),
                              // color: Color.fromARGB(255, 255, 255, 255)
                            ),
                          );
                        }),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                TextFieldWidgets().textFormField(size,
                                    label: "Title",
                                    controller: getProvider.titleController),
                                TextFieldWidgets().textFormField(size,
                                    label: "Brand",
                                    controller: getProvider.brandController),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: size.width * .01),
                        child: DropdownButtonFormField<String>(
                          value: selectedCategory,
                          decoration: InputDecoration(
                            labelText: 'Category',
                          ),
                          onChanged: (value) {
                            selectedCategory = value;
                          },
                          items: categories.map((category) {
                            return DropdownMenuItem(
                              value: category,
                              child: Text(category),
                            );
                          }).toList(),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please select category';
                            }
                            return null;
                          },
                        ),
                      ),
                      TextFieldWidgets().textFormField(
                        size,
                        label: "Description",
                        // maxLines: 2,
                        controller: getProvider.descriptionController,
                      ),
                      TextFieldWidgets().textFormField(size,
                          label: "Price",
                          prefixText: '₹',
                          keyboardType: TextInputType.number,
                          inputFormatter:
                              FilteringTextInputFormatter.digitsOnly,
                          controller: getProvider.priceController),
                      SizedBox(height: size.width * 0.05),
                      Consumer<DatabaseProvider>(
                          builder: (context, value, child) {
                        return ButtonWidgets().fullWidthElevatedButton(
                          size,
                          label:
                              value.isEdit == false ? 'Sell Product' : 'Update',
                          onPressed: () async {
                            if (formKey.currentState!.validate()) {
                              if (value.isEdit == false) {
                                if (widgetProvider.file != null) {
                                  await addProduct(context);
                                  Navigator.pop(context);
                                } else {
                                  PopupWidgets().showErrorSnackbar(
                                      context, 'Please Select a image');
                                }
                              } else {
                                await updateProduct(context, widget.products!);
                              }
                            }
                          },
                        );
                      }),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  addProduct(context) async {
    final getProvider = Provider.of<DatabaseProvider>(context, listen: false);
    final getwidgetProvider =
        Provider.of<WidgetProviders>(context, listen: false);
    PopupWidgets().showLoadingIndicator(context);
    await getProvider.uploadImage(File(getwidgetProvider.file!.path));

    final user = FirebaseAuth.instance.currentUser;
    final product = ProductModel(
      user: user!.email ?? user.phoneNumber,
      title: getProvider.titleController.text,
      brand: getProvider.brandController.text,
      description: getProvider.descriptionController.text,
      price: int.parse(getProvider.priceController.text),
      image: getProvider.downloadURL,
      wishList: [],
      category: selectedCategory,
      timeStamp: DateTime.now(),
    );
    getProvider.addProduct(product);
    getwidgetProvider.file = null;
    Navigator.pop(context);
    PopupWidgets()
        .showSuccessSnackbar(context, 'Product uploaded successfully');
  }

  updateProduct(context, ProductModel product) async {
    final getProvider = Provider.of<DatabaseProvider>(context, listen: false);
    PopupWidgets().showLoadingIndicator(context);
    product.title = getProvider.titleController.text;
    product.brand = getProvider.brandController.text;
    product.description = getProvider.descriptionController.text;
    product.price = int.parse(getProvider.priceController.text);
    product.category = selectedCategory;
    product.timeStamp = DateTime.now();

    await getProvider.updateMyProduct(product.id, product);

    Navigator.pop(context);
    Navigator.pop(context);
    PopupWidgets().showSuccessSnackbar(context, 'Product updated successfully');
  }
}
