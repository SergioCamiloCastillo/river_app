import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:repaso_riverpod/config/app_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RiverApp'),
      ),
      body: const _HomeScreenView(),
    );
  }
}

class _HomeScreenView extends StatelessWidget {
  const _HomeScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        _CustomListTile(
            title: 'State Provider',
            subtitle: 'Un estado simple',
            location: '/state-provider'),
        _CustomListTile(
          title: 'Future provider',
          subtitle: 'Un simple future + family',
          location: '/future-provider',
        ),
        _CustomListTile(
          title: 'Stream provider',
          subtitle: 'Un simple stream + family',
          location: '/stream-provider',
        ),
      ],
    );
  }
}

class _CustomListTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final String location;
  const _CustomListTile(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.location});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      trailing: const Icon(Icons.arrow_forward_ios),
      onTap: () => context.push(location),
    );
  }
}
