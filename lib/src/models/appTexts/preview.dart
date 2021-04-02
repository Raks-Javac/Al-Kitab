class Preview {
  String imgDescription;
  String descriptionText;
  Preview({this.imgDescription, this.descriptionText});
}

class PreviewClassifier {
  List<Preview> previewList = [
    Preview(
      imgDescription: "assets/images/fistPreview.png",
      descriptionText: "Learn  Quran and Recite once everyday",
    ),
    Preview(
      imgDescription: "assets/images/secondPreview.png",
      descriptionText: "Reflect on your actions daily with the words of Allah",
    ),
  ];
}
