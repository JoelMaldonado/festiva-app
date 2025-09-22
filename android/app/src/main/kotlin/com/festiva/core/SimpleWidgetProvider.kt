package com.festiva.core

import android.appwidget.AppWidgetManager
import android.content.Context
import android.content.SharedPreferences
import android.net.Uri
import android.widget.RemoteViews
import es.antonborri.home_widget.HomeWidgetProvider
import es.antonborri.home_widget.HomeWidgetLaunchIntent

class SimpleWidgetProvider : HomeWidgetProvider() {

    override fun onUpdate(
        context: Context,
        appWidgetManager: AppWidgetManager,
        appWidgetIds: IntArray,
        widgetData: SharedPreferences
    ) {
        appWidgetIds.forEach { widgetId ->
            val views = RemoteViews(context.packageName, R.layout.simple_widget)

            // 1) Leer el texto guardado desde Flutter
            val msg = widgetData.getString("message", "Hola 👋")
            views.setTextViewText(R.id.widget_message, msg)

            // 2) Hacer el widget “clickeable” para abrir la app
            val clickUri = Uri.parse("homeWidgetExample://open?from=widget&homeWidget")
            val pendingIntent = HomeWidgetLaunchIntent.getActivity(
                context,
                MainActivity::class.java,
                clickUri
            )
            views.setOnClickPendingIntent(R.id.widget_root, pendingIntent)

            // 3) Aplicar la actualización
            appWidgetManager.updateAppWidget(widgetId, views)
        }
    }
}