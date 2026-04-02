import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketa/core/utills/app_strings.dart';
import 'package:marketa/core/widgets/app_bar_leading.dart';
import 'package:marketa/core/widgets/custom_app_bar_text.dart';
import 'package:marketa/feature/product/presentation/cubit/product_cubit.dart';
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
        body: BlocBuilder<ProductCubit, ProductState>(
          builder: (context, state) {
            final productCubit = context.read<ProductCubit>();
            return CustomScrollView(
              slivers: [
                SliverAppBar(
                  centerTitle: true,
                  title: CustomAppBarText(text: AppStrings.searchAppBarName),
                  leading: AppBarLeading(),
                ),
                const SliverToBoxAdapter(child: SizedBox(height: 20.0)),
                const SliverToBoxAdapter(child: SearchTextField()),
                const SliverToBoxAdapter(child: SizedBox(height: 20.0)),
                SliverGrid(
                  delegate: SliverChildBuilderDelegate(
                    childCount: productCubit.localProds.length,

                    (context, index) {
                      return SearchGridViewWidget(
                        productId: productCubit.localProds[index].productId,
                      );
                    },
                  ),

                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 5,
                    crossAxisSpacing: 5,
                    mainAxisExtent: 320,
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
