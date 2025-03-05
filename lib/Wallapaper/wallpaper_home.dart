import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;

import 'main_Wallpaper_api_3.dart';

class WallpaperHome extends StatefulWidget {
  const WallpaperHome({super.key});

  @override
  State<WallpaperHome> createState() => _WallpaperHomeState();
}

class _WallpaperHomeState extends State<WallpaperHome> {
  late Future<MainWallpaperApi>data;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    data=getWallpaper("birds");
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Wallpaper"),),
      body:  FutureBuilder<MainWallpaperApi>(
          future: data,
          builder: (_,snapshot){
            if(snapshot.connectionState==ConnectionState.waiting){
              return Center(child: CircularProgressIndicator());
            }else{
              if(snapshot.hasError){
                return Center(child: Text("${snapshot.error}"));
              }else if(snapshot.hasData){
                return GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 11,
                    crossAxisSpacing: 11,
                    childAspectRatio: 16/9
                  ),
                  itemCount: snapshot.data!.photos!.length,
                    itemBuilder: (_,index){
                    var eachImage = snapshot.data!.photos![index].src!.landscape!;
                      return Container(
                       decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(21),
                         image: DecorationImage(
                             image: NetworkImage(eachImage),fit:  BoxFit.fill
                         ),
                       ),
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


Future<MainWallpaperApi> getWallpaper(String query)async{
  var url= "https://api.pexels.com/v1/search?query=$query&per_page=20";
  var res =await http.get(Uri.parse(url),headers: {"Authorization": "NlGZHi3aoatDlIyXXXvk3UWopet1FftNMCNdy5xXh1iWeRntf8hiBMgZ"});

  if(res.statusCode==200){
    var json=jsonDecode(res.body);
    return MainWallpaperApi.fromJson(json);
  }
  return MainWallpaperApi();

}