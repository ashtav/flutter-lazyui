import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

class TestView extends StatelessWidget {
  const TestView({super.key});

  @override
  Widget build(BuildContext context) {
    final forms = LzForm.make(['name', 'address']);
    // logg('test view screen has running...');

    return Wrapper(
      child: Scaffold(
        appBar: AppBar(title: const Text('Test View'), actions: [
          Press(Ti.toggleLeft, () {
            forms.at(0).value(Faker.name());
          }),
          Press(Ti.forbid, () {
            // forms.at(0).enable(forms.at(0).attr.disabled);
            // forms.at(1).enable(forms.at(1).attr.disabled);
          }),
          Popover(
              content: const Content(),
              child: Iconr(
                Ti.user,
                padding: Ei.only(r: 20, l: 10),
              ))
        ]),
        body: Column(
          mainAxisAlignment: Maa.center,
          children: [
            Popover(
              content: Textr('This is an example of', margin: Ei.all(20)),
              child: Container(
                padding: Ei.all(20),
                child: const Textml(
                    '<b>Example of Textml</b> <br><br>Hello this is example of Textml usage, <b>bold</b> and <strong>strong</strong> with <u><i>italic i</i></u> and <em>italic em</em>, <del>strike</del> also <mark>mark</mark> <br><br>Break your sentences using br tag.'),
              ),
            ),
            Center(
              child: TextButton(
                  onPressed: () {
                    context.dialog(const MyContent(), backBlur: true);
                  },
                  child: Textr(
                    'Show Dialog',
                    padding: Ei.sym(v: 5, h: 20),
                  )),
            ),
            Container(
              padding: Ei.all(20),
              child: Popover(
                  content: const Content(),
                  background: 'ddd'.hex,
                  child: Container(
                      padding: Ei.all(20),
                      width: context.width,
                      decoration: BoxDecoration(color: Colors.white, border: Br.all(), borderRadius: Br.radius(5)),
                      child: const Text('Arthur Morgan'))),
            ),
            Container(
                padding: Ei.all(20),
                child: const Row(
                  mainAxisAlignment: Maa.center,
                  children: [
                    Popover(
                      content: Content(),
                      offset: Offset(55, 25),
                      child: Icon(Ti.archive),
                    ),
                    Popover(
                      content: Content(),
                      child: Icon(Ti.gift),
                    ),
                  ],
                ).gap(20))
          ],
        ),
        // body: LzListView(gap: 10, children: [
        //   const Text('Input'),
        //   LzForm.input(hint: 'Type your address', model: forms.at(1), disabled: true),
        //   25.height,
        //   const Text('Input 2'),
        //   LzForm.input2(hint: 'Type your name', model: forms.at(0), disabled: true)
        // ]),
      ),
    );
  }
}

class Content extends StatelessWidget {
  const Content({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: Ei.all(20),
      child: const Column(
        children: [
          Text('Arthur Morgan is main character in the game of RDR2, This game is so realistic for the real world!')
        ],
      ),
    );
  }
}

class Press extends StatelessWidget {
  final Function() onTap;
  final IconData icon;
  const Press(this.icon, this.onTap, {super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(onPressed: onTap, icon: Icon(icon));
  }
}

class MyContent extends StatelessWidget {
  const MyContent({super.key});

  @override
  Widget build(BuildContext context) {
    return LzDialog(
      scrollable: true,
      maxHeight: context.height * .8,

      // header
      header: LzDialog.title('Custom Dialog', icon: Ti.square),

      // footer
      footer: Column(
        children: [
          LzDialog.button('Confirm Dialog', style: Gfont.bold, icon: Ti.click),
          LzDialog.button('Close', outline: true),
        ],
      ).gap(10),
      // end of footer

      child: Column(
        children: [
          Text(Faker.words(15)).padding(all: 20),
          ...12.generate((i) {
            return Container(
              padding: Ei.all(20),
              decoration: BoxDecoration(border: Br.only(['t'])),
              child: Row(
                children: [Text(Faker.address()).lz.flexible(), const Icon(Ti.chevronRight, color: Colors.black45)],
              ).between.gap(20),
            );
          })
        ],
      ),
    );
  }
}

class PopoverContent extends StatefulWidget {
  final Widget child;
  final Widget content;
  final Offset position;
  final Size size;
  final Color? background;
  final BorderRadiusGeometry? radius;
  final Offset? offset;

