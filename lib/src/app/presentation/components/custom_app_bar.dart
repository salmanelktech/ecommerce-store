
import 'package:eshop/src/app/presentation/theme/color_theme.dart';
import 'package:eshop/src/app/presentation/utils/consts.dart';
import 'package:flutter/material.dart';

PreferredSize customAppBar(BuildContext context,
    { String? title, Widget? customWidget}) {
  return 
  PreferredSize(
        preferredSize: const Size(double.infinity, 80),
        child: AppBar(
          backgroundColor: kWhiteColor,
          // elevation: 1,
          automaticallyImplyLeading: false,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(0),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: kPadding * 2, horizontal: kPadding * 2),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      padding: const EdgeInsets.all(kPadding),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(kRadius),
                          color: kPrimaryColor),
                      child: const Icon(
                        Icons.arrow_back_ios_new,
                        color: kWhiteColor,
                        size: 25,
                      ),
                    ),
                  ),
                  const SizedBox(width: kPadding * 2),
                   Text(
                  title?? "",
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  customWidget??const SizedBox()
                  
                ],
              ),
            ),
          ),
        ),
      );
    

}
