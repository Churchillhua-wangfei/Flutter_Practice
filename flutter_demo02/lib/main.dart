import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
	// This widget is the root of your application.
	@override
	Widget build(BuildContext context) {
		return MaterialApp(
			title: 'Dialog组件',
			theme: ThemeData(
				primarySwatch: Colors.blue,
			),
			home: MyHomePage(title: '对话框组件演练'),
		);
	}
}

class MyHomePage extends StatefulWidget {
	MyHomePage({Key key, this.title}) : super(key: key);

	final String title;

	@override
	_MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
//打开AboutDialog
	void showAboutDialog(BuildContext context) {
//    调用方法
		showDialog(
				context: context,
//        构造器
				builder: (_) => new AboutDialog(
					applicationName: "Google",
					applicationIcon: Icon(Icons.group_work),
					applicationVersion: 'X64-86',
					applicationLegalese: 'English',
					children: <Widget>[
						Text('这是世界上最好的浏览器'),
					],
				));
	}

	@override
	Widget build(BuildContext context) {
		return Center(
			child: RaisedButton(
				child: Text('点击打开Dialog--'),
				onPressed: () {
					showAboutDialog(context);
				},
				splashColor: Colors.pink,
			),
		);
//		return Center(
//			child: Dialog(
//				child: Container(
//					height: 200.0,
//					child: Column(
//						mainAxisAlignment: MainAxisAlignment.spaceAround,
//						children: <Widget>[
//							Text('这是一个Dialog'),
//							RaisedButton(
//								onPressed: () {
//									Navigator.of(context).pop();
//								},
//								splashColor: Colors.purple,
//								child: Text('取消'),
//							)
//						],
//					),
//				),
//			),
//		);
	}
}
