part of widget;

/// `AppTrainerController` is a controller class used to manage the display
/// or behavior of certain elements within an application.
///
/// This controller provides functionalities through its `show` method.
class AppTrainerController {
  void Function({List<GlobalKey> keys, bool orderByKey}) show =
      ({keys = const [], orderByKey = false}) {};
}

/// `AppTrainer` is a Flutter widget that helps guide users through your app by highlighting specific UI elements and providing step-by-step instructions.
///
/// Example usage:
/// ```dart
/// AppTrainer(
///   child: MyApp(),
///   targets: [
///     Target(
///       key: 'buttonKey',
///       targetRect: Rect.fromCircle(center: Offset(100, 100), radius: 20),
///       title: 'Welcome to My App!',
///       description: 'Tap this button to get started.',
///     ),
///     // Add more targets here
///   ],
///   onInit: (controller) {
///     // Initialize the controller and start the tutorial.
///     controller.start();
///   },
///   onFinish: () {
///     // Handle when the user completes the tutorial.
///   },
/// )
/// ```

class AppTrainer extends StatefulWidget {
  /// The child widget over which the training overlay will appear.
  final Widget child;

  /// A list of `Target` objects that represent the UI elements or widgets
  /// that the training will focus on.
  final List<Target> targets;

  /// A callback function that is executed during the initialization of the
  /// `AppTrainer`. It provides an `AppTrainerController` which can be used
  /// to control the behavior of the trainer.
  final Function(AppTrainerController)? onInit;

  /// A controller for the `AppTrainer` which can be used to programmatically
  /// control the training flow.
  final AppTrainerController? controller;

  /// A callback function that is triggered when a target is clicked or tapped.
  /// It receives the clicked target as a parameter.
  final Function(dynamic target)? onClickTarget;

  /// Callbacks that are triggered when the training is finished, skipped, or
  /// either finished or skipped, respectively.
  final Function()? onFinish, onSkip, onFinishOrSkip;

  /// Labels for the 'Next', 'Finish', and 'Skip' actions in the training
  /// overlay. They can be customized to fit the application's language or
  /// style.
  final String? nextLabel, finishLabel, skipLabel;

  /// A boolean that determines whether the training starts automatically
  /// upon initialization (`true`) or needs to be started manually (`false`).
  final bool showOnInit;

  /// A boolean to control the visibility of section labels in the training
  /// overlay.
  final bool showSectionLabel;

  /// The color of the shadow around the highlighted target.
  final Color shadowColor;

  /// The opacity of the shadow around the highlighted target. This is a
  /// double value between 0.0 (completely transparent) and 1.0 (fully opaque).
  final double shadowOpacity;

  /// A custom builder function that allows for custom widgets to be used
  /// as targets in the training overlay. It takes a `Target` object and returns
  /// a Widget.
  final Widget Function(Target target)? targetBuilder;

  /// The BuildContext in which the `AppTrainer` is being used. This might
  /// be required for certain operations within the training flow.
  final BuildContext? context;

  const AppTrainer(
      {super.key,
      required this.child,
      this.targets = const [],
      this.onInit,
      this.controller,
      this.onClickTarget,
      this.onFinish,
      this.onSkip,
      this.onFinishOrSkip,
      this.nextLabel,
      this.finishLabel,
      this.skipLabel,
      this.showOnInit = true,
      this.showSectionLabel = false,
      this.shadowColor = Colors.black,
      this.shadowOpacity = .8,
      this.targetBuilder,
      this.context});

  @override
  State<AppTrainer> createState() => _AppTrainerState();
}

class _AppTrainerState extends State<AppTrainer> {
  bool isActive = false;
  List<TargetFocus> targets = [], specificTargets = [];

