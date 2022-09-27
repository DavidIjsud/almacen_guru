import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tech_interview/features/checkout_show/domain/entities/show_entity.dart';
import 'package:tech_interview/features/checkout_show/presentation/cubit/show/shows_cubit.dart';

class ShowItem extends StatelessWidget {
  final ShowEntity showEntity;

  const ShowItem({Key? key, required this.showEntity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: InkWell(
        onTap: () {},
        child: Container(
          margin: const EdgeInsets.only(top: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                showEntity.nameShow,
                style: const TextStyle(fontSize: 24),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                "Descripcion.- ${showEntity.descriptionShow}",
                style: const TextStyle(fontSize: 18),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                "Notas del vendedor.- ${showEntity.notesFromSeller}",
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                "Precio.- ${showEntity.priceShow.toStringAsFixed(2)} pesos",
                style: const TextStyle(fontSize: 12),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                "Precio delivery.- ${showEntity.deliveryPrice.toStringAsFixed(2)} pesos",
                style: const TextStyle(fontSize: 12),
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                      onPressed: () {
                        context.read<ShowsCubit>().removeShow(showEntity);
                      },
                      icon: const Icon(Icons.remove)),
                  BlocBuilder<ShowsCubit, ShowsState>(
                    builder: (context, state) {
                      return Text(
                        context
                            .read<ShowsCubit>()
                            .amountTicketsByShow(showEntity)
                            .toString(),
                        style: const TextStyle(fontSize: 18),
                      );
                    },
                  ),
                  IconButton(
                      onPressed: () {
                        context.read<ShowsCubit>().addShow(showEntity);
                      },
                      icon: const Icon(Icons.add))
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              const Divider(
                color: Colors.grey,
              )
            ],
          ),
        ),
      ),
    );
  }
}
