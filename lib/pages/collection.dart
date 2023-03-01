import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class collectionPage extends StatefulWidget {
  const collectionPage({Key? key}) : super(key: key);

  @override
  _collectionPageState createState() => _collectionPageState();
}

class _collectionPageState extends State<collectionPage> {
  // Define a list of products
  final List<Product> products = [
    Product(
      name: "Product 1",
      imageUrl: "https://via.placeholder.com/300",
      description: "Description for Product 1",
    ),
    Product(
      name: "Product 2",
      imageUrl: "https://via.placeholder.com/300",
      description: "Description for Product 2",
    ),
    Product(
      name: "Product 3",
      imageUrl: "https://via.placeholder.com/300",
      description: "Description for Product 3",
    ),
    Product(
      name: "Product 4",
      imageUrl: "https://via.placeholder.com/300",
      description: "Description for Product 4",
    ),
    Product(
      name: "Product 5",
      imageUrl: "https://via.placeholder.com/300",
      description: "Description for Product 5",
    ),
    Product(
      name: "Product 6",
      imageUrl: "https://via.placeholder.com/300",
      description: "Description for Product 6",
    ),
  ];

  // Define a controller for the new product form
  // final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _formKey = GlobalKey<FormState>();

  // Define variables to hold the values entered in the form
  // String? _newProductName;
  // String? _newProductImageUrl;
  // String? _newProductDescription;
  late String _newProductName;
  late String _newProductImageUrl;
  late String _newProductDescription;

  void _addProduct() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Add Product"),
          content: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Name",
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter a product name";
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _newProductName = value!;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Image URL",
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter an image URL";
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _newProductImageUrl = value!;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Description",
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter a product description";
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _newProductDescription = value!;
                  },
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Cancel"),
            ),
            ElevatedButton(
              onPressed: () {
                // Validate the form
                if (_formKey.currentState!.validate()) {
                  // Save the form values
                  _formKey.currentState!.save();
                  // Add the new product to the list
                  setState(() {
                    products.add(
                      Product(
                        name: _newProductName,
                        imageUrl: _newProductImageUrl,
                        description: _newProductDescription,
                      ),
                    );
                  });
                  // Close the modal pop-up
                  Navigator.pop(context);
                }
              },
              child: Text("Add"),
            ),
          ],
        );
      },
    );
  }

  void _pipelineEditProduct(Product product, String newName, String newImageUrl, String newDescription) {
    setState(() {
      product.name = newName;
      product.imageUrl = newImageUrl;
      product.description = newDescription;
    });
  }

  void _editProduct(Product product) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Edit Product"),
          content: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Name",
                  ),
                  initialValue: product.name,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter a product name";
                    }
                    return null;
                  },
                  onSaved: (value) {
                    product.name = value!;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Image URL",
                  ),
                  initialValue: product.imageUrl,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter an image URL";
                    }
                    return null;
                  },
                  onSaved: (value) {
                    product.imageUrl = value!;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Description",
                  ),
                  initialValue: product.description,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter a product description";
                    }
                    return null;
                  },
                  onSaved: (value) {
                    product.description = value!;
                  },
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Cancel"),
            ),
            ElevatedButton(
              onPressed: () {
                // Validate the form
                if (_formKey.currentState!.validate()) {
                  // Save the form values
                  _formKey.currentState!.save();
                  _pipelineEditProduct(product, product.name, product.imageUrl, product.description);
                  // Close the modal pop-up
                  Navigator.pop(context);
                }
              },
              child: Text("Save"),
            ),
            TextButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text("Confirm Deletion"),
                      content: Text(
                        "Are you sure you want to delete this item?",
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text("Cancel"),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              products.remove(product);
                            });
                            Navigator.pop(context);
                            Navigator.pop(context);
                          },
                          child: Text("Delete"),
                        ),
                      ],
                    );
                  },
                );
              },
              child: Text(
                "Delete",
                style: TextStyle(color: Colors.red),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("Product Collection"),
      // ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Expanded(
                child: GridView.count(
                  crossAxisCount: 3,
                  children: List.generate(products.length, (index) {
                    return GestureDetector(
                      onTap: () {
                        _editProduct(products[index]);
                      },
                      child: Container(
                        margin: EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 3,
                              child: Container(
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image:
                                        NetworkImage(products[index].imageUrl),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Padding(
                                padding: EdgeInsets.all(5.0),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      products[index].name,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      products[index].description,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _addProduct();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class Product {
  String name;
  String imageUrl;
  String description;

  Product({required this.name, required this.imageUrl, required this.description});

  String get _name => name;
  set _name(String value) => name = value;
  String get _imageUrl => imageUrl;
  set _imageUrl(String value) => imageUrl = value;
  String get _description => imageUrl;
  set _description(String value) => description = value;
}