  /// Initializes the trainer with a sequence of interactive target focuses.
  ///
  /// This method sets up a list of `TargetFocus` objects based on the `targets`
  /// provided through the widget. Each target in the list is configured with
  /// specific properties like shape, radius, and content, and is intended to
  /// guide the user through various elements of the UI.
  void initTrainer() {
    // Initializes an empty list to store the target focuses.
    targets = [];

    // The total number of targets to be initialized.
    int length = widget.targets.length;

    // Iterates through each target provided in the widget.
    for (var i = 0; i < widget.targets.length; i++) {
      Target e = widget.targets[i];

      // Adds a new TargetFocus to the targets list with specific properties.
      targets.add(
        TargetFocus(
            // Unique identifier for the target, defaults to the index if not provided.
            identify: e.identify ?? i,
            // The GlobalKey of the target widget.
            keyTarget: e.key,
            // Radius for the target's focus area, with a default value.
            radius: e.shape == ShapeLightFocus.RRect ? (e.radius ?? 5) : 250,
            // The shape of the focus light.
            shape: e.shape,
            // Contents to be shown for this target focus.
            contents: [
              TargetContent(
                  // Alignment of the content relative to the target.
                  align: e.align,
                  // Builder for the content of this target.
                  builder: (context, controller) {
                    // Determines if this is the last target.
                    bool isLast = i >= length - 1;
                    // Text for the next or finish actions.
                    String text = isLast
                        ? (widget.finishLabel ?? 'Finish')
                        : (widget.nextLabel ?? 'Next');

                    // Content layout for this target.
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: e.contents ??
                          [
                            widget.targetBuilder?.call(e) ??
                                Container(
                                  padding: Ei.all(20),
                                  constraints: BoxConstraints(
                                      maxWidth: context.width * .6),
                                  decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                        colors: [
                                          Colors.black.withOpacity(.3),
                                          Colors.transparent
                                        ],
                                      ),
                                      borderRadius: Br.radius(5),
                                      border: Br.all(color: Colors.white)),
                                  child: Columnize(
                                    children: [
                                      Iconr(
                                        e.icon ?? La.bookOpen,
                                        color: Colors.white,
                                        margin: Ei.only(b: 35),
                                        size: 30,
                                      ),
                                      if (e.title != null)
                                        Textr(
                                          e.title ?? "Titulo lorem ipsum",
                                          style: LazyUi.font
                                              .copyWith(color: Colors.white),
                                          margin: Ei.only(b: 15),
                                        ),
                                      Text(e.description ?? '',
                                          style: LazyUi.font
                                              .copyWith(color: Colors.white))
                                    ],
                                  ),
                                ),
                            if (widget.showSectionLabel)
                              Row(
                                children: List.generate(3, (j) {
                                  return j == 1
                                      ? Container(
                                          height: 20,
                                          width: 1,
                                          color: isLast
                                              ? Colors.transparent
                                              : Colors.white60,
                                        )
                                      : InkTouch(
                                          padding: Ei.sym(v: 15, h: 30),
                                          onTap: isLast && j == 2
                                              ? null
                                              : () {
                                                  if (j == 2) {
                                                    controller.skip();
                                                    return;
                                                  }

                                                  if (e.onNext == null) {
                                                    controller.next();
                                                  } else {
                                                    e.onNext?.call(controller);
                                                  }
                                                },
                                          child: SlideUp(
                                            key: ValueKey(e.key),
                                            delay: (j * 100),
                                            child: Text(
                                              j == 0
                                                  ? text
                                                  : isLast && j == 2
                                                      ? ''
                                                      : (widget.skipLabel ??
                                                          'Skip'),
                                              style: LazyUi.font.copyWith(
                                                  color: Colors.white),
                                            ),
                                          ),
                                        );
                                }),
                              ).margin(t: 15),
                          ],
                    );
                  })
            ]),
      );
    }

    // Automatically shows the tutorial if specified, otherwise calls the onInit callback.
    if (widget.onInit == null && widget.showOnInit) {
      return showTutorial();
    }

    widget.onInit?.call(AppTrainerController()..show = showTutorial);
  }

  /// Displays a tutorial overlay with a series of coach marks on specific widgets.
  ///
  /// This method initializes and presents a tutorial using `TutorialCoachMark` with
  /// configurable targets and behaviors. It is designed to guide users through a
  /// series of steps or features in the application.
  ///
  /// Parameters:
  ///   [keys] (`List<GlobalKey>`) - A list of global keys corresponding to the
  ///   widgets that will be targeted by the tutorial. Defaults to an empty list,
  ///   which implies that all defined targets will be used.
  ///   [orderByKey] (`bool`) - If set to `true`, the order of the targets in the
  ///   tutorial will follow the order of the keys provided. Defaults to `false`.
  ///
  /// Behavior:
  ///   1. Checks if the tutorial is already active (`isActive`). If yes, it exits
  ///      early to avoid overlapping instances.
  ///   2. Marks the tutorial as active.
  ///   3. Filters the `targets` to include only those whose keys are in the provided
  ///      list (if any).
  ///   4. Optionally sorts the filtered targets based on the order of the keys, if
  ///      `orderByKey` is `true`.
  ///   5. Constructs and displays the tutorial overlay with the specified targets,
  ///      along with additional configurations like shadow color and opacity.
  ///
  /// Callbacks:
  ///   - `onClickTarget`: Invoked when a target in the tutorial is clicked,
  ///     passing the identifier of the clicked target.
  ///   - `onSkip`: Called when the tutorial is skipped. It resets the active state
  ///     and triggers any skip-related callbacks.
  ///   - `onFinish`: Triggered upon the completion of the tutorial. It resets the
  ///     active state and invokes finish-related callbacks.

  void showTutorial(
      {List<GlobalKey> keys = const [], bool orderByKey = false}) {
    if (isActive) return;

    isActive = true;
    specificTargets = targets.where((e) => keys.contains(e.keyTarget)).toList();

    if (orderByKey) {
      specificTargets.sort(
          (a, b) => keys.indexOf(a.keyTarget!) - keys.indexOf(b.keyTarget!));
    }

    TutorialCoachMark(
      targets: keys.isEmpty ? targets : specificTargets,
      hideSkip: true,
      colorShadow: widget.shadowColor,
      opacityShadow: widget.shadowOpacity,
      onClickTarget: (target) {
        widget.onClickTarget?.call(target.identify);
      },
      onSkip: () {
        isActive = false;
        widget.onSkip?.call();
        widget.onFinishOrSkip?.call();
        return false;
      },
      onFinish: () {
        isActive = false;
        widget.onFinish?.call();
        widget.onFinishOrSkip?.call();
      },
    ).show(context: widget.context ?? context);
  }

  @override
  Widget build(BuildContext context) {
    widget.controller?.show = showTutorial;
    initTrainer();

    return WillPopScope(onWillPop: () async => !isActive, child: widget.child);
  }
}

