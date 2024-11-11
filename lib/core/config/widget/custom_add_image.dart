import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CustomAddImage extends StatefulWidget {
  CustomAddImage({super.key, required this.width, required this.height,  required this.wigthBorder, required this.borderRadius});
  final double width;
  final double height;
  final double wigthBorder;
  final double borderRadius;
  @override
  State<CustomAddImage> createState() => _CustomAddImageState();
}

class _CustomAddImageState extends State<CustomAddImage> {
  final imagePicker = ImagePicker();

  File? image;

  XFile? pickedFile;

  uploadImage() async {
    pickedFile = await imagePicker.pickImage(source: ImageSource.gallery);
    print(pickedFile);
    if (pickedFile != null) {
      setState(() {
        image = File(pickedFile!.path);
      });
    } else {}
    print(image);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        width: MediaQuery.of(context).size.width / widget.width,
        height: MediaQuery.of(context).size.height / widget.height,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(widget.borderRadius),
            border: Border.all(
                style: BorderStyle.solid,
                width:widget.wigthBorder,
                strokeAlign: BorderSide.strokeAlignCenter)
            // color: AppColor.purple5
            ),
        //  color: AppColor.black,
        child: InkWell(
          onTap: () {
            uploadImage();
            print(image);
          },
          child: Center(
              child: image == null
                  ? Icon(
                      Icons.add_a_photo_outlined,
                      size: 60,
                    )
                  : Image.file(
                      image!,
                      width: MediaQuery.of(context).size.width / widget.width,
                      height: MediaQuery.of(context).size.height / widget.height,
                      fit: BoxFit.cover,
                    )),
        ),
      ),
    );
  }
}
