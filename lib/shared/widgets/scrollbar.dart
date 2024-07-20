import 'dart:io';
import 'package:delivery_app/shared/extensions/context_extensions.dart';
import 'package:delivery_app/shared/widgets/progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class CustomScrollBar extends StatefulWidget {
  final Widget child;
  final ScrollPhysics physics;
  final int? delayInmilliseconds;
  final ScrollbarType scrollbarType;
  final void Function(RefreshController)? onRefresh;
  final void Function(RefreshController)? onLoading;
  const CustomScrollBar(
      {super.key,
      required this.child,
      this.scrollbarType = ScrollbarType.disable,
      this.physics = const BouncingScrollPhysics(),
      this.onRefresh,
      this.onLoading,
      this.delayInmilliseconds});

  @override
  State<CustomScrollBar> createState() => _CustomScrollBarState();
}

class _CustomScrollBarState extends State<CustomScrollBar> {
  final int delayInmilliseconds = 1500;
  late ScrollController _scrollbarController;
  late RefreshController _refreshController;

  @override
  void initState() {
    _scrollbarController = ScrollController();
    if (widget.scrollbarType != ScrollbarType.disable) {
      _refreshController = RefreshController();
    }
    super.initState();
  }

  void _onRefresh() async {
    widget.onRefresh?.call(_refreshController);
    await Future.delayed(Duration(
        milliseconds: widget.delayInmilliseconds ?? delayInmilliseconds));
  }

  void _onLoading() async {
    await Future.delayed(Duration(
        milliseconds: widget.delayInmilliseconds ?? delayInmilliseconds));
    widget.onLoading?.call(_refreshController);
  }

  @override
  void dispose() {
    _scrollbarController.dispose();
    if (widget.scrollbarType != ScrollbarType.disable) {
      _refreshController.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _widgetFinal();
  }

  Widget _widgetFinal() {
    switch (widget.scrollbarType) {
      case ScrollbarType.disable:
        return Scrollbar(
            controller: _scrollbarController,
            child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                physics: widget.physics,
                controller: _scrollbarController,
                child: widget.child));

      case ScrollbarType.enableBoth:
        return Scrollbar(
            controller: _scrollbarController,
            child: SmartRefresher(
                physics: widget.physics,
                enablePullDown: true,
                enablePullUp: true,
                header: customHeader(),
                footer: customFooter(),
                onLoading: _onLoading,
                onRefresh: _onRefresh,
                controller: _refreshController,
                child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    physics: widget.physics,
                    controller: _scrollbarController,
                    child: widget.child)));

      case ScrollbarType.enablePullUp:
        return Scrollbar(
            controller: _scrollbarController,
            child: SmartRefresher(
                physics: widget.physics,
                enablePullDown: false,
                enablePullUp: true,
                header: customHeader(),
                footer: customFooter(),
                onLoading: _onLoading,
                onRefresh: _onRefresh,
                controller: _refreshController,
                child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    physics: widget.physics,
                    controller: _scrollbarController,
                    child: widget.child)));

      case ScrollbarType.enablePulldown:
        return Scrollbar(
            controller: _scrollbarController,
            child: SmartRefresher(
                physics: widget.physics,
                footer: customFooter(),
                enablePullDown: true,
                enablePullUp: false,
                header: customHeader(),
                onLoading: _onLoading,
                onRefresh: _onRefresh,
                controller: _refreshController,
                child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    physics: widget.physics,
                    controller: _scrollbarController,
                    child: widget.child)));
    }
  }

  Widget _partWidgetHeader({required Widget top, required Widget bottom}) {
    return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [top, const SizedBox(width: 10), bottom]);
  }

  Widget customHeader() {
    const textStyle = TextStyle(fontWeight: FontWeight.w300);
    return CustomHeader(builder: (BuildContext context, RefreshStatus? mode) {
      Color? color = context.theme.iconTheme.color?.withOpacity(0.7);
      Widget body;
      switch (mode) {
        case RefreshStatus.idle:
          body = _partWidgetHeader(
              top: Icon(Icons.arrow_downward, color: color),
              bottom: const Text("Pull down to Refresh", style: textStyle));
          break;
        case RefreshStatus.refreshing:
          if (Platform.isAndroid) {
            body = progressIndicatorWidget(context: context);
          } else {
            body = _partWidgetHeader(
                top: progressIndicatorWidget(context: context),
                bottom: const Text("Refreshing...", style: textStyle));
          }
          break;
        case RefreshStatus.failed:
          body = const Text("Load Failed! Click retry!", style: textStyle);
          break;
        case RefreshStatus.canRefresh:
          body = _partWidgetHeader(
              top: Icon(Icons.refresh, color: color),
              bottom: const Text("Release to Refresh", style: textStyle));
          break;
        case RefreshStatus.completed:
          body = _partWidgetHeader(
              top: Icon(Icons.check, color: color),
              bottom: const Text("Refresh completed", style: textStyle));
          break;
        default:
          body = const SizedBox.shrink();
          break;
      }
      return Center(
          child: Container(
              alignment: Alignment.topCenter, height: 40, child: body));
    });
  }

  Widget customFooter() {
    const textStyle = TextStyle(fontWeight: FontWeight.w300);
    return CustomFooter(builder: (BuildContext context, LoadStatus? mode) {
      Color? color = context.theme.iconTheme.color?.withOpacity(0.7);
      Widget body;
      switch (mode) {
        case LoadStatus.idle:
          body = _partWidgetHeader(
              top: Icon(Icons.arrow_downward, color: color),
              bottom: const Text("Pull to Load more", style: textStyle));
          break;
        case LoadStatus.loading:
          if (Platform.isAndroid) {
            body = progressIndicatorWidget(context: context);
          } else {
            body = _partWidgetHeader(
                top: progressIndicatorWidget(context: context),
                bottom: const Text("Loading...", style: textStyle));
          }
          break;
        case LoadStatus.failed:
          body = const Text("Load Failed! Click retry!", style: textStyle);
          break;
        case LoadStatus.canLoading:
          body = const Text("Release to Load more", style: textStyle);
          break;
        case LoadStatus.noMore:
          body = const Text("No more data", style: textStyle);
          break;
        default:
          body = const SizedBox.shrink();
          break;
      }
      return Center(
          child: Container(
              alignment: Alignment.topCenter, height: 40, child: body));
    });
  }
}

enum ScrollbarType { enablePullUp, enablePulldown, enableBoth, disable }
