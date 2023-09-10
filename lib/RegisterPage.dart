import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:register_page/UserPage.dart';
import 'package:image_picker/image_picker.dart';
import 'MyRegisterPageController.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  final RegisterPageController controller = Get.put(RegisterPageController());
  TextEditingController ctrUsername = TextEditingController();
  TextEditingController ctrName = TextEditingController();
  TextEditingController ctrEmail = TextEditingController();
  TextEditingController ctrPhone = TextEditingController();
  TextEditingController ctrAddress = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ctrUsername = new TextEditingController();
    ctrName = new TextEditingController();
    ctrEmail = new TextEditingController();
    ctrPhone = new TextEditingController();
    ctrAddress = new TextEditingController();
  }

  Widget myText(String label, bool isObsecure, TextEditingController controller, IconData? iconData){
    return Container(
      margin: EdgeInsets.all(10),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius:BorderRadius.circular(15),),
          helperStyle: TextStyle(color: Colors.grey),
          labelText: label,
          prefixIcon: Icon(iconData),
        ),
      ),
    );
  }

  Widget myPhone(String label, bool isObsecure, TextEditingController controller, IconData iconData){
    return Container(
      margin: EdgeInsets.all(10),
      child: TextField(
        controller: controller,
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius:BorderRadius.circular(15),),
          helperStyle: TextStyle(color: Colors.grey),
          labelText: label,
          prefixIcon: Icon(iconData),
        ),
        maxLength: 20,
      ),
    );
  }

  Future<void> _getImageFromGallery() async {
    final imagePicker = ImagePicker();
    final pickedFile = await imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      controller.selectedImagePath.value = File(pickedFile.path);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register Page"),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(left: 30, right: 30, top: 50),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: _getImageFromGallery,
                  child: Obx(() {
                    return Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: controller.selectedImagePath.value != null
                              ? FileImage(controller.selectedImagePath.value!)
                              : AssetImage("assets/user.png") as ImageProvider,
                        )
                      ),
                    );
                  }),
                ),
                myText("Username", true, ctrUsername, Icons.account_box),
                myText("Name", true, ctrName, Icons.person),
                myText("Email", true, ctrEmail, Icons.email),
                myPhone("Number Phone", true, ctrPhone, Icons.phone),
                myText("Address", true, ctrAddress, Icons.location_on),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: ElevatedButton(onPressed: () {
                        controller.ctrRegister(ctrUsername.text, ctrName.text, ctrEmail.text, ctrPhone.text, ctrAddress.text, controller.selectedImagePath.value,);
                        Get.to(() => UserPage())?.then((value) {
                          ctrUsername.clear();
                          ctrName.clear();
                          ctrEmail.clear();
                          ctrPhone.clear();
                          ctrAddress.clear();
                          controller.selectedImagePath.value = null;
                        });
                      }, child: Text("Register")),
                    ),
                    SizedBox(width: 20), // Spacing between buttons
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
