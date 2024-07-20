import 'package:flutter_application_1/api/api.dart';
import 'package:flutter_application_1/model/Product.dart';
import 'package:dio/dio.dart';
import 'package:flutter_application_1/model/game.dart';
import 'package:flutter_application_1/model/gamenews.dart';


class ApiImplement extends Api {
  ApiImplement();
  final String baseUrl = "https://api.escuelajs.co/api/v1/products";
  Dio dio = Dio();

  @override
  Future<Product> create() {
    // TODO: implement create
    throw UnimplementedError();
  }

  @override
  Future<Product> delete() {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<List<Product>> getListProduct() async {
    Response response = await dio.get("https://api.escuelajs.co/api/v1/products");
    List <Product> listPro = [];

    for (var item in response.data) {
      listPro.add(Product.fromJson(item));
    }
    return listPro;
  }

  @override
  Future<Product> getdetail(int Idproduct) {
   return dio.get("https://api.escuelajs.co/api/v1/products/"+Idproduct.toString()).then((value) {
      return Product.fromJson(value.data);
    });
  }

  @override
  Future<List<Product>> getlistproductpanging() {
    // TODO: implement getlistproductpanging
    throw UnimplementedError();
  }

  @override
  Future<Product> update() {
    // TODO: implement update
    throw UnimplementedError();
  }

  @override
  Future<List<Game>> getListGame() async {
    Response response = await dio.get("https://www.mmobomb.com/api1/games");
    List <Game> listGame = [];

    for (var item in response.data) {
      listGame.add(Game.fromJson(item));
    }
    return listGame;
  }
  
  @override
  Future<Game> getDetailGame(int Idgame) {
    return dio.get("https://www.mmobomb.com/api1/game?id="+Idgame.toString()).then((value) {
      return Game.fromJson(value.data);
    });
  }

  @override
  Future<List<GameNews>> getGameNew() async {
    Response response = await dio.get("https://www.mmobomb.com/api1/latestnews");
    List <GameNews> listGame = [];

    for (var item in response.data) {
      listGame.add(GameNews.fromJson(item));
    }
    return listGame;    
  }

  
}