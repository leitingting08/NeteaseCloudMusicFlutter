import 'dart:async';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';

Map<String,dynamic> optHeader = {
  'accept-language':'zh-cn',
  'content-type':'application/json'
};

var dio = new Dio(BaseOptions(connectTimeout: 30000,headers: optHeader));

class NetUtils {
  static Future<Dio> instance() async{
    if (dio == null) {
      dio = new Dio();
    }
    
    //添加拦截器
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (RequestOptions options) {
          print("请求之前");
          // Do something before request is sent
          return options; //continue
        },
        onResponse: (Response response) {
          print(response);
          // Do something with response data
          return response; // continue
        },
        onError: (DioError e) {
          print("错误之前");
          // Do something with response error
          return e; //continue
        },
      ),
    );
    return dio;
  }

 static Future get(String url, [Map<String, dynamic> params]) async {
    var response;

    // 设置代理 便于本地 charles 抓包
    // (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
    //     (HttpClient client) {
    //   client.findProxy = (uri) {
    //     return "PROXY 30.10.26.193:8888";
    //   };
    // };

    Directory documentsDir = await getApplicationDocumentsDirectory();
    String documentsPath = documentsDir.path;
    var dir = new Directory("$documentsPath/cookies");
    await dir.create();
    if (params != null) {
      response = await dio.get(url, queryParameters: params);
    } else {
      response = await dio.get(url);
    }
    return response.data;
  }

  static Future post(String url, Map<String, dynamic> params) async {
    var response = await (await instance()).post(url, data: params);
    return response.data;
  }
}
