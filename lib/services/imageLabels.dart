import 'package:firebase_ml_vision/firebase_ml_vision.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:io';

class ImageLabels {
  final TextRecognizer textRecognizer = FirebaseVision.instance.textRecognizer();

  openImage() async {
    String response = await getImageFile();
    return response;
  }

  getImageFile() async {
    File file = await FilePicker.getFile();
    String text;

    try {
      FirebaseVisionImage visionImage = FirebaseVisionImage.fromFile(file);
      VisionText visionText = await textRecognizer.processImage(visionImage);

      text = visionText.text;
    } catch(e) {
      text = 'Sem foto selecionada';
    }

    return text;
  }

}