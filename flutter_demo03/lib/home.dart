// Copyright 2018-present the Flutter authors. All Rights Reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'model/product.dart';
import 'model/products_repository.dart';

class HomePage extends StatelessWidget {
  // TODO: Make a collection of cards (102)
  // TODO: Add a variable for Category (104)
  List<Product> products = ProductsRepository.loadProducts(Category.all);

  @override
  Widget build(BuildContext context) {
    // TODO: Return an AsymmetricView (104)
    // TODO: Pass Category variable to AsymmetricView (104)
    final ThemeData theme = Theme.of(context);
    final NumberFormat formatter = NumberFormat.simpleCurrency(
        locale: Localizations.localeOf(context).toString());

    return Scaffold(
      // TODO: Add app bar (102)
      appBar: AppBar(
        title: Text('SHRINE'),
        leading: IconButton(
          icon: Icon(
            Icons.menu,
            semanticLabel: 'menu',
          ),
          onPressed: () {
            print('Menu button');
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.search,
              semanticLabel: 'search',
            ),
            onPressed: () {
              print('Search button');
            },
          ),
          IconButton(
            icon: Icon(
              Icons.tune,
              semanticLabel: 'filter',
            ),
            onPressed: () {
              print('Filter button');
            },
          ),
        ],
      ),
      // TODO: Add a grid view (102)
      body: GridView.builder(
          itemCount: products.length, //确定网格项的数量
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          //构建一个横轴固定数量Widget(能显示多少列)
          itemBuilder: (context, Message) {
            return Card(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)), //设置卡片圆角
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  AspectRatio(
                    aspectRatio: 20 / 12,
                    child: Image.asset(
                      products[Message].assetName,
                      package: products[Message].assetPackage,
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(15.0, 5.0, 10.0, 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            products[Message].name,
                            style: theme.textTheme.title,
                            maxLines: 1,
                          ),
                          SizedBox(
                            height: 8.0,
                          ),
                          Text(
                            formatter.format(products[Message].price),
                            style: theme.textTheme.body2,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            );
          }),
//      ListView.builder(
//        itemBuilder: (context, Message) {
//          return Card(
//            child: ListTile(
//              leading: Image.asset(
//                products[Message].assetName,
//                package: products[Message].assetPackage,
//                fit: BoxFit.contain,
//                width: 100,
//              ),
//              title: Text(
//                products[Message].name,
//              ),
//              subtitle: Text(
//                formatter.format(products[Message].price),
//              ),
//              trailing: IconButton(
//                  icon: Icon(CupertinoIcons.add_circled),
//                  onPressed: () {
//                    Scaffold.of(context).showSnackBar(SnackBar(
//                      content: Text('${products[Message].name}加入了购物车'),
//                      action: SnackBarAction(
//                          label: '测试',
//                          onPressed: () {
//                            print('dd');
//                          }),
//                    ));
//                  }),
//              onLongPress: (){},
//            ),
//          );
//        },
//        itemCount: products.length,
//        itemExtent: 100.0,
//      ),
      resizeToAvoidBottomInset: false,
    );
  }
}
