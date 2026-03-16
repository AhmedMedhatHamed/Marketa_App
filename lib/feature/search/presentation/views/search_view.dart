import 'package:flutter/material.dart';
import 'package:marketa/core/utills/app_strings.dart';
import 'package:marketa/core/widgets/app_bar_leading.dart';
import 'package:marketa/core/widgets/custom_app_bar_text.dart';
import 'package:marketa/feature/search/presentation/widgets/search_grid_view_widget.dart';
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
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              centerTitle: true,
              title: CustomAppBarText(text: AppStrings.searchAppBarName),
              leading: AppBarLeading(),
            ),
            SliverToBoxAdapter(child: SizedBox(height: 20.0)),
            SliverToBoxAdapter(child: SearchTextField()),
            SliverToBoxAdapter(child: SizedBox(height: 20.0)),
            SliverGrid(
              delegate: SliverChildBuilderDelegate(
                  childCount: 15,
                  (context, index,)
                  {
                    return SearchGridViewWidget();
                  },
              ),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 5,
                crossAxisSpacing: 5,
                mainAxisExtent: 320,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
