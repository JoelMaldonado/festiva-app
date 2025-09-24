# Google Play Billing
-keep class com.android.billingclient.** { *; }
-dontwarn com.android.billingclient.**

# TikTok SDK (por si usa reflexión)
-keep class com.tiktok.** { *; }
-dontwarn com.tiktok.**