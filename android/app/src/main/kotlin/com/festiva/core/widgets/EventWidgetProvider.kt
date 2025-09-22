package com.festiva.core.widgets

import android.appwidget.AppWidgetManager
import android.content.Context
import android.content.SharedPreferences
import android.net.Uri
import android.widget.RemoteViews
import com.festiva.core.MainActivity
import com.festiva.core.R
import es.antonborri.home_widget.HomeWidgetLaunchIntent
import es.antonborri.home_widget.HomeWidgetProvider

class EventWidgetProvider : HomeWidgetProvider() {

    override fun onUpdate(
        context: Context,
        appWidgetManager: AppWidgetManager,
        appWidgetIds: IntArray,
        widgetData: SharedPreferences
    ) {
        appWidgetIds.forEach { appWidgetId ->
            val views = RemoteViews(context.packageName, R.layout.event_widget)

            val title = widgetData.getString("event_title", "Evento")
            val date = widgetData.getString("event_date", "Fecha")
            val imageName = widgetData.getString("event_image", "event_placeholder")

            // Título/fecha desde Flutter
            views.setTextViewText(R.id.event_title, title)
            views.setTextViewText(R.id.event_date, date)

            // Imagen por nombre de drawable (en res/drawable)
            val resId = context.resources.getIdentifier(
                imageName ?: "event_placeholder",
                "drawable",
                context.packageName
            )
            views.setImageViewResource(
                R.id.event_image,
                if (resId != 0) resId else R.drawable.event_placeholder
            )

            // Tap para abrir la app (opcional: con un deep link)
            val uri = Uri.parse("homeWidgetExample://open?from=event_widget")
            val pendingIntent = HomeWidgetLaunchIntent.getActivity(
                context,
                MainActivity::class.java,
                uri
            )
            views.setOnClickPendingIntent(R.id.event_root, pendingIntent)

            appWidgetManager.updateAppWidget(appWidgetId, views)
        }
    }
}
