double height = 0;
double width = 0;

extension ScreenWidth on num {
  double screenWidth() {

    return (this / 375) * width;
  }
}

extension TextSize on num {
  double textSize() {
    return this / (812 + 375) * (height + width);
  }
}

extension ScreenHeight on num {
  double screenHeight() {
    return (this / 812) * height;
  }
}
