package com.festiva.core.widgets

import android.content.Context
import androidx.compose.runtime.Composable
import androidx.glance.GlanceId
import androidx.glance.GlanceModifier
import androidx.glance.action.actionStartActivity
import androidx.glance.action.clickable
import androidx.glance.appwidget.GlanceAppWidget
import androidx.glance.appwidget.provideContent
import androidx.glance.currentState
import androidx.glance.layout.Box
import androidx.glance.layout.fillMaxSize
import androidx.glance.layout.padding
import androidx.glance.text.Text
import androidx.glance.text.TextStyle
import androidx.glance.unit.dp
import com.festiva.core.MainActivity
import es.antonborri.home_widget.glance.HomeWidgetGlanceState
import es.antonborri.home_widget.glance.HomeWidgetGlanceStateDefinition

class SimpleGlanceWidget : GlanceAppWidget() {

    override val stateDefinition = HomeWidgetGlanceStateDefinition()

    override suspend fun provideGlance(context: Context, id: GlanceId) {
        provideContent {
            val state: HomeWidgetGlanceState = currentState()
            Content(state)
        }
    }

    @Composable
    private fun Content(state: HomeWidgetGlanceState) {
        val message = state.preferences.getString("message", "Hola 👋") ?: "Hola 👋"
        Box(
            modifier = GlanceModifier
                .fillMaxSize()
                .padding(12.dp)
                .clickable(onClick = actionStartActivity<MainActivity>())
        ) {
            Text(text = message, style = TextStyle())
        }
    }
}
