
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'Model/UserModel.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, });


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  Future<UserModel> getUserApi()async{
    final response = await http.get(Uri.parse('https://webhook.site/d1157539-dc26-451f-8b2b-aed944069b91'));
    var data = jsonDecode(response.body.toString());
    print(data);
    if(response.statusCode == 200){
      return UserModel.fromJson(data);
    }else{
      return UserModel.fromJson(data);
    }

  }


  @override
  Widget build(BuildContext context) {


    return Scaffold(
        appBar: AppBar(
          title: Text('Rest API'),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Expanded(
                child: FutureBuilder<UserModel>(
                  future: getUserApi(),
                  builder: (context, snapshot) {
                    if(snapshot.hasData){
                      return ListView.builder(
                          itemCount: snapshot.data!.employees!.length,
                          itemBuilder: (context,index){
                            return Column(
                              children: [
                                Container(
                                  width:MediaQuery.of(context).size.width*.3,
                                  height:MediaQuery.of(context).size.height*.1,
                                  color:Colors.orange,
                                  child: ListView.builder(

                                      itemBuilder: (context,index){

                                        return Container(
                                          width:MediaQuery.of(context).size.width*.25,
                                          height:MediaQuery.of(context).size.height*.5,
                                          color: Colors.green,


                                        );

                                      }

                                  ),
                                )
                              ],

                            );

                          }
                      );
                    }else{

                      return Center(
                        child: CircularProgressIndicator(

                        ) ,
                      );

                    }
                  },

            )
            )
          ],
        )

    );
  }
}
