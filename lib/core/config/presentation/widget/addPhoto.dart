// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:lailaty/core/config/presentation/widget/Titles.dart';

// import 'package:lailaty/core/config/presentation/widget/Titles.dart';
import 'package:lailaty/core/resources/color_manager.dart';

class addPhotoWidget extends StatelessWidget {
  final int numberOfAddPhotoContainer;
  final String title;
  final TextStyle styleOfText;
  void Function()? onPressed;
  addPhotoWidget({
    Key? key,
    required this.numberOfAddPhotoContainer,
    required this.title,
    required this.styleOfText,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        FittedBox(
            fit: BoxFit.scaleDown,
            child: HeaderText(text: title, styleOfText: styleOfText)),
      const  SizedBox(
          width: 12,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width / 2,
          height: MediaQuery.of(context).size.height / 8,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            physics: NeverScrollableScrollPhysics(),
            itemCount: numberOfAddPhotoContainer,
            itemBuilder: (context, index) => Align(
              alignment: Alignment.center,
              child: Padding(
                  padding: EdgeInsets.all(5),
                  child: Container(
                    width: MediaQuery.of(context).size.width / 5,
                    height: MediaQuery.of(context).size.height / 6,
                    decoration: BoxDecoration(
                      color: ColorManager.greyWithOpacity,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: IconButton(
                        onPressed: onPressed,
                        icon: const Icon(
                          Icons.add_a_photo_sharp,
                          color: ColorManager.black,
                          size: 22,
                        )),
                  )),
            ),
          ),
        )
      ],
    );
  }
}
