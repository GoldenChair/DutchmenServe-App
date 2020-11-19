from django.urls import path
from . import views
from dutchserve.api_detail__event_view import api_detail__event_view
from dutchserve.api_detail__event_view import api_update__event_view

urlpatterns = [
    path('<slug>', api_detail__event_view, name = 'detail'),
    path('<slug>', api_update__event_view, name = 'update'),
    path('', views.index, name = 'index'),
]