import 'package:instragram_clone/screens/components/animations/latie_animations.dart';
import 'package:instragram_clone/screens/components/animations/lottie_animation_view.dart';

class LoadingAnimation extends LottieAnimationView {
  const LoadingAnimation({super.key})
      : super(
          animation: LottieAnimation.loading,
        );
}
