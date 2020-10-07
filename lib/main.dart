import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MyModel>(
      create: (context)=>MyModel(),
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(title: Text('My App')),
          body: Column(
            children: <Widget>[

              Container(
                padding: const EdgeInsets.all(20),
                color: Colors.green[200],
                child: Consumer<MyModel>(
                  builder:  (context,myModel,child){
                      return RaisedButton(
                          child: Text('doSomething'),
                          onPressed: (){
                            myModel.doSomething();
                      });
                  },
                ),
              ),

              Container(
                width: 200,
                height: 300,
                padding: const EdgeInsets.all(35),
                color: Colors.blue[200],
                child: Consumer<MyModel>( //                    <--- Consumer
                  builder: (context, myModel, child) {
                    return ListView.builder(itemCount : myModel.list.length ,
                    itemBuilder: (context,index){
                        return Text(myModel.list.elementAt(index),style: TextStyle(color: Colors.black),);
                    },);
                  },
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
class MyModel with ChangeNotifier { //                                               <--- MyModel
  List<String>list=[];
  void doSomething() {
    list.add('value');
    notifyListeners();
    print(list);
  }

}