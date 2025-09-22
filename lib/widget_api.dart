import 'package:home_widget/home_widget.dart';

const _androidReceiver = 'com.festiva.core.widgets.EventWidgetProvider';

/// Envía datos al widget y lo refresca.
/// `imageDrawableName` es opcional: debe ser el *nombre* de un drawable en Android (sin extensión),
/// por ejemplo "event_placeholder".
Future<void> pushEventToWidget({
  required String title,
  required String dateText,
  String imageDrawableName = 'event_placeholder',
}) async {
  await HomeWidget.saveWidgetData<String>('event_title', title);
  await HomeWidget.saveWidgetData<String>('event_date', dateText);
  await HomeWidget.saveWidgetData<String>('event_image', imageDrawableName);

  await HomeWidget.updateWidget(
    // mejor calificado (package + clase) para evitar confusiones
    qualifiedAndroidName: _androidReceiver,
  );
}
