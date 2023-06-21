part of example;

class ExLogin extends StatelessWidget {
  const ExLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrapper(
      child: Scaffold(
        body: Center(
          child: ListView(
            shrinkWrap: true, physics: BounceScroll(),
            padding: Ei.all(20),
            children: [
              LzFormGroup(
                bottomSpace: 10,
                children: [
                  LzForm.input(label: 'Email', hint: 'Type your email address'),
                  LzForm.input(label: 'Password', hint: 'Type your password'),
                ],
              ),

              Textr('Forgot Password', icon: Ti.lock, style: Gfont.blue, margin: Ei.only(b: 25),),
    
              LzButton(text: 'Login', onTap: (state){})
            ],
          ),
        ),
      ),
    );
  }
}