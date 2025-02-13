import 'dart:io';
import 'package:file_selector/file_selector.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lailaty/core/resources/key_manager.dart';
import 'package:provider/provider.dart';

class PersonalInformationView extends ChangeNotifier {
  final Map<String, File?> _sectionImages = {};

  File? getImage(String sectionId) => _sectionImages[sectionId];

  Future<void> pickImage(String sectionId) async {
    try {
      if (Platform.isAndroid || Platform.isIOS) {
        final ImagePicker picker = ImagePicker();
        final XFile? image = await picker.pickImage(
          source: ImageSource.gallery,
        );

        if (image != null) {
          _sectionImages[sectionId] = File(image.path);
          notifyListeners();
        }
      } else if (Platform.isWindows || Platform.isMacOS || Platform.isLinux) {
        final XFile? image = await openFile(
          acceptedTypeGroups: [
            const XTypeGroup(
              label: 'images',
              extensions: ['jpg', 'png', 'jpeg'],
            ),
          ],
        );

        if (image != null) {
          _sectionImages[sectionId] = File(image.path);
          notifyListeners();
        }
      } else {
        throw UnsupportedError('This platform is not supported');
      }
    } catch (e) {
      debugPrint('Error picking image: $e');
      rethrow;
    }
  }

//to validate:
  bool validateImages(BuildContext context) {
    final viewModel = context.read<PersonalInformationView>();

    return viewModel.getImage(AppKeys.licenseFront) != null &&
        viewModel.getImage(AppKeys.licenseBack) != null &&
        viewModel.getImage(AppKeys.nationalIdFront) != null &&
        viewModel.getImage(AppKeys.nationalIdBack) != null &&
        viewModel.getImage(AppKeys.personalPhoto) != null;
  }

  bool validateImagesInCarInfoView(BuildContext context) {
    final viewModel = context.read<PersonalInformationView>();

    return viewModel.getImage(AppKeys.frontLecienceCar) != null &&
        viewModel.getImage(AppKeys.backLecienceCar) != null &&
        viewModel.getImage(AppKeys.carBack) != null &&
        viewModel.getImage(AppKeys.carFront) != null &&
        viewModel.getImage(AppKeys.carInner) != null &&
        viewModel.getImage(AppKeys.carRight) != null &&
        viewModel.getImage(AppKeys.carleft) != null;
  }

  bool validateImagesInMotorInfoView(BuildContext context) {
    final viewModel = context.read<PersonalInformationView>();

    return viewModel.getImage(AppKeys.motorPhoto) != null &&
        viewModel.getImage(AppKeys.frontMotorLicence) != null &&
        viewModel.getImage(AppKeys.backLecienceCar) != null;
  }

  bool validateImagesInFleetInfoCompany(BuildContext context) {
    final viewModel = context.read<PersonalInformationView>();
    return viewModel.getImage(AppKeys.commercialRegistrationImageKey) != null &&
        viewModel.getImage(AppKeys.postcardCopyImageKey) != null;
  }
}
