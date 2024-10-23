import 'dart:io';

import 'package:daily_track/core/theming/app_colors.dart';
import 'package:daily_track/features/add_info/ui/widgets/add_enfo_body.dart';
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
            Container(
              width: 200.w,
              height: 200.h,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: _currentImagePath != null
                      ? FileImage(File(
                          _currentImagePath!,
                        ))
                      : const AssetImage('assets/avatar.webp')
                          as ImageProvider<Object>, // Placeholder image
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(300),
              ),
              child: _currentImagePath == null
                  ? Lottie.asset(
                      'assets/lottie/avatar.json', // Example animation URL
                      width: 170,
                      height: 170,
                      fit: BoxFit.fill,
                    )
                  : null, // If an image is selected, don't show the Lottie animation
            ),
            Positioned(
              bottom: -1,
              right: 10,
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

  void _showImagePickerOptions() {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          height: 150,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text('اختر من المعرض'),
                onTap: () {
                  Navigator.pop(context);
                  _getImageFromGallery();
                },
              ),
              ListTile(
                leading: const Icon(Icons.camera_alt),
                title: const Text('التقط صورة من الكاميرا'),
                onTap: () {
                  Navigator.pop(context);
                  _getImageFromCamera();
                },
              ),
            ],
          ),
        );
      },
    );
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
/**
 *  Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: blue,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(2500),
                ),
                alignment: Alignment.center,
                width: 250,
                height: 250,
                child: Lottie.asset(
                  'assets/lottie/avatar.json', // Example animation URL
                  width: 170,
                  height: 170,
                  fit: BoxFit.fill,
                )),
 */