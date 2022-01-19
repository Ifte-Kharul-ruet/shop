import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/providers/cart.dart';
import 'package:shop/providers/products_provider.dart';
import 'package:shop/screens/cart_screen.dart';
import 'package:shop/widgets/app_drawer.dart';
import 'package:shop/widgets/badge.dart';

import '../widgets/product_grid.dart';

enum FilterOpions {
  Favourite,
  All,
}

class ProductOverviewScreen extends StatefulWidget {
  @override
  _ProductOverviewScreenState createState() => _ProductOverviewScreenState();
}

class _ProductOverviewScreenState extends State<ProductOverviewScreen> {
  var _isInit = true;
  var _isLoading = false;

  @override
  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });

      Provider.of<ProductsProvider>(context, listen: false)
          .fetchAndSetProducts()
          .then((_) async {
        _isLoading = false;
      });
    }

    setState(() {
      _isLoading = false;
      _isInit = false;
    });

    super.didChangeDependencies();
  }

  var _showOnlyFavourite = false;
  @override
  Widget build(BuildContext context) {
    // final productContainer =
    //     Provider.of<ProductsProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text('MyShop'),
        actions: [
          Consumer<Cart>(
            child: IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {
                Navigator.of(context).pushNamed(CartScreen.routeName);
              },
            ),
            builder: (_, cart, ch) => Badge(
              child: ch,
              value: cart.itemCount.toString(),
            ),
          ),
          PopupMenuButton(
            onSelected: (FilterOpions selectedValue) {
              setState(() {
                if (selectedValue == FilterOpions.Favourite) {
                  // productContainer.showFavouritesOnly();
                  _showOnlyFavourite = true;
                } else {
                  _showOnlyFavourite = false;

                  // productContainer.showAll();
                }
              });
            },
            icon: Icon(Icons.more_vert),
            itemBuilder: (_) => [
              PopupMenuItem(
                child: Text('Only Favourites'),
                value: FilterOpions.Favourite,
              ),
              PopupMenuItem(
                child: Text('Show All'),
                value: FilterOpions.All,
              ),
            ],
          ),
        ],
      ),
      drawer: AppDrawer(),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ProductGrid(_showOnlyFavourite),
    );
  }
}
