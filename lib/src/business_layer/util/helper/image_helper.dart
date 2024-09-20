// import 'dart:io';
//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_image_compress/flutter_image_compress.dart';
// import 'package:grarri_foods/src/business_layer/util/helper/helper.dart';
// import 'package:image_cropper/image_cropper.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:permission_handler/permission_handler.dart';
//
// class ImageHelper {
//   /// Constructor for the [ImageHelper] class.
//   /// It is marked as private and should not be accessed from outside this class.
//   ImageHelper._privateConstructor();
//
//   /// Method used to get an image from the photo library.
//   /// [openPopup]: A required callback function that opens a popup or dialog.
//   /// Returns a [Future<XFile?>] representing the selected image, or null if an error occurs.
//   static Future<XFile?>? getImageFromGallery(
//       {required Function openPopup}) async {
//     XFile? selectedImage;
//     try {
//       /// Use the [ImagePicker] plugin to select an image from the photo gallery.
//       selectedImage = await ImagePicker().pickImage(
//         maxHeight: 800,
//         maxWidth: 450,
//         source: ImageSource.gallery,
//       );
//     } on PlatformException catch (e) {
//       if (e.code == "photo_access_denied") {
//         /// Log an error message and request permission to access the photo library.
//         LogHelper.logError("Error in accessing photo library ====> $e");
//         _checkPhotoGalleryPermission(openInfoDialog: openPopup);
//       } else {
//         /// Log an error for other platform exceptions.
//         LogHelper.logError(
//             "In platform catch error while getting image from photo library =====> $e");
//       }
//     } catch (e) {
//       /// Log an error for other exceptions.
//       LogHelper.logError(
//           "In catch error while getting image from photo library =====> $e");
//     }
//     return selectedImage;
//   }
//
//   /// Method used to get an image from the photo library.
//   /// [openPopup]: A required callback function that opens a popup or dialog.
//   /// Returns a [Future<XFile?>] representing the selected image, or null if an error occurs.
//   static Future<List<XFile>?> getMultipleImageFromGallery(
//       {required Function openPopup}) async {
//     List<XFile>? selectedImage;
//     try {
//       /// Use the [ImagePicker] plugin to select an image from the photo gallery.
//       selectedImage = await ImagePicker()
//           .pickMultiImage(maxHeight: 800, maxWidth: 450, limit: 5);
//     } on PlatformException catch (e) {
//       if (e.code == "photo_access_denied") {
//         /// Log an error message and request permission to access the photo library.
//         LogHelper.logError("Error in accessing photo library ====> $e");
//         _checkPhotoGalleryPermission(openInfoDialog: openPopup);
//       } else {
//         /// Log an error for other platform exceptions.
//         LogHelper.logError(
//             "In platform catch error while getting image from photo library =====> $e");
//       }
//     } catch (e) {
//       /// Log an error for other exceptions.
//       LogHelper.logError(
//           "In catch error while getting image from photo library =====> $e");
//     }
//     return selectedImage;
//   }
//
//   /// Method used to get an image from the camera.
//   /// [openPopup]: A required callback function that opens a popup or dialog.
//   /// [preferredCameraDevice]: The preferred camera device to use (default is rear).
//   /// Returns a [Future<XFile?>] representing the selected image, or null if an error occurs.
//   static Future<XFile?>? getImageFromCamera({
//     required Function openPopup,
//     CameraDevice preferredCameraDevice = CameraDevice.rear,
//   }) async {
//     XFile? selectedImage;
//     try {
//       /// Use the ImagePicker plugin to capture an image from the camera.
//       selectedImage = await ImagePicker().pickImage(
//         maxHeight: 800,
//         maxWidth: 450,
//         source: ImageSource.camera,
//         preferredCameraDevice: preferredCameraDevice,
//       );
//     } on PlatformException catch (e) {
//       if (e.code == "camera_access_denied") {
//         /// Log an error message and request permission to access the camera.
//         LogHelper.logError("Error in accessing camera ======> $e");
//         _checkCameraPermission(openInfoDialog: openPopup);
//       } else {
//         /// Log an error for other platform exceptions.
//         LogHelper.logError(
//             "In platform catch error while getting image from camera =====> $e");
//       }
//     } catch (e) {
//       /// Log an error for other exceptions.
//       LogHelper.logError(
//           "In catch error while getting image from camera ======> $e");
//     }
//     return selectedImage;
//   }
//
//   /// Method used to crop a picked image.
//   /// [imageFilePath]: The path to the image file to be cropped.
//   /// [aspectRatio]: Optional aspect ratio for cropping.
//   /// Returns a [Future<XFile?>] representing the cropped image, or null if an error occurs.
//   static Future<XFile?> cropImage(String imageFilePath,
//       {CropAspectRatio? aspectRatio}) async {
//     CroppedFile? croppedImage;
//     try {
//       /// Use the ImageCropper plugin to crop the selected image.
//       croppedImage = await ImageCropper().cropImage(
//         sourcePath: imageFilePath,
//         compressQuality: 100,
//         aspectRatio: aspectRatio,
//         uiSettings: [
//           AndroidUiSettings(
//             showCropGrid: true,
//             initAspectRatio: CropAspectRatioPreset.original,
//             lockAspectRatio: true,
//             cropStyle: CropStyle.rectangle,
//           ),
//           IOSUiSettings(
//             aspectRatioLockEnabled: true,
//             cropStyle: CropStyle.rectangle,
//           ),
//         ],
//         compressFormat: ImageCompressFormat.png,
//         // cropStyle: CropStyle.rectangle,
//       );
//
//       /// Compress and return the cropped image.
//       return await _getCompressedImage(File(croppedImage!.path));
//     } catch (e) {
//       /// Log an error if cropping fails and return null.
//       LogHelper.logError("In catch error while cropping image ======> $e");
//       return null;
//     }
//   }
//
//   /// Private method to get a compressed image.
//   /// [file]: The file to be compressed.
//   /// Returns a [Future<XFile?>] representing the compressed image,
//   /// or null if an error occurs.
//   static Future<XFile?> _getCompressedImage(File? file) async {
//     if (file == null) {
//       return null;
//     }
//     try {
//       /// Obtain a temporary directory and create a new file path for the compressed image.
//       Directory tempDir = await getTemporaryDirectory();
//       var path = tempDir.path;
//
//       /// Handle file naming and avoid overwriting.
//       /// Clear image cache to avoid using cached data.
//       imageCache.clearLiveImages();
//       imageCache.clear();
//
//       /// Compress and return the compressed image.
//       return await _compress(file, path);
//     } catch (e) {
//       /// Log an error if compression fails and return null.
//       LogHelper.logError("Error while getting compressed image =====> $e");
//       return null;
//     }
//   }
//
//   /// Private method to compress an image.
//   /// [prevFile]: The original file to be compressed.
//   /// [tempPath]: The path for the compressed image.
//   /// Returns a [Future<XFile?>] representing the compressed image,
//   /// or null if an error occurs.
//   static Future<XFile?> _compress(File prevFile, String tempPath) async {
//     try {
//       /// Compress the image and return the result.
//       final result = await FlutterImageCompress.compressAndGetFile(
//         prevFile.path,
//         tempPath,
//         quality: 5,
//         format: CompressFormat.png,
//       );
//       return result;
//     } catch (e) {
//       /// Log an error if compression fails and return null.
//       LogHelper.logError("Error while compress image =====> $e");
//       return null;
//     }
//   }
//
//   /// Private method to handle photo library access permission.
//   /// [openInfoDialog]: A required callback function to open
//   /// an information dialog.
//   static void _checkPhotoGalleryPermission(
//       {required Function openInfoDialog}) async {
//     try {
//       /// Request permission to access the photo library and open
//       /// an info dialog if not granted.
//       PermissionStatus imageGalleryPermission =
//           await Permission.photos.request();
//       if (!imageGalleryPermission.isGranted) {
//         openInfoDialog();
//       }
//     } on Exception catch (e) {
//       /// Log an error if permission request fails.
//       LogHelper.logError(
//           "Error while requesting photo library permission =======> $e");
//     }
//   }
//
//   /// Private method to handle camera access permission.
//   /// [openInfoDialog]: A required callback function to open an information dialog.
//   static void _checkCameraPermission({required Function openInfoDialog}) async {
//     try {
//       /// Request permission to access the camera and open an info dialog if not granted.
//       PermissionStatus cameraPermission = await Permission.camera.request();
//       if (!cameraPermission.isGranted) {
//         await openInfoDialog();
//       }
//     } on Exception catch (e) {
//       /// Log an error if permission request fails.
//       LogHelper.logError(
//           "Error while requesting camera permission =======> $e");
//     }
//   }
// }
