import 'package:categorylogin/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RecipeAppBarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  const RecipeAppBarWidget({
    super.key, required this.title, this.bottom, required this.toolbarHeight,
  });

  final String title;
  final double toolbarHeight;
  final PreferredSizeWidget? bottom;

  @override
  Size get preferredSize {
    final double? bottomHeight = bottom?.preferredSize.height;
    final height = bottomHeight == null ? toolbarHeight : bottomHeight + toolbarHeight;
    return Size(double.infinity, 72);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: AppBar(
        backgroundColor: AppColors.bacround,
        toolbarHeight: toolbarHeight,
        leading: Center(
          child: SvgPicture.asset(
            "asset/back.svg",
            width: 20,
            height: 20,
          ),
        ),
        title: Center(
          child: Text(
            title,
            style: TextStyle(
              color: AppColors.redpinkmain,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Container(
                  width: 28,
                  height: 28,
                  decoration: BoxDecoration(
                    color: AppColors.redpink,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Center(
                    child: SvgPicture.asset(
                      "asset/notifaction.svg",
                      width: 22,
                      height: 22,
                    ),
                  ),
                ),
                SizedBox(width: 5),
                Container(
                  width: 28,
                  height: 28,
                  decoration: BoxDecoration(
                    color: AppColors.redpink,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Center(
                    child: SvgPicture.asset(
                      "asset/search.svg",
                      width: 22,
                      height: 22,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
        bottom: bottom,
      ),
    );
  }
}
