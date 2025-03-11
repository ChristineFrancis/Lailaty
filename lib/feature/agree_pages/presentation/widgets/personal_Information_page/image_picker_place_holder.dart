import 'dart:io';
import 'package:file_selector/file_selector.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lailaty/core/resources/color_manager.dart';

class ImagePickerPlaceHolder extends StatefulWidget {
  final String imageKey;
  final double width;
  final double height;
  final Widget noImageWidget;
  final Function(String key, File? image) onImageSelected;

  const ImagePickerPlaceHolder({
    super.key,
    required this.imageKey,
    required this.width,
    required this.height,
    required this.noImageWidget,
    required this.onImageSelected,
  });

  @override
  _ImagePickerPlaceHolderState createState() => _ImagePickerPlaceHolderState();
}

class _ImagePickerPlaceHolderState extends State<ImagePickerPlaceHolder> {
  File? _selectedImage;

  Future<void> _pickImage() async {
    try {
      File? imageFile;

      if (Platform.isAndroid || Platform.isIOS) {
        final ImagePicker picker = ImagePicker();
        final XFile? image = await picker.pickImage(source: ImageSource.gallery);
        if (image != null) {
          imageFile = File(image.path);
        }
      } else if (Platform.isWindows || Platform.isMacOS || Platform.isLinux) {
        final XFile? image = await openFile(
          acceptedTypeGroups: [
            const XTypeGroup(label: 'images', extensions: ['jpg', 'png', 'jpeg']),
          ],
        );
        if (image != null) {
          imageFile = File(image.path);
        }
      } else {
        throw UnsupportedError('This platform is not supported');
      }

      if (imageFile != null) {
        setState(() {
          _selectedImage = imageFile;
        });
        widget.onImageSelected(widget.imageKey, imageFile);
      }
    } catch (e) {
      debugPrint('Error picking image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _pickImage,
      child: Container(
        width: widget.width,
        height: widget.height,
        decoration: BoxDecoration(
          border: Border.all(color: ColorManager.grey1, width: 2),
          borderRadius: BorderRadius.circular(20),
          color: ColorManager.whiteColor,
        ),
        child: _selectedImage == null
            ? widget.noImageWidget
            : ClipRRect(
                borderRadius: BorderRadius.circular(17),
                child: Image.file(
                  _selectedImage!,
                  fit: BoxFit.fill,
                  width: double.infinity,
                  height: double.infinity,
                ),
              ),
      ),
    );
  }
}
