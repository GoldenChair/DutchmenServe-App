from django.urls import path

from . import views
from .views import api_detail_event_view
from .views import api_update_event_view

app_name = 'dutchmanserve'

urlpatterns = [
    path('', views.api_detail_event_view,name='detail'),
    path('/post', views.api_update_event_view, name='update'),

    ##path('', views.index, name='index'),
]