import 'package:delivery_app/features/big_promo/bloc/big_promo_bloc.dart';
import 'package:delivery_app/features/big_promo/bloc/big_promo_event.dart';
import 'package:delivery_app/features/big_promo/domain/usecases/get_big_promo.dart';
import 'package:delivery_app/features/big_promo/presentation/big_promo.dart';
import 'package:delivery_app/features/category/presentation/category.dart';
import 'package:delivery_app/features/home/widgets/appbar.dart';
import 'package:delivery_app/features/popular_now/bloc/popular_now_bloc.dart';
import 'package:delivery_app/features/popular_now/bloc/popular_now_event.dart';
import 'package:delivery_app/features/popular_now/domain/usecases/get_popular_now/get_popular_now.dart';
import 'package:delivery_app/features/popular_now/presentation/popular.dart';
import 'package:delivery_app/features/recommended/bloc/recommended_bloc.dart';
import 'package:delivery_app/features/recommended/bloc/recommended_event.dart';
import 'package:delivery_app/features/recommended/domain/usecases/get_recommended/get_recommended.dart';
import 'package:delivery_app/features/recommended/presentation/recommended.dart';
import 'package:delivery_app/injector.dart';
import 'package:delivery_app/shared/misc/route_names.dart';
import 'package:delivery_app/shared/extensions/context_extensions.dart';
import 'package:delivery_app/shared/extensions/widget_extensions.dart';
import 'package:delivery_app/shared/widgets/scaffold.dart';
import 'package:delivery_app/shared/widgets/search_textfield.dart';
import 'package:delivery_app/shared/misc/spacer.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late PopularNowBloc popularNowBloc;
  late final ScrollController scrollController;
  late RecommendedBloc recommendedBloc;
  late BigPromoBloc bigPromoBloc;
  final double heightCategory = 120;
  final double heightHorizontal = 235;
  final double heigthBigPromo = 220;
  @override
  void initState() {
    scrollController = ScrollController();
    popularNowBloc = PopularNowBloc(getPopularNow: inject.get<GetPopularNow>())
      ..add(FetchPopularNow());
    recommendedBloc =
        RecommendedBloc(getRecommended: inject.get<GetRecommended>())
          ..add(FetchRecommended());
    bigPromoBloc = BigPromoBloc(getBigPromo: inject.get<GetBigPromo>())
      ..add(FetchBigPromo());
    super.initState();
  }

  @override
  void dispose() {
    popularNowBloc.close();
    recommendedBloc.close();
    bigPromoBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      margin: const EdgeInsets.only(top: 5),
      appbar: customAppBar(context),
      padding: EdgeInsets.zero,
      body: NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (OverscrollIndicatorNotification notification) {
          notification.disallowIndicator();
          return true;
        },
        child: Scrollbar(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 15),
                GestureDetector(
                        onTap: () => context.pushNamed(RouteNames.searchpage),
                        child: const SearchTextField(enabled: false))
                    .paddingSymmetric(
                        horizontal: SpacerHelper.horizontalPaddingnumber),
                const SizedBox(height: 20),
                SizedBox(
                    height: heightCategory,
                    width: double.infinity,
                    child: const Category()),
                const SizedBox(height: 15),
                GestureDetector(
                  onTap: () {
                    context.showBottomSheet(child: [
                      for (int i = 0; i < 100; i++)
                        Text("dsdsd").spaceV(before: false, after: true)
                    ]);
                  },
                  child: const Text('Popular Now',
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold))
                      .paddingOnly(left: SpacerHelper.horizontalPaddingnumber),
                ),
                const SizedBox(height: 15),
                SizedBox(
                  height: heightHorizontal,
                  width: double.infinity,
                  child: PopularNow(popularNowBloc: popularNowBloc),
                ),
                const SizedBox(height: 10),
                const Text('Recommended',
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold))
                    .paddingOnly(left: SpacerHelper.horizontalPaddingnumber),
                const SizedBox(height: 15),
                SizedBox(
                    height: heightHorizontal,
                    width: double.infinity,
                    child: Recommended(recommendedBloc: recommendedBloc)),
                const SizedBox(height: 10),
                const Text('Big Promo',
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold))
                    .paddingOnly(left: SpacerHelper.horizontalPaddingnumber),
                const SizedBox(height: 15),
                SizedBox(
                    height: heigthBigPromo,
                    width: double.infinity,
                    child: BigPromo(bigPromoBloc: bigPromoBloc)),
                const SizedBox(height: 15),
                const Text('Trending on',
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold))
                    .paddingOnly(left: SpacerHelper.horizontalPaddingnumber),
                const SizedBox(height: 15),
              ],
            ).marginOnly(top: 10),
          ),
        ),
      ),
    );
  }
}
