import 'package:bm_user/features/home/controller/home_controller.dart';
import 'package:bm_user/features/home/views/home.dart';
import 'package:bm_user/features/nav_bar/views/bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../core/constants/asset_constants.dart';
import '../../auth/views/login_or_signup_screen.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  var isLoggedIn;
  @override
  void initState() {
    super.initState();
    _navigateAfterDelay();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      isLoggedIn = ref.watch(checkUserIsLoggedInProvider.future);
    });
  }

  Future<void> _navigateAfterDelay() async {
    await Future.delayed(const Duration(seconds: 3)).then((value) {
      if (isLoggedIn == false || isLoggedIn == null) {
        print(ref.watch(checkUserIsLoggedInProvider).value);
        print('object');
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const LoginOrSignUpScreen()),
          (route) => false,
        );
      } else {
        return Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const BottomNavBar()),
          (route) => false,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: SvgPicture.asset(AssetConstants.logo)));
  }
}
