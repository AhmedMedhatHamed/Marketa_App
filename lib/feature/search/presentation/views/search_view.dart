import 'package:flutter/material.dart';
import 'package:marketa/core/utills/app_strings.dart';
import 'package:marketa/core/widgets/app_bar_leading.dart';
import 'package:marketa/core/widgets/custom_app_bar_text.dart';
import 'package:marketa/feature/search/presentation/widgets/search_text_field.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          leading: AppBarLeading(),
          title: CustomAppBarText(text: AppStrings.searchAppBarName),
        ),
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: SizedBox(
                height: 20.0,
              ),
            ),
            SliverToBoxAdapter(
              child: SearchTextField(),
            ),
          ],
        ),
      ),
    );
  }
}


