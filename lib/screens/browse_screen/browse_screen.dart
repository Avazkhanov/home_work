import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:marketplace/screens/browse_screen/widgets/food_ink.dart';
import 'package:marketplace/screens/browse_screen/widgets/type_food_item.dart';
import 'package:marketplace/screens/browse_screen/widgets/universal_ink.dart';
import 'package:marketplace/utils/colors/app_colors.dart';
import 'package:marketplace/utils/extension/extension.dart';
import 'package:marketplace/utils/images/app_images.dart';
import 'package:marketplace/utils/styles/app_style.dart';

import '../../models/ink_model.dart';

class BrowseScreen extends StatefulWidget {
  const BrowseScreen({super.key});

  @override
  State<BrowseScreen> createState() => _BrowseScreenState();
}

class _BrowseScreenState extends State<BrowseScreen> {
  List<InkModel> inkModels = [
    InkModel(title: 'Take Away'),
    InkModel(title: 'Delivery'),
    InkModel(title: 'Book'),
    InkModel(title: 'Browse'),
  ];
  List<TypeFood> typeFood = [
    TypeFood(title: 'Healthy', backgroundPhoto: AppImages.bitmap),
    TypeFood(title: 'Sushi', backgroundPhoto: AppImages.sushi),
    TypeFood(title: 'Meat', backgroundPhoto: AppImages.meat),
    TypeFood(title: 'Next', backgroundPhoto: AppImages.next),
  ];
  int activeIndex = -1;

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.c_F2F3F8,
      body: Column(
        children: [
          Container(
            height: 100.screenWidth(),
            width: double.infinity,
            decoration: const BoxDecoration(color: AppColors.c_4C95FF),
            child: Stack(
              children: [
                Image.asset(AppImages.background),
                AppBar(
                  systemOverlayStyle: const SystemUiOverlayStyle(
                      statusBarColor: AppColors.transparent,
                      statusBarIconBrightness: Brightness.dark,
                      statusBarBrightness: Brightness.light),
                  backgroundColor: AppColors.transparent,
                  title: Row(
                    children: [
                      SvgPicture.asset(AppImages.locationAppBarIcon),
                      SizedBox(width: 4.screenWidth()),
                      const Text(
                        '1 Pat Tat St, San Po Kong',
                        style: AppStyle.sfProBold,
                      ),
                      SvgPicture.asset(AppImages.arrowDownIcon)
                    ],
                  ),
                  actions: [
                    IconButton(
                        onPressed: () {},
                        icon: SvgPicture.asset(AppImages.qrCodeIcon)),
                    IconButton(
                        onPressed: () {},
                        icon: SvgPicture.asset(AppImages.searchIcon))
                  ],
                ),
              ],
            ),
          ),
          Container(
            height: 46.screenHeight(),
            width: double.infinity,
            decoration: const BoxDecoration(color: AppColors.white),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ...List.generate(
                    inkModels.length,
                    (index) => Material(
                          child: UniversalInk(
                              backgroundColor: activeIndex == index
                                  ? AppColors.c_4C95FF
                                  : AppColors.white,
                              onTap: () {
                                setState(() {
                                  activeIndex = index;
                                });
                              },
                              title: inkModels[index].title,
                              textColor: activeIndex == index
                                  ? AppColors.white
                                  : AppColors.c_333333),
                        ))
              ],
            ),
          ),
          SizedBox(height: 16.screenHeight()),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(width: 16.screenWidth()),
                        ...List.generate(
                          typeFood.length,
                          (index) => TypeFoodItem(
                            backgroundPhoto: typeFood[index].backgroundPhoto,
                            text: typeFood[index].title,
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 16.screenHeight()),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(width: 16.screenWidth()),
                      Text(
                        "Featured",
                        style: AppStyle.sfProBold.copyWith(
                            fontSize: 18.textSize(), color: AppColors.c_333333),
                      ),
                      const Spacer(),
                      GestureDetector(
                        child: Center(
                          child: Row(
                            children: [
                              Text(
                                "View all",
                                style: AppStyle.sfProMedium.copyWith(
                                  color: AppColors.c_999999,
                                  fontSize: 14.textSize(),
                                ),
                              ),
                              SvgPicture.asset(AppImages.arrowRightIcon)
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: 11.screenWidth()),
                    ],
                  ),
                  SizedBox(height: 8.screenHeight()),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    child: Row(
                      children: [
                        SizedBox(width: 16.screenWidth()),
                        const FoodInk(
                          type: 'Recommendations',
                          productName: 'Pancake Resturant',
                          photoPath: AppImages.pancake,
                          grade: '5.0',
                          minutes: '20-30',
                          width: 250,
                          height: 234,
                          typeColor: AppColors.c_A88AEC,
                          photoHeight: 134,
                          photoWidth: 250,
                        ),
                        const FoodInk(
                          type: 'Promo',
                          productName: 'BBQ Bar',
                          photoPath: AppImages.bbq,
                          grade: '4.5',
                          minutes: '20-40',
                          width: 250,
                          height: 234,
                          typeColor: AppColors.c_EE5382,
                          photoHeight: 134,
                          photoWidth: 250,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16.screenHeight()),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(width: 16.screenWidth()),
                      Text(
                        "Featured",
                        style: AppStyle.sfProBold.copyWith(
                            fontSize: 18.textSize(), color: AppColors.c_333333),
                      ),
                      const Spacer(),
                      GestureDetector(
                        child: Center(
                          child: Row(
                            children: [
                              Text(
                                "View all",
                                style: AppStyle.sfProMedium.copyWith(
                                  color: AppColors.c_999999,
                                  fontSize: 14.textSize(),
                                ),
                              ),
                              SvgPicture.asset(AppImages.arrowRightIcon)
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: 11.screenWidth()),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 16.screenWidth()),
                    child: Column(
                      children: [
                        const FoodInk(
                          productName: 'Diamond Restaurant',
                          photoPath: AppImages.diamond,
                          grade: '5.0',
                          minutes: '20-30',
                          width: 343,
                          height: 266,
                          photoHeight: 165,
                          photoWidth: 343,
                        ),
                        SizedBox(height: 16.screenHeight()),
                        const FoodInk(
                          productName: 'Sushi Man',
                          photoPath: AppImages.sushi,
                          grade: '5.0',
                          minutes: '20-30',
                          width: 343,
                          height: 266,
                          photoHeight: 165,
                          photoWidth: 343,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 25.screenHeight()),
                ],
              ),
            ),
          ),
          Ink (
            width: 120.screenWidth(),
            height: 40.screenHeight(),
            decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              color: AppColors.white,
              shadows: [
                BoxShadow(
                    blurRadius: 20,
                    spreadRadius: 0,
                    offset: Offset(0, 4),
                    color: AppColors.black.withOpacity(.5))
              ],
            ),
            child: InkWell(
              borderRadius: BorderRadius.circular(20),
              onTap: () {},
              child: Row(
                children: [
                  SizedBox(width: 35.screenWidth()),
                  Text(
                    "Map ",
                    style: AppStyle.sfProSemiBold.copyWith(
                        color: AppColors.c_333333, fontSize: 12.textSize()),
                  ),
                  Text("|",
                      style: AppStyle.sfProBold
                          .copyWith(color: AppColors.c_999999)),
                  Text(
                    ' Filter',
                    style: AppStyle.sfProSemiBold.copyWith(
                        color: AppColors.c_333333, fontSize: 12.textSize()),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 16.screenHeight()),
          Container(
            width: width,
            height: 76.screenHeight(),
            color: AppColors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(AppImages.locationIcon)),
                IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(AppImages.savedIcon)),
                IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(AppImages.userIcon)),
              ],
            ),
          )
        ],
      ),
    );
  }
}
