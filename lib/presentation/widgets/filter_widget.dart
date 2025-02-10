import 'package:flutter/material.dart';
import 'package:guia_moteis_app/providers/motel_provider.dart';
import 'package:provider/provider.dart';

class FilterWidget extends StatefulWidget {
  final List<FilterItem> filters;

  const FilterWidget({Key? key, required this.filters}) : super(key: key);

  @override
  State<FilterWidget> createState() => _FilterWidgetState();
}

class _FilterWidgetState extends State<FilterWidget> {
  @override
  Widget build(BuildContext context) {
    final motelProvider = context.watch<MotelProvider>();

    return Container(
      height: 50,
      color: Colors.white,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.filters.length,
        itemBuilder: (context, index) {
          final isSelected = motelProvider.selectedFilterIndices.contains(index);
          final filterItem = widget.filters[index];

          return GestureDetector(
            onTap: () {
              motelProvider.toggleFilter(index);
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 8,
                vertical: 6,
              ),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                  color: isSelected ? Colors.red : Colors.grey[200],
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Colors.grey[300]!,
                  ),
                ),
                child: Row(
                  children: [
                    if (filterItem.icon != null) ...[
                      Icon(
                        filterItem.icon,
                        color: isSelected ? Colors.white : Colors.red,
                      ),
                      const SizedBox(width: 4),
                    ],
                    Text(
                      filterItem.text,
                      style: TextStyle(
                        color: isSelected ? Colors.white : Colors.grey[600],
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class FilterItem {
  final String text;
  final IconData? icon;

  FilterItem({required this.text, this.icon});
}
