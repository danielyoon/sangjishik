import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:sangjishik/core_packages.dart';

class CustomLoadingAnimation extends StatelessWidget {
  const CustomLoadingAnimation({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: LoadingAnimationWidget.twistingDots(size: kMedium, leftDotColor: kPrimary, rightDotColor: kBackground),
    );
  }
}
