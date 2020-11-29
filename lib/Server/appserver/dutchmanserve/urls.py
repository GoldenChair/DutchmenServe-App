from django.urls import path

from . import views
from .views import event_view
from .views import specific_event_view
from .views import org_view
from .views import specific_org_view
from .views import users_view
from .views import specific_users_view

from .views import specific_report_view
from .views import org_view
from .views import reports_view


app_name = 'dutchmanserve'

urlpatterns = [
    path('events', views.event_view,name='all events'),
    path('events/<int:pk>/', views.specific_event_view,name='one event'),
    #org
    path('orgs', views.org_view,name='all orgs'),
    path('orgs/<int:pk>/', views.specific_org_view,name='one org'),
    #user
    path('users', views.users_view,name='all users'),
    path('users/<int:pk>/', views.specific_users_view,name='update user'),
    #report
    path('report/<int:pk>/', views.specific_report_view,name='specific report'),
    path('report', views.reports_view,name='reports'),

    ##path('', views.index, name='index'),
]