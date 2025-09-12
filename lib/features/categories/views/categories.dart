
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../core/constants/app_string_constants.dart';
import '../../../core/constants/asset_constants.dart';
import '../../shared/views/coming_soon_screen.dart';
import '../../shared/widgets/category_grid.dart';
import '../../shared/widgets/category_icon_with_title.dart';
import '../../shared/widgets/custom_app_bar.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  final TextEditingController _searchController = TextEditingController();

  final bool _isSearching = false;
  int selectedIndex = 0;

  final categoryIcons = [
    AssetConstants.delivery,
    AssetConstants.transportation,
    AssetConstants.workers,
    AssetConstants.eService
  ];
  final categoryText = [
    AppStringConstants.delivery,
    AppStringConstants.transportation,
    AppStringConstants.workers,
    AppStringConstants.eService
  ];

  final categories = [
    'Daily need',
    'Food',
    'Bakery & drinks',
    'Beauty & personal care',
    'Stationary & games',
    'Dry fruits & nuts',
    'Household & repellents',
    'Medicine',
    'Sports room',
    'Electronics',
    'Hardware',
    'Auto mobiles',
    'Fashion',
    'Courier',
    'Fertilizers & plants',
    'Pets',
  ];
  final categoryImages = [
    AssetConstants.dailyNeed,
    AssetConstants.food,
    AssetConstants.bakeryAndDrink,
    AssetConstants.beauty_and_personal_care,
    AssetConstants.stationaryAndGames,
    AssetConstants.dry_fruts,
    AssetConstants.households,
    AssetConstants.medicine,
    AssetConstants.sports_room,
    AssetConstants.electronics,
    AssetConstants.hardware,
    AssetConstants.auto_mobiles,
    AssetConstants.fashion,
    AssetConstants.courier,
    AssetConstants.fertilizer,
    AssetConstants.pets
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: AppStringConstants.categories,
        trailing: Padding(
          padding: const EdgeInsets.all(10),
          child: SvgPicture.asset(AssetConstants.search),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: Column(
          spacing: 20,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(categoryText.length, (index) {
                final isSelected = selectedIndex == index;
                return CategoryIconWithTitle(
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                      if(selectedIndex != 0){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => ComingSoonScreen(title: categoryText[index]),));
                      }
                    });
                  },
                  icon: categoryIcons[index],
                  label: categoryText[index],
                  isSelected: isSelected,
                );
              }),
            ),

            Expanded(
              child: selectedIndex == 0 ? CategoryGrid(categories: categories,categoryImages: categoryImages,) : const SizedBox(),
            ),
          ],
        ),
      ),
    );
  }
}
