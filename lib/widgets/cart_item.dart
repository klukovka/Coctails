import 'package:coctails/models/cart.dart';
import 'package:coctails/pages/item_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartItem extends StatelessWidget {
  final cartData;
  final index;

  const CartItem({Key key, this.cartData, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        leading: InkWell(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ItemPage(
                  productId: cartData.keys.toList()[index],
                ),
              ),
            );
          },
          child: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                image: NetworkImage(
                    cartData.cartItems.values.toList()[index].imgUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        title: Text(cartData.cartItems.values.toList()[index].title),
        subtitle:
            Text('Цена: ${cartData.cartItems.values.toList()[index].price}'),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.remove_circle_outline),
              onPressed: () {
                Provider.of<CartDataProvider>(context, listen: false)
                    .updateItemSubOne(cartData.cartItems.keys.toList()[index]);
              },
            ),
            Text('x${cartData.cartItems.values.toList()[index].number}'),
            IconButton(
              icon: Icon(Icons.add_circle_outline),
              onPressed: () {
                Provider.of<CartDataProvider>(context, listen: false)
                    .updateItemAddOne(cartData.cartItems.keys.toList()[index]);
              },
            ),
          ],
        ),
      ),
    );
  }
}
