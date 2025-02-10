import 'package:flutter/material.dart';
import 'package:guia_moteis_app/presentation/widgets/carrossel_home.dart';
import 'package:guia_moteis_app/presentation/widgets/home_header.dart';
import 'package:provider/provider.dart';
import '../../providers/motel_provider.dart';
import '../widgets/motel_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<MotelProvider>().loadMotels();
    });
  }

  @override
  Widget build(BuildContext context) {
    final motelProvider = context.watch<MotelProvider>();

    return Scaffold(
      appBar: const HomeHeader(),
      backgroundColor: Colors.red,
      body: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.0),
              topRight: Radius.circular(30.0),
            ),
          ),
          child: _buildBody(motelProvider)),
    );
  }

  Widget _buildBody(MotelProvider provider) {
    if (provider.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (provider.errorMessage != null) {
      return Center(
        child: Text(provider.errorMessage!),
      );
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        children: [
          const SizedBox(height: 16),
          SizedBox(height: 250, child: CarrosselHome()),
          const SizedBox(height: 16),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: provider.motels.length,
              itemBuilder: (context, index) {
                final motel = provider.motels[index];
                return MotelCard(
                  name: motel.bairro,
                  price: motel.media,
                  imageUrl: motel.logo,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
