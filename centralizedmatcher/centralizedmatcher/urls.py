from django.contrib import admin
from django.urls import path
from matcher import views


urlpatterns = [
    path('admin/', admin.site.urls),
    path('euclidean/', views.euclidean_distance),
    path('chebyshev/', views.chebyshev_distance),
    path('manhattan/', views.manhattan_distance),
    path('canberra/', views.canberra_distance),
]
