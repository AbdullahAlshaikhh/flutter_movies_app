import 'package:flutter/material.dart';
import 'package:flutter_movie_app/view/screens/search_screen.dart';
import 'package:get/get.dart';

import '../../constants/app_colors.dart';
import '../../controller/search_controller.dart';

class SearchWidget extends StatefulWidget {
  const SearchWidget({super.key});

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(
                color: AppColors.paragraphColor.withOpacity(.2)),
            borderRadius: BorderRadius.circular(8)),
        child: TextFormField(
          controller: textController,
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.search,
          onTap: (){
            Get.to(const SearchScreen());
          },
          onChanged: (value){
            Get.lazyPut(() => MySearchController());
            if(value.isNotEmpty){
              Get.find<MySearchController>().startSearch(value);
            }
            setState(() {

            });
          },
          onFieldSubmitted: (value){
            Get.lazyPut(() => MySearchController());
            if(value.isNotEmpty){
              Get.find<MySearchController>().startSearch(value);
            }
            setState(() {

            });
          },
          decoration: InputDecoration(
              fillColor: AppColors.darkContainerColor,
              hintText: "Search TV and Movies..",
              hintStyle: const TextStyle(
                  height: 1.3),
              filled: true,
              border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(8)),
              focusedBorder: OutlineInputBorder(
                  borderSide:
                  const BorderSide(color: AppColors.mainColor),
                  borderRadius: BorderRadius.circular(8)),
              prefixIcon: const Icon(
                Icons.search,
                size: 25,
              ),
              suffixIcon: textController.text.isNotEmpty
                  ? InkWell(
                onTap: () {
                  setState(() {
                    textController.clear();
                  });
                  FocusManager.instance.primaryFocus?.unfocus();
                },
                child: const Icon(
                  Icons.cancel,
                  size: 25,
                ),
              )
                  : Container(),
              contentPadding: const EdgeInsets.all(16),
              isCollapsed: true,
              floatingLabelBehavior: FloatingLabelBehavior.never),
        ),
      ),
    );
  }
}
