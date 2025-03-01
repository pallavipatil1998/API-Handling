import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;


import 'main_cart_model_api_3.dart';

class CartsHome extends StatefulWidget {
  const CartsHome({super.key});

  @override
  State<CartsHome> createState() => _CartsHomeState();
}

class _CartsHomeState extends State<CartsHome> {
  late Future<MainCartModel> data;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    data=getCarts();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( title: Text("Carts"),),
      body: FutureBuilder<MainCartModel>(
          future: data,
          builder: (ctx,snapshot){
            if(snapshot.connectionState==ConnectionState.waiting){
              return Center(child: CircularProgressIndicator());
            }else{
              if(snapshot.hasError){
                return Center(child: Text("${snapshot.error}"));
              }else if(snapshot.hasData){
                return ListView.builder(
                  itemCount:snapshot.data!.carts!.length ,
                    itemBuilder: ( ctx,index){
                      var mdata=snapshot.data!.carts![index];
                      return Column(
                        children: [
                          ListTile(
                            leading: Text("${snapshot.data!.carts![index].id}"),
                            title: Text("Total Products: ${snapshot.data!.carts![index].totalProducts}"),
                            subtitle: Text("Total Quantity: ${snapshot.data!.carts![index].totalQuantity}"),
                            // trailing: Image.network(snapshot.data!.carts![index].products![index].thumbnail!)
                          ),
                          ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount:  mdata.products!.length,
                              itemBuilder:(_,pindex){
                              var pdata= mdata.products![pindex];
                              return ListTile(
                                leading: Image.network("${pdata.thumbnail}",height: 90,width: 90,),
                                title:Text("${pdata.title}") ,
                                 subtitle: Text("Price: ${pdata.price}"),
                                trailing: Column(
                                  children: [
                                    Text("Quantity:${pdata.quantity}"),
                                    Text("Discount: ${pdata.discountPercentage}"),
                                  ],
                                ),
                              );

                          } )
                        ],
                      );

                    }
                );
              }
            }
            return Container();
          }
    ),

    );
  }
}


Future<MainCartModel> getCarts()async{
  var res= await http.get(Uri.parse("https://dummyjson.com/carts"));
  if(res.statusCode==200){
    var json=jsonDecode(res.body);
    return MainCartModel.fromJson(json);
  }
  return MainCartModel();
}