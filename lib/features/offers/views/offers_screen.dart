
import 'package:bm_user/core/utils/extensions/size_extension.dart';
import 'package:bm_user/features/offers/model/offer_sample_model.dart';
import 'package:bm_user/features/offers/views/widgets/offer_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../core/constants/asset_constants.dart';
import '../../../core/constants/color_constants.dart';
import '../../../core/utils/styles/text_style.dart';


class OfferScreen extends StatelessWidget {
  const OfferScreen({super.key});


  static final List<OfferSampleModel> offers = [
    OfferSampleModel(
      brand: 'NIKE',
      discount: '25%',
      expiryDate: '31 March 2024',
      promoCode: 'NIKE25',
      brandColor: Colors.black,
      description: 'Get 25% off on your next NIKE purchase',
      benefits: [
        'Redeemable at all NIKE stores worldwide',
        'Stackable with other discounts',
        'No cash value'
      ],
    ),
    OfferSampleModel(
      brand: 'ADIDAS',
      discount: '30%',
      expiryDate: '15 April 2024',
      promoCode: 'ADIDAS30',
      brandColor: Colors.blue.shade900,
      description: 'Get 30% off on your next ADIDAS purchase',
      benefits: [
        'Valid on all ADIDAS products',
        'Cannot be combined with other offers',
        'Limited time offer'
      ],
    ),
    // Add more offers as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          _buildSliverAppBar(context),
          _buildOffersList(),
          const SliverPadding(
            padding: EdgeInsets.only(bottom: 80),
            sliver: SliverToBoxAdapter(child: SizedBox.shrink()),
          ),
        ],
      ),
    );
  }

  Widget _buildSliverAppBar(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return SliverAppBar(
      automaticallyImplyLeading: false,
      floating: false,
      snap: false,
      expandedHeight: _getExpandedHeight(screenHeight),
      backgroundColor: Colors.white,
      elevation: 0,
      stretch: true,
      flexibleSpace: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return FlexibleSpaceBar(
            background: Stack(
              fit: StackFit.expand,
              children: [
                Hero(
                  tag: 'offer_hero_image',
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(25),
                      bottomRight: Radius.circular(25),
                    ),
                    child: Image.asset(
                      AssetConstants.sale50,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                _buildAppBarContent(context),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildAppBarContent(BuildContext context) {
    return Positioned(
      left: 15,
      top: context.screenHeight * 0.03,
      child: Row(
        children: [
          Text(
            'Offers',
            style: textExtraBold3XContent24.copyWith(
              color: primary.shade300,
              fontSize: 25,
            ),
          ),
          SizedBox(width: context.screenWidth * 0.6),
          Padding(
            padding: const EdgeInsets.all(10),
            child: InkWell(
              onTap: () => _onSearchTap(),
              child: SvgPicture.asset(AssetConstants.searchWhite),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOffersList() {
    return SliverPadding(
      padding: EdgeInsets.symmetric(
        horizontal: _getHorizontalPadding(),
        vertical: 16,
      ),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate(
              (context, index) {
            return AnimatedContainer(
              duration: Duration(milliseconds: 300 + (index * 100)),
              curve: Curves.easeOutCubic,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: OfferCard(
                  offer: offers[index % offers.length],
                  index: index,
                ),
              ),
            );
          },
          childCount: 8,
        ),
      ),
    );
  }

  double _getExpandedHeight(double screenHeight) {
    if (screenHeight < 600) return screenHeight * 0.35;
    if (screenHeight < 800) return screenHeight * 0.4;
    return screenHeight * 0.45;
  }

  double _getHorizontalPadding() {
    return 16;
  }

  void _onSearchTap() {}
}
