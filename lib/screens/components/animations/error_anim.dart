import 'package:instragram_clone/screens/components/animations/latie_animations.dart';
import 'package:instragram_clone/screens/components/animations/lottie_animation_view.dart';

class ErrorAnimation extends LottieAnimationView {
  const ErrorAnimation({super.key})
      : super(
          animation: LottieAnimation.error,
        );
}
