import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:register_page/MyRegisterPageController.dart';

class UserPage extends StatefulWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  final RegisterPageController controller = Get.find<RegisterPageController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User Page"),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Card(
            elevation: 4,
            margin: EdgeInsets.all(16),
            color: Colors.white,
            shape: RoundedRectangleBorder(
              side: BorderSide(color: Colors.blueAccent, width: 2),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Container(
              margin: EdgeInsets.all(20),
              child: Column(
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        alignment: Alignment.center,
                        image: controller.selectedImagePath.value != null
                            ? FileImage(controller.selectedImagePath.value!)
                            : AssetImage("assets/user.png") as ImageProvider,
                      ),
                    ),
                  ),
                  ListTile(
                    title: Obx(() => Text(
                      controller.ctrUsername.toString(),
                      textAlign: TextAlign.center,
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                    ),),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Obx(() => Text(
                          'Name : ' + controller.ctrName.toString(),
                        ),),
                        Obx(() => Text(
                          'Email : ' + controller.ctrEmail.toString(),
                        ),),
                        Obx(() => Text(
                          'Number Phone : ' + controller.ctrPhone.toString(),
                        ),),
                        Obx(() => Text(
                          'Address : ' + controller.ctrAddress.toString(),
                        ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
