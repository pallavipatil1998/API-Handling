import 'dart:convert';

import 'package:flutter/material.dart';

import 'main_product_model_5.dart';
import 'package:http/http.dart'as http;

class ProductHome extends StatefulWidget {
  const ProductHome({super.key});

  @override
  State<ProductHome> createState() => _ProductHomeState();
}

class _ProductHomeState extends State<ProductHome> {
  late Future<MainProductModel> data;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    data=getProduct();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Products"),),
      body: FutureBuilder<MainProductModel>(
          future: data,
          builder: (ctx,snapshot){
            if(snapshot.connectionState==ConnectionState.waiting){
              return Center(child: CircularProgressIndicator());
            }else{
              if(snapshot.hasError){
                print(snapshot.error);
                return Center(child: Text("${snapshot.error}"));
              }else if(snapshot.hasData){
                return ListView.builder(
                  itemCount: snapshot.data!.products!.length,
                    itemBuilder: (ctx,index){
                    var mdata=snapshot.data!.products![index];
                      return ListTile(
                        leading:Text("${snapshot.data!.products![index].id}") ,
                        title:Text(snapshot.data!.products![index].title!) ,
                        subtitle:Text(mdata.category!) ,
                       trailing:Text("${mdata.price}")  ,
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


Future<MainProductModel> getProduct()async{
  var res=await http.get(Uri.parse("https://dummyjson.com/products"));
  if(res.statusCode==200){
    var json=jsonDecode(res.body);
    return MainProductModel.fromJson(json);
  }
  return MainProductModel();

}
