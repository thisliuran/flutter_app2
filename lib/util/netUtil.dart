import 'package:dio/dio.dart';
import 'dart:convert';

const baseUrl = "http://127.0.0.1:10005/api";
//要查网络请求的日志可以使用过滤<net>
class NetUtil {

  static Future get(url,{Map<String,Object> data}) async {

    Dio dio = new Dio(); // 使用默认配置

// 配置dio实例
    dio.options.baseUrl="http://127.0.0.1:10005/api";
    dio.options.connectTimeout = 5000; //5s
    dio.options.receiveTimeout=3000;
    Response response;
    response=await dio.get(url);
    print(response.statusCode);
    return response.data.toString();
  }
  }