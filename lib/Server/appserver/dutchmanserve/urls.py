from django.urls import path

from . import views
from .views import event_view
from .views import update_event_view
from .views import specific_event_view
from .views import create_event_view
from .views import update_event_view
from .views import delete_event_view
from .views import org_view
from .views import specific_org_view
from .views import create_org_view
from .views import update_org_view
from .views import delete_org_view
from .views import users_view
from .views import create_user_view
from .views import update_user_view
from .views import create_report_view
from .views import specific_report_view
from .views import org_view
from .views import update_report_view
from .views import delete_event_view


app_name = 'dutchmanserve'

urlpatterns = [
    path('events', views.event_view,name='all events'),
    path('events/<str:pk>/', views.specific_event_view,name='one event'),
    path('events', views.create_event_view,name='create event'),
    path('events/<str:pk>/', views.update_event_view,name='update event'),
    path('events/<str:pk>/', views.delete_event_view,name='delete event'),
    #org
    path('orgs', views.org_view,name='all orgs'),
    path('orgs/<str:pk>/', views.specific_org_view,name='one org'),
    path('orgs', views.create_org_view,name='create org'),
    path('orgs/<str:pk>/', views.update_org_view,name='update org'),
    path('org/<str:pk>/', views.delete_org_view,name='delete orgt'),
    #user
    path('users', views.users_view,name='all users'),
    path('users', views.create_user_view,name='create user'),
    path('users/<str:pk>/', views.update_user_view,name='update user'),
    #report
    path('report/<str:pk>/', views.specific_report_view,name='report'),
    path('report', views.create_report_view,name='create report'),
    path('report/<str:pk>/', views.update_report_view,name='update report'),
    path('report/<str:pk>/', views.delete_report_view,name='delete report'),

    ##path('', views.index, name='index'),
]