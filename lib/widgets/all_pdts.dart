
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import '../models/products.dart';
import './pdt_item.dart';

class AllProducts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productData=Provider.of<Products>(context);
    final pdts=productData.items;
/*    return GridTile(
        footer: Container(
          color: Colors.white70,
          child: ListTile(
            leading: Text(
              prod_name,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            title: Text(
              "\$$prod_price",
              style: TextStyle(
                  color: Colors.red, fontWeight: FontWeight.w800),
            ),
            subtitle: Text(
              "\$$prod_old_price",
              style: TextStyle(
                  color: Colors.black54,
                  fontWeight: FontWeight.w800,
                  decoration
                      :TextDecoration.lineThrough),
            ),
          ),
        ),
        child: Image.asset(
          prod_pricture,
          fit: BoxFit.cover,
        ));*/
  return GridView.builder(
      physics: ScrollPhysics(),
      shrinkWrap: true,
      itemCount: pdts.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (ctx, i)=>ChangeNotifierProvider.value(value: pdts[i],
      child: PdtItem(name: pdts[i].name,imageUrl: pdts[i].imgUrl,)),
    );
  }
}