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
                      return Column(
                        children: [
                          ListView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: mdata.images!.length,
                              itemBuilder: (ctx,imgindex){
                                return Card(
                                    borderOnForeground: true,
                                    color: Colors.blue.shade100,
                                    child: Image.network(mdata.images![imgindex],width: 250,height: 250,));

                              }
                          ),
                          ListTile(
                            leading:Text("${mdata.id}") ,
                            title:Text(mdata.title!,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),) ,
                            subtitle:Column(
                              children: [
                                Text(mdata.description!),
                                Text(mdata.category!),
                                Text("Width:${mdata.dimensions!.width}"),
                                Text("height:${mdata.dimensions!.height}"),
                                Text("Created: ${mdata.meta!.createdAt}"),
                              ],
                            ) ,
                           trailing:Text("Price: ${mdata.price}")  ,
                          ),
                          ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount:mdata.reviews!.length ,
                              itemBuilder: (ctx,rindex){
                                return ListTile(
                                  title: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Text("Ratings *: ${mdata.reviews![rindex].rating}"),
                                          Text("  Name : ${mdata.reviews![rindex].reviewerName}"),

                                        ],
                                      ),
                                      Text("Comment : ${mdata.reviews![rindex].comment}"),
                                    ],
                                  ),
                                );
                              }
                          ),

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


Future<MainProductModel> getProduct()async{
  var res=await http.get(Uri.parse("https://dummyjson.com/products"));
  if(res.statusCode==200){
    var json=jsonDecode(res.body);
    return MainProductModel.fromJson(json);
  }
  return MainProductModel();

}
