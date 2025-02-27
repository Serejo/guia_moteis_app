import 'package:flutter/material.dart';
import 'package:guia_moteis_app/data/models/motel_model.dart';

class MotelCardSuitesList extends StatelessWidget {
  const MotelCardSuitesList({super.key, required this.motel, required this.mediaQuery});
  final Motel motel;
  final MediaQueryData mediaQuery;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 800,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: motel.suites.length,
        itemBuilder: (context, index) {
          final suite = motel.suites[index];

          final fotoUrl = suite.fotos.isNotEmpty ? suite.fotos[0] : '';
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: Column(
              children: [
                Container(
                  color: Colors.white,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.network(
                            suite.fotos.isNotEmpty ? suite.fotos[0] : "",
                            width: mediaQuery.size.width - 54,
                            height: 224,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return const Icon(Icons.broken_image, size: 100);
                            },
                          ),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        suite.nome,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          const Icon(
                            Icons.campaign,
                            color: Colors.red,
                          ),
                          Text(
                            "só mais ${suite.qtd} pelo app",
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.red,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                    ],
                  ),
                ),
                const SizedBox(height: 4),
                if (suite.categoriaItens != null && suite.categoriaItens!.isNotEmpty)
                  Container(
                    color: Colors.white,
                    padding: const EdgeInsets.all(4.0),
                    width: mediaQuery.size.width - 38,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: suite.categoriaItens!.take(4).map((item) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Container(
                                color: Colors.grey[300],
                                padding: const EdgeInsets.all(8.0),
                                child: Image.network(
                                  item.icone,
                                  width: 30,
                                  height: 30,
                                  errorBuilder: (context, error, stackTrace) {
                                    return const Icon(Icons.broken_image, size: 32);
                                  },
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                        const SizedBox(width: 8),
                        TextButton(
                          onPressed: () {},
                          child: Row(
                            children: [
                              Column(
                                children: [
                                  Text(
                                    'ver',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey[500],
                                    ),
                                  ),
                                  Text(
                                    'todos',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey[500],
                                    ),
                                  ),
                                ],
                              ),
                              Icon(
                                Icons.arrow_drop_down,
                                color: Colors.grey[500],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                const SizedBox(height: 4),
                Container(
                  color: Colors.white,
                  padding: const EdgeInsets.all(4.0),
                  width: mediaQuery.size.width - 38,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  suite.periodos.first.tempoFormatado,
                                  style: const TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                if (suite.periodos.first.desconto != null)
                                  Text(
                                    "R\$${suite.periodos.first.valor}",
                                    style: const TextStyle(
                                      decoration: TextDecoration.lineThrough,
                                      color: Colors.grey,
                                      fontSize: 18,
                                    ),
                                  ),
                                Text(
                                  "R\$${suite.periodos.first.valorTotal}",
                                  style: const TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: const Icon(
                          Icons.chevron_right,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
