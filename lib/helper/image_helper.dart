String getCvIcon(String image, String darkModeImage, String imageTile) {
  String result = image;
  if (darkModeImage.length > 5) {
    result = darkModeImage;
  }
  if (imageTile.length > 5) {
    result = imageTile;
  }

  return result;
}
