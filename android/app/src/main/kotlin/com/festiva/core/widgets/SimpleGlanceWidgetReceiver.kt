package com.festiva.core.widgets

import es.antonborri.home_widget.glance.HomeWidgetGlanceWidgetReceiver

class SimpleGlanceWidgetReceiver : HomeWidgetGlanceWidgetReceiver<SimpleGlanceWidget>() {
    override val glanceAppWidget = SimpleGlanceWidget()
}