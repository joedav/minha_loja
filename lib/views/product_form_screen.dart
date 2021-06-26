import 'dart:math';

import 'package:flutter/material.dart';
import 'package:minha_loja/providers/product.dart';
import 'package:minha_loja/providers/products.dart';
import 'package:provider/provider.dart';

class ProductFormScreen extends StatefulWidget {
  const ProductFormScreen({Key? key}) : super(key: key);

  @override
  _ProductFormScreenState createState() => _ProductFormScreenState();
}

class _ProductFormScreenState extends State<ProductFormScreen> {
  final _priceFocusNode = FocusNode();
  final _descriptionFocusNode = FocusNode();
  final _imageURLFocusNode = FocusNode();
  final _imageUrlController = TextEditingController();
  final _form = GlobalKey<FormState>();
  final _formData = Map<String, Object>();

  @override
  void initState() {
    super.initState();
    _imageURLFocusNode.addListener(_updateImageURL);
  }

  void _updateImageURL() {
    if (isValidImageUrl(_imageUrlController.text)) {
      setState(() {});
    }
  }

  bool isValidImageUrl(String url) {
    bool startsWithHttp = url.toLowerCase().startsWith('http://');
    bool startsWithHttps = url.toLowerCase().startsWith('https://');
    bool endsWithPng = url.endsWith('.png');
    bool endsWithJpg = url.endsWith('.jpg');
    bool endsWithJpeg = url.endsWith('.jpeg');
    return (startsWithHttp || startsWithHttps) &&
        (endsWithJpeg || endsWithJpg || endsWithPng);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _priceFocusNode.dispose();
    _descriptionFocusNode.dispose();
    _imageURLFocusNode.removeListener(_updateImageURL);
    _imageURLFocusNode.dispose();
  }

  void _saveForm() {
    bool isValid = _form.currentState!.validate();

    if (!isValid) {
      return;
    }

    _form.currentState!.save();

    final newProduct = Product(
      id: Random().nextDouble().toString(),
      title: _formData['title'] as String,
      price: _formData['price'] as double,
      description: _formData['description'] as String,
      imageUrl: _formData['imageUrl'] as String,
    );

    Provider.of<Products>(
      context,
      listen: false,
    ).addProduct(newProduct);

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Formulário'),
        actions: [
          IconButton(
            icon: Icon(Icons.done),
            onPressed: () => _saveForm(),
          ),
        ],
      ),
      body: Form(
        key: _form,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Título'),
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_priceFocusNode);
                },
                onSaved: (value) => _formData['title'] = value!,
                validator: (value) {
                  if (value!.trim().isEmpty) {
                    return 'Informe um título válido';
                  }
                  if (value.trim().length <= 3) {
                    return 'Informe um título com ao menos 3 letras';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Preço'),
                textInputAction: TextInputAction.next,
                focusNode: _priceFocusNode,
                keyboardType: TextInputType.numberWithOptions(),
                onSaved: (value) => _formData['price'] = double.parse(value!),
                validator: (value) {
                  bool empty = value!.trim().isEmpty;
                  var price = double.tryParse(value);
                  bool invalid = price == null || price <= 0;

                  if (empty || invalid) {
                    return 'Informe um preço válido';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Descição'),
                // textInputAction: TextInputAction.next,
                maxLines: 3,
                keyboardType: TextInputType.multiline,
                focusNode: _descriptionFocusNode,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_descriptionFocusNode);
                },
                onSaved: (value) => _formData['description'] = value!,
                validator: (value) {
                  bool empty = value!.trim().isEmpty;

                  if (empty || value.length < 10) {
                    return 'Informe uma descrição';
                  }
                  return null;
                },
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(labelText: 'URL da imagem'),
                      textInputAction: TextInputAction.done,
                      focusNode: _imageURLFocusNode,
                      controller: _imageUrlController,
                      onFieldSubmitted: (_) => _saveForm(),
                      onSaved: (value) => _formData['imageUrl'] = value!,
                      validator: (value) {
                        bool empty = value!.trim().isEmpty;
                        bool invalid = !isValidImageUrl(value);
                        if (empty || invalid) {
                          return 'Informe uma URL válida';
                        }
                        return null;
                      },
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 8, left: 10),
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 1),
                    ),
                    alignment: Alignment.center,
                    child: _imageUrlController.text.isEmpty
                        ? Text('Informe a URL')
                        : FittedBox(
                            child: Image.network(
                              _imageUrlController.text,
                              fit: BoxFit.cover,
                            ),
                          ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
