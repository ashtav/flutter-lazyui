part of '../widget.dart';

class TransAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? leading;
  final Widget? title;
  final List<Widget>? actions;
  final bool? centerTitle;

  const TransAppBar({
    super.key,
    this.leading,
    this.title,
    this.actions,
    this.centerTitle,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: leading,
      title: title,
      actions: actions,
      elevation: 0,
      shadowColor: Colors.transparent,
      foregroundColor: Colors.transparent,
      backgroundColor: Colors.transparent,
      centerTitle: centerTitle,
      shape: Border(bottom: BorderSide(color: Colors.transparent, width: 0)),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
