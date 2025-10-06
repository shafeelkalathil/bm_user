import 'package:bm_user/core/common_variables.dart';
import 'package:bm_user/features/cart/view/cart_history.dart';
import 'package:bm_user/features/cart/view/view_cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';
import '../../../core/constants/app_string_constants.dart';
import '../../../core/constants/asset_constants.dart';
import '../../../core/constants/color_constants.dart';
import '../../../core/utils/styles/text_style.dart';
import '../../brand_of_the_day/view/brand_of_the_day.dart';
import '../../cart/view/cart.dart';
import '../../categories/views/categories.dart';
import '../../home/views/home.dart';
import '../../offers/views/offers_screen.dart';

class BottomNavBar extends ConsumerStatefulWidget {
  const BottomNavBar({super.key});

  @override
  ConsumerState<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends ConsumerState<BottomNavBar> {
  int _selectedIndex = 0;

  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onItemTapped(int index) {
    if (index == _selectedIndex) return;
    setState(() {
      _selectedIndex = index;
    });
    _pageController.jumpToPage(index);
  }

  Future<void> _showExitDialog(BuildContext context) async {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: Row(
          children: [
            Icon(Icons.warning_amber_rounded, color: Colors.orange),
            const SizedBox(width: 10),
            const Text('Confirm Exit'),
          ],
        ),
        content: const Text(
          'Are you sure you want to exit the app?\nAny unsaved changes will be lost.',
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(
              'Stay',
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
              SystemNavigator.pop();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            ),
            child: const Text('Exit App'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false, // Prevent automatic pop
      onPopInvokedWithResult: (didPop, result) {
        if (!didPop) {
          _showExitDialog(context);
        }
      },
      child: Scaffold(
        extendBody: true,

        /// Bottom Navigation Bar using the StylishBottomBar package.
        bottomNavigationBar: StylishBottomBar(
          option: AnimatedBarOptions(),
          fabLocation: StylishBarFabLocation.center,
          currentIndex: _selectedIndex,
          notchStyle: NotchStyle.square,
          onTap: _onItemTapped,
          items: [
            _buildBottomBarItem(iconPath: AssetConstants.home, label: AppStringConstants.home),
            _buildBottomBarItem(
              iconPath: AssetConstants.categories,
              label: AppStringConstants.categories,
            ),
            _buildBottomBarItem(
              iconPath: AssetConstants.offers,
              label: AppStringConstants.offers,
            ),
            _buildBottomBarItem(
              iconPath: AssetConstants.shoppingCart,
              label: AppStringConstants.cart,
            ),
          ],
        ),

        /// Center Floating Action Button (FAB).
        floatingActionButton: FloatingActionButton(
          shape: const CircleBorder(),
          backgroundColor: primary.shade500,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const BrandOfTheDayScreen()),
            );
          },
          child: CircleAvatar(
            backgroundColor: primary.shade500,
            child: Center(
              child: Text(
                'Better\nMend',
                textAlign: TextAlign.center,
                style: textBoldContent12.copyWith(color: primary.shade100),
              ),
            ),
          ),
        ),

        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

        /// Main content using PageView to switch between tabs.
        body: SafeArea(
          child: PageView(
            controller: _pageController,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              const HomeScreen(),
              const CategoryScreen(),
              const OfferScreen(),
              ref.watch(cartProducts).isNotEmpty ? ViewCartScreen() : CartHistory(),
            ],
          ),
        ),
      ),
    );
  }

  /// Helper to create a BottomBarItem with consistent styling.
  BottomBarItem _buildBottomBarItem({required String iconPath, required String label}) {
    return BottomBarItem(
      icon: SvgPicture.asset(iconPath),
      selectedColor: primary.shade500,
      unSelectedColor: primary.shade100,
      title: Text(label, style: textBoldContent12),
    );
  }
}
