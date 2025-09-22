import 'package:home_widget/home_widget.dart';

/// Guarda el texto que mostrará el widget y solicita actualización.
Future<void> setWidgetText(String text) async {
  await HomeWidget.saveWidgetData<String>('message', text);
  await HomeWidget.updateWidget(
    // Usa el nombre completamente calificado de tu provider Android:
    qualifiedAndroidName: 'com.festiva.core.SimpleWidgetProvider',
  );
}

/// (Opcional) Llama esto al iniciar la app para detectar si se abrió desde el widget.
Future<void> initWidgetDeepLinks() async {
  final initial = await HomeWidget.initiallyLaunchedFromHomeWidget();
  if (initial != null) {
    // Aquí puedes navegar según parámetros del Uri (initial).
  }
  HomeWidget.widgetClicked.listen((uri) {
    if (uri != null) {
      // Maneja el click cuando la app ya estaba abierta.
    }
  });
}
