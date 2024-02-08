import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:githubapi/controllers/GithubController.dart';
import 'package:githubapi/models/GithubModel.dart';

class Home extends StatelessWidget {
  const Home({super.key});


  @override
  Widget build(BuildContext context) {

    GithubController controller = Get.put<GithubController>(GithubController());

    List<GithubModel> data = controller.data;


    return  Scaffold(

      backgroundColor: Colors.black,

      appBar: AppBar(title: Text('Github Api'),),

     body: Obx(
        () => controller.isLoading.value
            ? const Center(child:  CircularProgressIndicator())
            : ListView.builder(
                itemCount: data.length,
                itemBuilder: (_, index) {
                  return Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                    child: Card(
                      color: Theme.of(context).primaryColor,
                      child: ListTile(
                        title: Text(
                          '${data[index].id}.)  ${data[index].fullName.toString()}',
                          style: const TextStyle(color: Colors.white),
                        ),
                        subtitle: Container(
                          padding: EdgeInsets.only(top: 4.sp),
                          child: Text(
                            '${data[index].description}',
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(
                             data[index].owner!.avatarUrl.toString()),
                        ),
                      ),
                    ),
                  );
                },
              ),
      ),


    );
  }
}