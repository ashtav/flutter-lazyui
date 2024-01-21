part of forms;

class Radio2 extends StatelessWidget {
  final String? label;
  final List<String> options;
  const Radio2({super.key, this.label, required this.options});

  @override
  Widget build(BuildContext context) {
    final notifier = FormNotifier();

    Widget labelWidget = Text(label ?? '');

    // generate options
    List<RadioModel> options = this.options.generate((item, i) {
      return RadioModel(item, value: i);
    });

    return Container(
      margin: Ei.only(b: 16),
      decoration: BoxDecoration(color: Colors.white, border: Br.all(), borderRadius: Br.radius(8)),
      padding: Ei.sym(h: 16, v: 10),
      child: Column(
        children: [
          if (label != null) labelWidget.margin(b: 8),

          // options
          notifier.watch((state) {
            return Wrap(
              alignment: Wa.start,
              children: options.generate((item, i) {
                bool active = state.option?.toMap().toString() == item.toMap().toString();
                return _Bullet(item.label, active, () {
                  state.setOption(item);
                });
              }),
            );
          })
        ],
      ).start,
    );
  }
}

class _Bullet extends StatelessWidget {
  final String label;
  final bool active;
  final Function() onTap;
  const _Bullet(this.label, this.active, this.onTap);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AnimatedContainer(
            duration: 150.ms,
            width: 20,
            height: 20,
            margin: Ei.only(r: 10),
            decoration: BoxDecoration(
                border: Br.all(color: active ? Colors.blueAccent : Colors.black38, width: active ? 5 : 2),
                borderRadius: BorderRadius.circular(50))),
        Text(label)
      ],
    ).min.margin(r: 15, b: 5).onTap(() => onTap());
  }
}
