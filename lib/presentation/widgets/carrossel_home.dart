import 'package:flutter/material.dart';
import 'package:guia_moteis_app/providers/motel_provider.dart';
import 'package:provider/provider.dart';

class CarrosselHome extends StatefulWidget {
  @override
  _CarrosselHomeState createState() => _CarrosselHomeState();
}

class _CarrosselHomeState extends State<CarrosselHome> {
  PageController _pageController = PageController();
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        _currentIndex = _pageController.page!.toInt();
      });
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final motelProvider = context.watch<MotelProvider>();
    final motels = motelProvider.motels;

    if (motels.isEmpty) {
      return const Center(child: Text('Nenhum motel encontrado'));
    }
    return Column(
      children: [
        Container(
          height: 200,
          child: PageView.builder(
            controller: _pageController,
            itemCount: motels.length,
            itemBuilder: (context, index) {
              return Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.5,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    clipBehavior: Clip.antiAlias,
                    child: Image.network(
                      motels[index].suites.first.fotos.first,
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.5,
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Column(
                              children: [
                                Icon(
                                  Icons.whatshot,
                                  color: Colors.red,
                                  size: 16,
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  motels[index].fantasia,
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  motels[index].bairro,
                                  style: TextStyle(
                                    fontSize: 10,
                                  ),
                                ),
                                SizedBox(width: 4),
                                Text(
                                  (motels[index].suites.first.periodos.first.desconto.toString() == null
                                          ? motels[index].suites.first.periodos.first.desconto.toString()
                                          : "30%") +
                                      " de desconto",
                                  style: TextStyle(
                                    fontSize: 14,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                                SizedBox(height: 2),
                                Text(
                                  "a partir de " + "R\$" + motels[index].suites.first.periodos.first.valor.toString(),
                                  style: TextStyle(
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: TextButton(
                            onPressed: () {},
                            style: TextButton.styleFrom(
                              backgroundColor: Colors.green,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                            child: Container(
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    "reservar",
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(width: 4),
                                  Icon(
                                    Icons.chevron_right,
                                    color: Colors.white,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              motels.length,
              (index) => AnimatedContainer(
                duration: Duration(milliseconds: 300),
                margin: EdgeInsets.symmetric(horizontal: 5),
                height: 10,
                width: _currentIndex == index ? 20 : 10,
                decoration: BoxDecoration(
                  color: _currentIndex == index ? Colors.blue : Colors.grey,
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

void main() => runApp(MaterialApp(home: CarrosselHome()));
