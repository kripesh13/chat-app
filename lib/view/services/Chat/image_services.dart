import 'package:firebase_cloud_firestore/firebase_cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class ImageServices {
  final FirebaseFirestore _storage = FirebaseFirestore.instance;
  final ImagePicker _picker = ImagePicker();
  String imageUrl = '';
  XFile? pickedFile;

  Future<String?> uploadImage() async {
     pickedFile =
        await _picker.pickImage(source: ImageSource.gallery, imageQuality: 1);
    print('image path:----- ${pickedFile?.path}');

    if (pickedFile == null) {
      return null; // User cancelled the picker
    }

    final String fileName =
        '${DateTime.now().millisecondsSinceEpoch}_${pickedFile!.name}';
    Reference referenceRoot = FirebaseStorage.instance.ref();
    final Reference storageDirImage = referenceRoot.child('image');
    final Reference storageImagetoUploadFile = storageDirImage.child(fileName);
    try {
      await storageImagetoUploadFile.putFile(File(pickedFile!.path));
      // Get the download URL
      imageUrl = await storageImagetoUploadFile.getDownloadURL();
      print("Image uploaded successfully. Download URL: $imageUrl");
    } catch (e) {
      print(e.toString());
    }

    return imageUrl;
  }
}
