import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
	// This widget is the root of your application.
	@override
	Widget build(BuildContext context) {
		return MaterialApp(
			title: 'Flutter Demo',
			theme: ThemeData(
				primarySwatch: Colors.blue,
			),
			home: MyHomePage(title: 'FloatingActionButton案例演示'),
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
	@override
	Widget build(BuildContext context) {

		return Scaffold(
			appBar: AppBar(
				// Here we take the value from the MyHomePage object that was created by
				// the App.build method, and use it to set our appbar title.
				title: Text(widget.title),
				actions: <Widget>[
					FlatButton(
							onPressed: () {},
							child: DropdownButton(
									icon: Icon(
										Icons.file_download,
										color: Colors.pink,
										size: 30.0,
									),
									items: <DropdownMenuItem>[
										DropdownMenuItem(
											child: Text('选项1'),
											value: 1,
										),
										DropdownMenuItem(
											child: Text('选项2'),
											value: 2,
										),
										DropdownMenuItem(
											child: Text('选项3'),
											value: 3,
										),
										DropdownMenuItem(
											child: Text('选项4'),
											value: 4,
										),
									],
									onChanged: (value) {
										print(value);
									})),
					FlatButton(
						onPressed: () {},
						child: PopupMenuButton(
								icon: Icon(
									CupertinoIcons.add_circled_solid,
									color: Colors.pink,
									size: 30.0,
								),
								onSelected: (value) {
									print(value);
								},
								itemBuilder: (context) => <PopupMenuItem>[
									PopupMenuItem(
										child: SizedBox(
											child: Row(
												children: <Widget>[
													Icon(CupertinoIcons.conversation_bubble,
															color: Colors.pink),
													Text('发起群聊'),
												],
											),
										),
										value: 1,
									),
									PopupMenuItem(
										child: SizedBox(
											child: Row(
												children: <Widget>[
													Icon(CupertinoIcons.person_add_solid,
															color: Colors.pink),
													Text('添加朋友'),
												],
											),
										),
										value: 2,
									),
									PopupMenuItem(
										child: SizedBox(
											child: Row(
												children: <Widget>[
													Icon(CupertinoIcons.search, color: Colors.pink),
													Text('扫一扫'),
												],
											),
										),
										value: 3,
									),
									PopupMenuItem(
										child: SizedBox(
											child: Row(
												children: <Widget>[
													Icon(Icons.monetization_on, color: Colors.pink),
													Text('收付款'),
												],
											),
										),
										value: 4,
									),
									PopupMenuItem(
										child: SizedBox(
											child: Row(
												children: <Widget>[
													Icon(Icons.help, color: Colors.pink),
													Text('帮助与反馈'),
												],
											),
										),
										value: 5,
									),
								]),
					),
				],
			),
			body: Center(

				child: Column(

					mainAxisAlignment: MainAxisAlignment.center,
					children: <Widget>[
						//文本组件

						OutlineButton.icon(
								onPressed: () {
									print('打开OutlineButton01');
									showDialog(
											context: context,
											child: AboutDialog(
												applicationIcon: Icon(Icons.android),
												applicationVersion: '3.5.2',
												applicationName: 'Android studio',
												applicationLegalese: 'Chinese',
												children: <Widget>[
													Text('by jetbrain mono'),
													Text('copy right by jetbrain'),
												],
											));
								},
								splashColor: Colors.amber,
								icon: Icon(
									Icons.access_alarm,
									size: 18.0,
									color: Colors.pink,
								),
								label: Text(
									'OutlineButton--图标按钮',
									style: TextStyle(fontSize: 18.0, color: Colors.cyan),
								)),
						OutlineButton(
							child: Text(
								'outLineButton按钮',
								style: TextStyle(
									fontSize: 20.0,
								),
							),
							onPressed: () {
								print('打开OutlineButton02');
							},
//            边框的颜色
							borderSide: BorderSide(color: Colors.lightBlueAccent, width: 5.0),
//              按钮背景色
							color: Colors.pink,
//              按钮失效时的颜色
							disabledBorderColor: Colors.grey,
//              高亮时的背景色
							highlightedBorderColor: Colors.green,
//              失效时文本颜色
							disabledTextColor: Colors.black,
							textColor: Colors.black,
//              按钮主题
							textTheme: ButtonTextTheme.normal,
//              墨汁飞溅的颜色
							splashColor: Colors.pink,
//              抗锯齿能力
							clipBehavior: Clip.antiAlias,
//                内边距
							padding: new EdgeInsets.only(
									bottom: 5.0, top: 5.0, left: 5.0, right: 5.0),
						),
						Text(
							'FloatingActionButton案例演示',
							style: TextStyle(fontSize: 24.0, fontStyle: FontStyle.italic),
						),
						IconButton(
							icon: Icon(CupertinoIcons.gear_big),
							onPressed: () {
								print('打开IconButton');
							},
							splashColor: Colors.pink,
						),
						RaisedButton(
							onPressed: () {
								print('打开RaisedButton');
								//弹出对话框的函数
								showDialog(
										context: context,
										builder: (context) {
											return AlertDialog(
												title: Text(
													'警告提示',
													style: TextStyle(
															fontSize: 30,
															fontWeight: FontWeight.bold,
															color: Colors.red),
												),
												content: SingleChildScrollView(
													child: ListBody(
														children: <Widget>[
															Text(
																'是否要删除?',
																style: TextStyle(color: Colors.white),
															),
															Text(
																'一旦删除不可恢复！',
																style: TextStyle(color: Colors.white),
															),
														],
													),
												),
												//对话框按钮
												actions: <Widget>[
													FlatButton(
															onPressed: () {
																Navigator.of(context)
																		.pop(); //利用路由关闭 ---利用栈的方式（出栈）
															},
															child: Text(
																'确定',
																style: TextStyle(color: Colors.brown),
															)),
													FlatButton(
															onPressed: () {
																Navigator.of(context)
																		.pop(); //利用路由关闭 ---利用栈的方式（出栈）
															},
															child: Text(
																'取消',
																style: TextStyle(color: Colors.purple),
															))
												],
												backgroundColor: Colors.blueGrey,
												shape: RoundedRectangleBorder(
														borderRadius: BorderRadius.circular(25)), //设置圆角矩形
											);
										});
							},
							splashColor: Colors.pink,
							child: SizedBox(
								//加上一个sizeBox限定边框
								width: 80,
								child: Row(
									children: <Widget>[
										Text('凸出按钮'),
										Icon(CupertinoIcons.battery_charging, color: Colors.green),
									],
								),
							),
						),
						FlatButton(
								onPressed: () {
									print('打开FlatButton');
									//弹出对话框的属性
									showDialog(
										context: context, //必须属性
										child: SimpleDialog(
											title: Text(
												'温馨提示',
												style: TextStyle(
														color: Colors.white,
														fontSize: 20.0,
														fontStyle: FontStyle.italic),
											),
											children: <Widget>[
												SimpleDialogOption(
													child: Text('现在时间：'),
													onPressed: () {
														print('现在时间是：18点42分');
													},
												),
												SimpleDialogOption(
													child: Text('18点40分'),
													onPressed: () {
														Navigator.of(context).pop(); //利用路由关闭 ---利用栈的方式（出栈）
													},
												)
											],
											backgroundColor: Colors.amber,
											shape: RoundedRectangleBorder(
													borderRadius: BorderRadius.circular(30)),
										),
									);
								},
								splashColor: Colors.pink,
								child: Text('扁平按钮-显示时间',
										style: TextStyle(
												fontSize: 20.0, fontStyle: FontStyle.italic))),
					],
				),
			),

			floatingActionButton: Builder(builder: (context) {
				return FloatingActionButton(
					onPressed: () {
						print('打开floatingActionButton');
						Scaffold.of(context).showSnackBar(SnackBar(
							content: Text('带按钮的SnackBar'),
							action: SnackBarAction(
									label: '关闭',
									onPressed: () {
										print('关闭floatingActionButton');
									}),
							backgroundColor: Colors.grey,
							duration: Duration(seconds: 2), //这里设置延迟2妙后消失提示框
						));
					},
					tooltip: '正在增加',
					child: Text('点我'),
					foregroundColor: Colors.pink,
					backgroundColor: Colors.grey,
					elevation: 10,
					// 未点击的阴影
					highlightElevation: 10,
					//点击后的阴影
					shape: CircleBorder(),
					//这里设置形状为圆角矩形
					mini: false, //这里设置按钮为迷你形状
				);
			}),

			floatingActionButtonLocation:
			FloatingActionButtonLocation.endDocked, //这里设置的是按钮的位置
			// This trailing comma makes auto-formatting nicer for build methods.
		);
	}
}