/// `Target` is a class representing a specific element or widget in the
/// user interface that is to be highlighted or focused on in the context of a
/// training or tutorial overlay, such as in an `AppTrainer`.

class Target {
  /// A GlobalKey used to uniquely identify and reference the target widget.
  final GlobalKey key;

  /// Specifies the alignment of the content related to the target widget.
  /// This determines where the additional information or controls related
  /// to the target will be displayed (e.g., above, below).
  final ContentAlign align;

  /// A list of widgets that will be displayed as the content for this target.
  /// This could include explanations, instructions, or any custom widgets
  /// relevant to the target.
  final List<Widget>? contents;

  /// An optional identifier for the target. This can be used for tracking
  /// or identification purposes in more complex training scenarios.
  final String? identify;

  /// The title for the target, which can be used as a header or label in the
  /// training overlay.
  final String? title;

  /// A description or additional information about the target, providing
  /// context or instructions to the user.
  final String? description;

  /// An optional icon to represent the target visually in the training overlay.
  final IconData? icon;

  /// The shape to be used for highlighting the target. It defines how the
  /// focus light will be rendered around the target.
  final ShapeLightFocus? shape;

  /// The radius for the target's focus area, particularly relevant if the
  /// shape is circular or rounded.
  final double? radius;

  /// A callback function that is called when moving to the next target in the
  /// training sequence. It allows for custom actions to be performed at this
  /// transition.
  final Function(TutorialCoachMarkController control)? onNext;

  /// Constructs a `Target` object with the given parameters.
  ///
  /// The `key` parameter is required to associate this target with a specific
  /// widget. Other parameters are optional and allow for customization of the
  /// target's appearance and behavior in the training overlay.
  const Target(
      {required this.key,
      this.identify,
      this.align = ContentAlign.bottom,
      this.contents,
      this.title,
      this.description,
      this.icon,
      this.shape,
      this.radius,
      this.onNext});
}
