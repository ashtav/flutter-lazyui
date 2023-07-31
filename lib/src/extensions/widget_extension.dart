part of extensions;

extension WidgetExtension on Widget {
  /// ``` dart
  /// YourWidget().margin() // Only works on widget with no margin property
  /// ```
  Widget margin({double? t, double? b, double? l, double? r, double? v, double? h, double others = 0, double? all}) =>
      Container(
        margin: all != null
            ? EdgeInsets.all(all)
            : EdgeInsets.only(
                bottom: v ?? b ?? others, top: v ?? t ?? others, left: h ?? l ?? others, right: h ?? r ?? others),
        child: this,
      );

  /// ``` dart
  /// YourWidget().padding() // Only works on widget with no padding property
  /// ```
  Widget padding({double? t, double? b, double? l, double? r, double? v, double? h, double others = 0, double? all}) =>
      Padding(
        padding: all != null
            ? EdgeInsets.all(all)
            : EdgeInsets.only(
                bottom: v ?? b ?? others, top: v ?? t ?? others, left: h ?? l ?? others, right: h ?? r ?? others),
        child: this,
      );

  /// ``` dart
  /// YourWidget().clip() // Only works on widget with no clip property
  /// ```
  Widget clip({double? tl, double? tr, double? bl, double? br, double? tlr, double? blr, double? all}) => ClipRRect(
        borderRadius: all != null
            ? BorderRadius.all(Radius.circular(all))
            : BorderRadius.only(
                topLeft: Radius.circular(tl ?? tlr ?? 0),
                topRight: Radius.circular(tr ?? tlr ?? 0),
                bottomLeft: Radius.circular(bl ?? blr ?? 0),
                bottomRight: Radius.circular(br ?? blr ?? 0)),
        child: this,
      );

  /// ``` dart
  /// YourWidget().flexible()
  /// ```
  Flexible flexible({int flex = 1, FlexFit fit = FlexFit.loose}) => Flexible(flex: flex, fit: fit, child: this);

  /// ``` dart
  /// YourWidget().onTap(() {})
  /// ```
  Touch onTap(Function() onTap) => Touch(onTap: onTap, child: this);

  /// ``` dart
  /// YourWidget().border(Br.all(), width: 1, color: Colors.black)
  /// ```
  Widget border(BoxBorder border, {BorderRadiusGeometry? radius, Color? color}) => Container(
        decoration: BoxDecoration(borderRadius: radius, color: color, border: border),
        child: this,
      );

  /// ``` dart
  /// YourWidget().ignore()
  /// ```
  IgnorePointer ignore([bool ignoring = true]) => IgnorePointer(ignoring: ignoring, child: this);

  /// ``` dart
  /// YourWidget().hide()
  /// ```
  Visibility hide([bool value = true]) => Visibility(visible: !value, child: this);

  /// ``` dart
  /// YourWidget().opacity(.5)
  /// ```

  Widget opacity(double value, {bool animated = false, Duration? duration}) {
    return animated ? AnimatedOpacity(opacity: value, duration: duration ?? 250.ms) : Opacity(opacity: value);
  }

  /// ``` dart
  /// YourWidget().lzBlur()
  /// ```
  Widget lzBlur(BuildContext context, {double sigmaX = 5, double sigmaY = 5, Duration? duration, bool show = true}) {
    return Stack(
      children: [
        this,
        AnimatedOpacity(
          duration: duration ?? 300.ms,
          opacity: show ? 1 : 0,
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: sigmaX, sigmaY: sigmaY),
            child: SizedBox(
              width: context.width,
              height: context.height,
            ),
          ),
        ),
      ],
    );
  }

  Widget lzBlink(bool shouldBlink, [Duration? duration]) {
    if (shouldBlink) {
      return _BlinkingWidget(
        duration: duration ?? 300.s,
        child: this,
      );
    } else {
      return this;
    }
  }

  Widget lzStyle(
      {BoxBorder? border,
      EdgeInsetsGeometry? padding,
      EdgeInsetsGeometry? margin,
      Color? color,
      BorderRadiusGeometry? radius}) {
    return Container(
      decoration: BoxDecoration(color: color, border: border, borderRadius: radius),
      padding: padding,
      margin: margin,
      child: ClipRRect(
        borderRadius: radius ?? BorderRadius.zero,
        child: this,
      ),
    );
  }
}

extension CustomAppbarExtension on AppBar {
  AppBar backIcon(IconData icon) {
    return AppBar(
        leading: CustomBackButton(icon: icon),
        title: title,
        actions: actions,
        automaticallyImplyLeading: automaticallyImplyLeading,
        backgroundColor: backgroundColor,
        centerTitle: centerTitle,
        elevation: elevation,
        flexibleSpace: flexibleSpace,
        iconTheme: iconTheme,
        leadingWidth: leadingWidth,
        primary: primary,
        shadowColor: shadowColor,
        shape: shape,
        systemOverlayStyle: systemOverlayStyle,
        titleSpacing: titleSpacing,
        toolbarHeight: toolbarHeight,
        toolbarOpacity: toolbarOpacity,
        toolbarTextStyle: toolbarTextStyle,
        titleTextStyle: titleTextStyle,
        bottomOpacity: bottomOpacity,
        surfaceTintColor: surfaceTintColor,
        actionsIconTheme: actionsIconTheme,
        bottom: bottom,
        foregroundColor: foregroundColor,
        excludeHeaderSemantics: excludeHeaderSemantics,
        key: key,
        notificationPredicate: notificationPredicate,
        scrolledUnderElevation: scrolledUnderElevation);
  }
}

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({super.key, this.icon});
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    assert(debugCheckHasMaterialLocalizations(context));
    return IconButton(
      icon: const BackButtonIcon(),
      tooltip: MaterialLocalizations.of(context).backButtonTooltip,
      onPressed: () {
        Navigator.maybePop(context);
      },
    );
  }
}

class _BlinkingWidget extends StatefulWidget {
  final Widget child;
  final Duration duration;

  const _BlinkingWidget({required this.child, required this.duration});

  @override
  _BlinkingWidgetState createState() => _BlinkingWidgetState();
}

class _BlinkingWidgetState extends State<_BlinkingWidget> {
  bool _visible = true;
  Timer? timer;

  @override
  void initState() {
    super.initState();

    if (mounted) {
      timer = Timer.periodic(widget.duration, (timer) {
        setState(() {
          _visible = !_visible;
        });
      });
    }
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: _visible ? 1.0 : 0.0,
      duration: widget.duration,
      child: widget.child,
    );
  }
}

/* --------------------------------------------------------------------------
| Custom Icons Extension
| */

extension CustomIconsExtension on Icon {
  IconButton onPressed(Function() onPressed, {String? tooltip}) =>
      IconButton(icon: this, tooltip: tooltip, onPressed: onPressed);
}