  const PopoverContent(
      {super.key,
      required this.child,
      required this.content,
      required this.position,
      required this.size,
      this.background,
      this.radius,
      this.offset});

  @override
  State<PopoverContent> createState() => _PopoverContentState();
}

class _PopoverContentState extends State<PopoverContent> {
  GlobalKey keyContent = GlobalKey();
  double contentHeight = 0;
  double contentWidth = 0;
  double caretHeight = 10;
  double caretWidth = 20;

  @override
  void initState() {
    super.initState();
    // Track the height after first layout
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _updateContentHeight();
    });
  }

  void _updateContentHeight() {
    if (keyContent.currentContext != null) {
      final RenderBox renderBox = keyContent.currentContext!.findRenderObject() as RenderBox;
      setState(() {
        contentHeight = renderBox.size.height + 10; // Adjust for margin/padding
        contentWidth = renderBox.size.width;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double dy = widget.position.dy - context.windowPadding.top;

    Widget content = MeasureSize(
      onChange: (size) {
        setState(() {
          contentHeight = size.height + 10; // Adjust for margin/padding
        });
      },
      child: Container(
        margin: Ei.only(h: widget.offset?.dx ?? 20),
        key: keyContent,
        decoration: BoxDecoration(
            borderRadius: widget.radius ?? Br.radius(LazyUi.radius), color: widget.background ?? Colors.white),
        constraints: BoxConstraints(maxWidth: context.width - ((widget.offset?.dx ?? 20) * 2)),
        child: widget.content,
      ),
    );

    // Use the dynamically calculated height instead of static 100
    double contentDy = dy - contentHeight;

    // caret position
    double caretDx = (widget.position.dx + (widget.size.width / 2) - (caretWidth / 2));

    return Stack(
      children: [
        // Keep the original widget in place
        Positioned(left: widget.position.dx, top: dy, child: SizedBox(width: widget.size.width, child: widget.child)),

        // The caret (arrow) pointing to the child widget
        Positioned(
          left: caretDx > contentWidth ? ((contentWidth - (widget.offset?.dx ?? 20)) / 2) : caretDx,
          top: (dy - caretHeight - 11) - (widget.offset?.dy ?? 0),
          child: CustomPaint(
            size: Size(caretWidth, caretHeight),
            painter: CaretPainter(widget.background ?? Colors.white),
          ),
        ),

        // Popover content, dynamically positioned based on content height
        Positioned(left: 0, top: (contentDy - 10) - (widget.offset?.dy ?? 0), child: content),
      ],
    );
  }
}

class Popover extends StatelessWidget {
  final Widget child;
  final Widget content;
  final Color? background;
  final BorderRadiusGeometry? radius;
  final Offset? offset;
  const Popover({super.key, required this.child, required this.content, this.background, this.radius, this.offset});

  @override
  Widget build(BuildContext context) {
    void showPopover() {
      final RenderBox renderBox = context.findRenderObject() as RenderBox;
      final Offset position = renderBox.localToGlobal(Offset.zero);
      final Size size = renderBox.size;

      context.dialog(
        SizedBox(
          width: context.width,
          child: PopoverContent(
            position: position,
            size: size,
            content: content,
            background: background,
            radius: radius,
            offset: offset,
            child: child,
          ),
        ),
        backBlur: true,
      );
    }

    return GestureDetector(
      onTap: showPopover,
      child: child,
    );
  }
}

class MeasureSize extends StatefulWidget {
  final Widget child;
  final ValueChanged<Size> onChange;

  const MeasureSize({super.key, required this.onChange, required this.child});

  @override
  State<MeasureSize> createState() => _MeasureSizeState();
}

class _MeasureSizeState extends State<MeasureSize> {
  Size? _oldSize;

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback(_afterLayout);
    return Container(child: widget.child);
  }

  void _afterLayout(_) {
    if (!mounted) return;
    final newSize = context.size;

    // Only call onChange if the size has actually changed
    if (_oldSize == null || newSize != _oldSize) {
      _oldSize = newSize;
      if (newSize != null) {
        widget.onChange(newSize);
      }
    }
  }
}

class CaretPainter extends CustomPainter {
  final Color color;
  CaretPainter(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    var path = Path();
    path.moveTo(0, 0); // Bottom left
    path.lineTo(size.width / 2, size.height); // Top middle (caret point)
    path.lineTo(size.width, 0); // Bottom right
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
