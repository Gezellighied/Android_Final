import 'package:flutter_application_1/model/Product.dart';
import 'package:dio/dio.dart';
import 'package:flutter_application_1/model/game.dart';
import 'package:flutter_application_1/model/gamenews.dart';

abstract class  Api {
  Future <List<Product>> getListProduct();
  Future<Product> getdetail(int Idproduct);
  Future<Product> create();
  Future<Product> delete();
  Future<Product> update();
  Future<List<Product>> getlistproductpanging ();
  Future<List<Game>> getListGame();
  Future<Game> getDetailGame(int Idgame);
  Future<List<GameNews>> getGameNew();
  

  get(String s) {}
}