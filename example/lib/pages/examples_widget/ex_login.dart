part of example;

class ExLogin extends StatelessWidget {
  const ExLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrapper(
      child: Scaffold(
        body: Center(
          child: LzListView(
            shrinkWrap: true,
            scrollLimit: const [30], // index 0 = top, index 1 = bottom
            padding: Ei.only(v: 35, h: 40),
            onScroll: (controller) {
              // do something...
            },
            children: [
              LzFormGroup(
                bottomSpace: 10,
                children: [
                  LzForm.input(label: 'Email', hint: 'Type your email address'),
                  LzForm.input(label: 'Password', hint: 'Type your password'),
                ],
              ),
              Textr(
                'Forgot Password',
                icon: Ti.lock,
                style: Gfont.blue,
                margin: Ei.only(b: 25),
              ),
              LzButton(text: 'Login', onTap: (state) {})
            ],
          ),
        ),
      ),
    );
  }
}