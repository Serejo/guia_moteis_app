import 'package:flutter/material.dart';
import 'package:guia_moteis_app/presentation/widgets/carrossel_home.dart';
import 'package:guia_moteis_app/presentation/widgets/filter_widget.dart';
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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        icon: const Icon(
          Icons.map_outlined,
          color: Colors.red,
        ),
        label: const Text(
          'Mapa',
          style: TextStyle(color: Colors.red),
        ),
        backgroundColor: Colors.grey[200],
      ),
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
        ),
        child: _buildBody(motelProvider),
      ),
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

    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: SizedBox(
            height: 230,
            child: CarrosselHome(),
          ),
        ),
        SliverPersistentHeader(
          pinned: true,
          delegate: _SliverAppBarDelegate(
            minHeight: 60.0,
            maxHeight: 60.0,
            child: Container(
              color: Colors.white,
              child: FilterWidget(
                filters: provider.filters,
              ),
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              final motel = provider.motels[index];
              return MotelCard(
                motel: motel,
              );
            },
            childCount: provider.motels.length,
          ),
        ),
      ],
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });

  final double minHeight;
  final double maxHeight;
  final Widget child;

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => maxHeight;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight || minHeight != oldDelegate.minHeight || child != oldDelegate.child;
  }
}
