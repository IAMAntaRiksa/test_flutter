import 'package:flutter/material.dart';

class ProfilBodyScreen extends StatelessWidget {
  const ProfilBodyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Align(
          alignment: Alignment.center,
          child: Container(
            height: 75,
            width: 75,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
            ),
            child: Image.asset('assets/splash/gaja.jpg'),
          ),
        ),
        const SizedBox(height: 10),
        Text('Akbar', style: Theme.of(context).textTheme.bodyMedium),
        Text('akbar@official.ac.id',
            style: Theme.of(context).textTheme.bodyMedium),
        const SizedBox(height: 10),
        profileCounteListViewWidget(),
        const SizedBox(height: 15),
        Expanded(
          child: ListView(
            children: [
              Container(
                padding: const EdgeInsets.all(21),
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.language_outlined),
                        ),
                        const Text('Language'),
                        const Spacer(),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.arrow_forward_ios),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.phone_android),
                        ),
                        const Text('Phone Number'),
                        const Spacer(),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.arrow_forward_ios),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.notifications_on),
                        ),
                        const Text('Notification'),
                        const Spacer(),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.arrow_forward_ios),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.shield_outlined),
                        ),
                        const Text('Privacy Setting'),
                        const Spacer(),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.arrow_forward_ios),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.message_rounded),
                        ),
                        const Text('Contact Support'),
                        const Spacer(),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.arrow_forward_ios),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.logout),
                        ),
                        const Text('Logout'),
                        const Spacer(),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.arrow_forward_ios),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

Widget profileCounteListViewWidget() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      const SizedBox(width: 35),
      profileCountWidget(
        count: 12,
        label: 'Watched',
        onTap: () {},
      ),
      profileCountWidget(
        count: 10900,
        label: 'Started',
        onTap: () {},
      ),
      profileCountWidget(
        count: 11,
        label: 'Favorite',
        onTap: () {},
      ),
      const SizedBox(width: 35),
    ],
  );
}

Widget profileCountWidget(
    {required int count, required String label, VoidCallback? onTap}) {
  return Column(
    children: [
      const Text('21',
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal)),
      const SizedBox(height: 1),
      Text(label,
          style: const TextStyle(fontSize: 15, fontWeight: FontWeight.normal)),
    ],
  );
}
