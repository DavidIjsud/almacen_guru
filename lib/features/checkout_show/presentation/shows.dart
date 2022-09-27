import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tech_interview/features/checkout_show/presentation/cubit/show/shows_cubit.dart';
import 'package:tech_interview/features/checkout_show/presentation/detail_orden.dart';
import 'package:tech_interview/features/checkout_show/presentation/widgets/show_item.dart';

class ShowsPage extends StatefulWidget {
  const ShowsPage({Key? key}) : super(key: key);

  @override
  State<ShowsPage> createState() => _ShowsState();
}

class _ShowsState extends State<ShowsPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<ShowsCubit>().fetchShows();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shows'),
        centerTitle: true,
      ),
      bottomNavigationBar: InkWell(
        onTap: () {
          num amout = context.read<ShowsCubit>().getTotalAmount();
          Navigator.push(context, MaterialPageRoute(builder: (_) {
            return DetailOrden(
              totalPayment: amout,
            );
          }));
        },
        child: Container(
          height: 50,
          color: Colors.blue,
          child: const Center(
            child: Text(
              'Checkout',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
      body: BlocConsumer<ShowsCubit, ShowsState>(
        listener: (context, state) {},
        buildWhen: (previous, current) => current is ShowsLoaded,
        builder: (context, state) {
          if (state is ShowsLoaded) {
            return ListView.builder(
              shrinkWrap: true,
              itemCount: state.shows.length,
              itemBuilder: (context, index) {
                return ShowItem(showEntity: state.shows[index]);
              },
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
