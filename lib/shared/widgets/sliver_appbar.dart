import 'package:delivery_app/shared/extensions/context_extensions.dart';
import 'package:delivery_app/shared/extensions/widget_extensions.dart';
import 'package:delivery_app/shared/widgets/scaffold.dart';
import 'package:flutter/material.dart';

import 'button.dart';

class CustomSliverAppbar extends StatefulWidget {
  final List<CustomTabModel> listtab;
  final Widget backgroundAppbar;
  final Widget? title;
  final List<Widget>? actions;
  const CustomSliverAppbar(
      {super.key,
      required this.listtab,
      this.title,
      required this.backgroundAppbar,
      this.actions});

  @override
  State<CustomSliverAppbar> createState() => _CustomSliverAppbarState();
}

class _CustomSliverAppbarState extends State<CustomSliverAppbar>
    with SingleTickerProviderStateMixin {
  late int tabLength;
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    tabLength = widget.listtab.length;
    _tabController = TabController(length: tabLength, vsync: this)
      ..addListener(() {
        if (_tabController.indexIsChanging) {
          int newIndex = _tabController.index;
          _callOnTap(newIndex);
        }
      });
    _callOnTap(0);
  }

  _callOnTap(int index) {
    if (widget.listtab.isNotEmpty) {
      widget.listtab[index].onTap?.call();
    }
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
        padding: EdgeInsets.zero,
        body: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                    actions: widget.actions,
                    backgroundColor: context.theme.scaffoldBackgroundColor,
                    leading: CustomButton(
                      width: 50,
                      buttonType: ButtonType.arrowbackbutton,
                      onPressed: () => context.pop(),
                    ).marginOnly(left: 10),
                    title: widget.title,
                    pinned: true,
                    floating: false,
                    expandedHeight: 250.0,
                    flexibleSpace: FlexibleSpaceBar(
                        background: widget.backgroundAppbar,
                        stretchModes: const [StretchMode.zoomBackground])),
                SliverPersistentHeader(
                    pinned: true,
                    delegate: _SliverAppBarDelegate(TabBar(
                        overlayColor:
                            const WidgetStatePropertyAll(Colors.transparent),
                        controller: _tabController,
                        labelStyle: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                        tabs: _tab(),
                        splashFactory: NoSplash.splashFactory,
                        indicatorColor: context.theme.primaryColor,
                        labelColor: context.textTheme.titleLarge?.color,
                        unselectedLabelColor:
                            context.themeColors.unselectedLabel,
                        dividerColor: context.themeColors.appContainerShadow)))
              ];
            },
            body: TabBarView(
                physics: const NeverScrollableScrollPhysics(),
                controller: _tabController,
                children: _tabChild())));
  }

  List<Widget> _tab() {
    return List.generate(
        tabLength, (index) => Tab(text: widget.listtab[index].title));
  }

  List<Widget> _tabChild() {
    return List.generate(tabLength, (index) => widget.listtab[index].child);
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar tabBar;

  _SliverAppBarDelegate(this.tabBar);

  @override
  double get minExtent => tabBar.preferredSize.height;
  @override
  double get maxExtent => tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
        color: context.theme.scaffoldBackgroundColor, child: tabBar);
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}

class CustomTabModel {
  final String title;
  final Widget child;
  final void Function()? onTap;

  CustomTabModel({
    required this.title,
    required this.child,
    this.onTap,
  });
}
