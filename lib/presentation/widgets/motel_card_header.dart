import 'package:flutter/material.dart';
import 'package:guia_moteis_app/data/models/motel_model.dart';

class MotelCardHeader extends StatelessWidget {
  const MotelCardHeader({super.key, required this.motel});
  final Motel motel;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          backgroundImage: NetworkImage(motel.logo),
          radius: 30,
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                motel.fantasia,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                motel.distancia.toString() + 'km' + " - " + motel.bairro,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
        IconButton(
          icon: const Icon(Icons.favorite_border),
          onPressed: () {},
        ),
      ],
    );
  }
}
