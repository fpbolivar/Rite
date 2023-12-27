import 'package:flutter/material.dart';
import 'package:rite_funeral_flutter/Data/Resources/Extensions/extension.dart';

class RoundAppBar extends StatefulWidget implements PreferredSizeWidget {
  const RoundAppBar(
      {this.child,
      this.backgroundColor,
      this.isRounded = true,
      this.height,
      this.padding,
      Key? key})
      : preferredSize = const Size.fromHeight(65),
        super(key: key);
  final Widget? child;
  final double? height;
  final Color? backgroundColor;
  final bool isRounded;
  final EdgeInsetsGeometry? padding;

  @override
  State<RoundAppBar> createState() => _RoundAppBarState();

  @override
  // TODO: implement preferredSize
  final Size preferredSize;
}

class _RoundAppBarState extends State<RoundAppBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      padding: widget.padding ??
          const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
      width: MediaQuery.sizeOf(context).width,
      decoration: BoxDecoration(
        color: widget.backgroundColor ??
            Theme.of(context).appBarTheme.backgroundColor,
        borderRadius: BorderRadius.only(
          topLeft: widget.isRounded ? const Radius.circular(30) : Radius.zero,
          topRight: widget.isRounded ? const Radius.circular(30) : Radius.zero,
        ),
      ),
      child: widget.child ?? 0.x,
    );
  }
}
