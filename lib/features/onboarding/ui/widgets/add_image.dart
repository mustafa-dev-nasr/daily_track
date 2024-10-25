import 'dart:io';

import 'package:daily_track/core/theming/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';

class AddImage extends StatefulWidget {
  const AddImage({
    super.key,
    this.imagePath,
    required this.onImageSelected,
  });

  final String? imagePath;
  final void Function(String imagePath) onImageSelected;

  @override
  _AddImageState createState() => _AddImageState();
}

class _AddImageState extends State<AddImage> {
  late String? _currentImagePath;

  @override
  void initState() {
    super.initState();
    _currentImagePath = widget.imagePath;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _showImagePickerOptions();
      },
      child: Padding(
        padding: const EdgeInsets.all(30),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            SizedBox(
              width: 200.w,
              height: 200.h,

              child: _currentImagePath == null
                  ? Lottie.asset(
                      'assets/lottie/avatar.json', // Example animation URL
                      width: 170,
                      height: 170,
                      fit: BoxFit.fill,
                    )
                  : ClipRRect(
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(35),
                          bottomLeft: Radius.circular(35),
                          bottomRight: Radius.circular(35)),
                      child: Image.file(
                        File(_currentImagePath!),
                        fit: BoxFit.cover,
                      ),
                    ),
              // If an image is selected, don't show the Lottie animation
            ),
            Positioned(
              bottom: -15,
              right: -12,
              child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                    color: purple1, borderRadius: BorderRadius.circular(34)),
                child: IconButton(
                  onPressed: () {
                    _showImagePickerOptions();
                  },
                  icon: _currentImagePath != null
                      ? const Icon(
                          Icons.published_with_changes_outlined,
                          color: Colors.white,
                        )
                      : const Icon(
                          Icons.camera_alt,
                          color: Colors.white,
                        ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
//showCustomDialog

  void _showImagePickerOptions() {
    showGeneralDialog(
      context: context,
      barrierLabel: "info",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: const Duration(milliseconds: 400),
      pageBuilder: (_, __, ___) {
        return Center(
          // Ensure the dialog is centered
          child: Container(
            decoration: const BoxDecoration(
              color:
                  Colors.white, // Add background color for the Material widget
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(35),
                bottomLeft: Radius.circular(35),
                bottomRight: Radius.circular(35),
              ),
            ),
            height: 150,
            width: 300,
            child: Material(
              color: Colors
                  .transparent, // Ensure transparency doesn't overwrite Material
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ListTile(
                    leading: const Icon(Icons.photo_library),
                    title: const Text("Choose from gallery"),
                    onTap: () {
                      Navigator.pop(context);
                      _getImageFromGallery();
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.camera_alt),
                    title: const Text("Take a picture from the camera"),
                    onTap: () {
                      Navigator.pop(context);
                      _getImageFromCamera();
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Future<void> _getImageFromGallery() async {
    final XFile? pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _currentImagePath = pickedFile.path;
      });
      widget.onImageSelected(pickedFile.path);
    }
  }

  Future<void> _getImageFromCamera() async {
    final XFile? pickedFile =
        await ImagePicker().pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      setState(() {
        _currentImagePath = pickedFile.path;
      });
      widget.onImageSelected(pickedFile.path);
    }
  }
}
