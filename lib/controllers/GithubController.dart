
import 'dart:convert';
import 'package:get/get.dart';
import 'package:githubapi/models/GithubModel.dart';
import 'package:http/http.dart' as http;

class GithubController extends GetxController{

  var data = <GithubModel>[].obs;
  var isLoading  = false.obs;



  Future<void> getApiData() async{

    const apiUrl = 'https://api.github.com/repositories';


    final response  = await http.get(Uri.parse(apiUrl));

    if(response.statusCode == 200){

      final List res = jsonDecode(response.body);

      print('Data --> $res');

      data.value = res.map((e) => GithubModel.fromJson(e)).toList();

      print(data);
      print("ashfdasdasd ${data.runtimeType}");

      isLoading.value = false;

      update();
    }

    else{

      Get.snackbar('Error Loading Data !', 'Server Responded : ${response.statusCode} : ${response.reasonPhrase.toString()}');

    }

  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getApiData();
  }


}