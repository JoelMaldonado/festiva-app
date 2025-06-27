import 'package:festiva/presentation/providers/event_provider.dart';
import 'package:festiva/presentation/theme/colors.dart';
import 'package:festiva/presentation/widgets/widgets.dart';
import 'package:festiva/util/date_functions.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailEventPage extends StatefulWidget {
  final int idEvent;
  const DetailEventPage({
    super.key,
    required this.idEvent,
  });

  @override
  State<DetailEventPage> createState() => _DetailEventPageState();
}

class _DetailEventPageState extends State<DetailEventPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<EventProvider>(context, listen: false)
          .getEvent(widget.idEvent);
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<EventProvider>(context);
    return AppScaffold(
      isLoadingScreen: provider.isLoadingEvent,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          spacing: 12,
          children: [
            Material(
              elevation: 12,
              borderRadius: BorderRadius.circular(20),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: SizedBox(
                  width: double.infinity,
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: provider.event?.imageUrl != null
                        ? Image.network(
                            provider.event!.imageUrl,
                            fit: BoxFit.cover,
                          )
                        : SizedBox.shrink(),
                  ),
                ),
              ),
            ),
            Row(
              spacing: 12,
              children: [
                Expanded(
                  child: Text(
                    provider.event?.title ?? "",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                      color: AppColors.colorT1,
                    ),
                  ),
                ),
                AppFloatingActionButton(
                  onPressed: () {},
                  icon: Icons.favorite_outline,
                ),
                AppFloatingActionButton(
                  onPressed: () {},
                  icon: Icons.share_outlined,
                ),
              ],
            ),
            Text(
              provider.event?.description ?? "",
              style: TextStyle(
                fontSize: 14,
                color: AppColors.colorT2,
              ),
            ),
            Row(
              spacing: 12,
              children: [
                Expanded(
                  flex: 1,
                  child: _itemDetail(
                    icon: Icons.calendar_month_outlined,
                    title: "Fecha",
                    value:
                        provider.event?.eventDatetime?.format() ?? "Sin Fecha",
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: _itemDetail(
                    icon: Icons.schedule_outlined,
                    title: "Horario",
                    value: provider.event?.eventDatetime
                            ?.format(pattern: 'HH:mm') ??
                        "Sin Hora",
                  ),
                ),
              ],
            ),
            _itemDetail(
              icon: Icons.explore_outlined,
              title: "Ubicación",
              value: "Av. Los Pinos 123, Lima, Perú",
            ),
            Row(
              spacing: 12,
              children: [
                Expanded(
                  flex: 2,
                  child: _itemDetail(
                    icon: Icons.calendar_month_outlined,
                    title: "Fecha",
                    value: "13/06/2025",
                  ),
                ),
                FloatingActionButton(
                  onPressed: () {},
                  backgroundColor: AppColors.colorBlue,
                  foregroundColor: AppColors.colorT1,
                  shape: CircleBorder(),
                  child: Icon(Icons.message_outlined),
                ),
                FloatingActionButton(
                  onPressed: () {},
                  backgroundColor: AppColors.colorGreen,
                  foregroundColor: AppColors.colorT1,
                  shape: CircleBorder(),
                  child: Icon(Icons.workspace_premium),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Container _itemDetail({
    required IconData icon,
    required String title,
    required String value,
  }) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.colorB3,
        borderRadius: BorderRadius.circular(12),
      ),
      padding: EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 4,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: 8,
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon,
                size: 20,
                color: AppColors.colorT1,
              ),
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w900,
                    color: AppColors.colorT1,
                  ),
                ),
              ),
            ],
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: AppColors.colorT2,
            ),
            maxLines: 1,
          ),
        ],
      ),
    );
  }
}
