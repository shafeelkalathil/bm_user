import 'package:flutter/material.dart';
import '../../../core/constants/color_constants.dart';
import '../../../core/utils/styles/text_style.dart';
import '../../delivery_service/view/delivery_service_food_category.dart';
import '../../delivery_service/view/delivery_service_sub_categories.dart';

class CategoryItem extends StatelessWidget {
  final String title;
  final String imageUrl;
  const CategoryItem({super.key, required this.title,required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if(title == 'Food') {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const DeliveryServiceFoodCategoryScreen(),));

        }else{
          Navigator.push(context, MaterialPageRoute(builder: (context) => DeliveryServiceSubCategories(categoryName: title,),));
        }
      },
      child: Column(
        children: [
          // Replace this Container with Image.asset/icon/image.network as needed
          Container(
            height: 90,
            width: 80,
            decoration: BoxDecoration(
              color: Colors.orange.shade50,
              borderRadius: BorderRadius.circular(12),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                imageUrl,
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
                errorBuilder: (context, error, stackTrace) {
                  return const Center(
                    child: Icon(Icons.error, size: 20, color: Colors.red),
                  );
                },
              ),
            ),
          ),
          const SizedBox(height: 6),
          Text(
            title,
            textAlign: TextAlign.center,
            style: textSemiContent12.copyWith(color: primary.shade200),
            maxLines: 2,
          ),
        ],
      ),
    );
  }
}