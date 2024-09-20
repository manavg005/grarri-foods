import 'package:flutter/material.dart';
import 'package:grarri/src/business_layer/providers/base_provider.dart';
import 'package:grarri/src/business_layer/providers/cart_provider.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class RegisterProviders {
  /// Private constructor to prevent direct instantiation of the class.
  RegisterProviders._privateConstructor();

  /// Register all providers used in the application here.
  /// This method returns a list of [SingleChildWidget] providers.
  /// These providers are responsible for managing the state of
  /// different parts of the app.
  static List<SingleChildWidget> providers(BuildContext context) {
    return <SingleChildWidget>[
      ChangeNotifierProvider<BaseProvider>(
        create: (context) => BaseProvider(),
      ),
      ChangeNotifierProvider<CartProvider>(
        create: (context) => CartProvider(),
      ),
    ];
  }
}
