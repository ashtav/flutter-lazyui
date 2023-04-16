part of page;

String imageUrl = 'https://raw.githubusercontent.com/ashtav/assets/master/avatar/11.jpg';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return LzProfile(
      header: LzProfileHeader(
          image: imageUrl,
          label: 'Ashta Lorem Ipsum',
          subLabel: 'Software Engineer',
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(La.qrcode, color: Colors.white)),
            IconButton(onPressed: () {}, icon: const Icon(La.cog, color: Colors.white)),
          ],
          floatingButton: LzProfileFloatingButton(
            onTap: () {},
          )),
      children: [
        Textr(
          'Account',
          icon: La.user,
          style: Gfont.bold,
          padding: Ei.all(20),
        ),
        Col(
          children: List.generate(3, (i) {
            List<String> labels = ['Tap to change your phone number', 'Username', 'Bio'],
                values = ['+62 8123 6000 000', '@ashta', 'As a Software Engineer, who needs a social life when you can debug alone all night? '];

            return InkW(
              onTap: () {},
              padding: Ei.all(20),
              border: Br.only(['t']),
              child: Row(
                children: [
                  Col(
                    children: [
                      Text(values[i]),
                      Text(
                        labels[i],
                        style: Gfont.muted,
                      ),
                    ],
                  ).flexible(),
                ],
              ),
            );
          }),
        ),
        Textr(
          'Photos (7)',
          icon: La.image,
          style: Gfont.bold,
          padding: Ei.all(20),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: Ei.sym(h: 20),
          physics: BounceScroll(),
          child: Row(
            children: List.generate(7, (i) {
              List<String> images = [
                'https://post.medicalnewstoday.com/wp-content/uploads/sites/3/2020/02/325466_1100-800x825.jpg',
                'https://desksguide.com/wp-content/uploads/2022/10/Best-Desk-Setup-for-Programming.png',
                'https://storage.googleapis.com/ekrutassets/blogs/images/000/007/026/original/H1_UIUX_Designer.jpg',
                'https://lirp.cdn-website.com/f7363214/dms3rep/multi/opt/ux-designer-640w.jpeg',
                'https://fz-wp-cdn.s3.amazonaws.com/wp-content/uploads/2018/12/26193321/Depositphotos_19526117_l-2015.jpg',
                'https://dayviolins.com/wp-content/uploads/Untitled-design-27.png',
                'https://media.istockphoto.com/id/1128444660/photo/young-successful-artist-in-art-workshop-studio.jpg?s=1024x1024&w=is&k=20&c=HypAfh0RwHsBnpX8LgAlNXx1hw6yQbkta7efMpPnPZI='
              ];

              return LzImage(
                images[i],
                size: 80,
              ).margin(l: i == 0 ? 0 : 8);
            }),
          ),
        ),
        Textr(
          Faker.words(40, 3),
          padding: Ei.all(20),
        ),
      ],
    );
  }
}
