import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class RegisterPageController extends GetxController {

  var ctrUsername = RxString('initial');
  var ctrName = RxString('initial');
  var ctrEmail = RxString('initial');
  var ctrPhone = RxString('initial');
  var ctrAddress = RxString('initial');
  var selectedImagePath = Rx<File?>(null);

  ctrRegister(String username, String name, String email, String phoneNumber, String address, File? imageFile) {
    ctrUsername.value = username;
    ctrName.value = name;
    ctrEmail.value = email;
    ctrPhone.value = phoneNumber;
    ctrAddress.value = address;
    selectedImagePath.value = imageFile;
  }
}