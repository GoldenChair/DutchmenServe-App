from django.urls import path

from . import views
from .views import event_view
from .views import api_update_event_view

app_name = 'dutchmanserve'

urlpatterns = [
    path('events', views.event_view,name='all events'),
    path('events/<string:ev>', views.specific_event_view,name='one event'),
    path('events', views.create_event_view,name='create event'),
    path('events/<string:ev>', views.update_event_view,name='update event'),
    path('events/<string:ev>', views.delete_event_view,name='delete event'),
    #org
    path('orgs', views.org_view,name='all orgs'),
    path('orgs/<string:org>', views.specific_org_view,name='one org'),
    path('orgs', views.create_org_view,name='create org'),
    path('orgs/<string:org>', views.update_org_view,name='update org'),
    path('org/<string:org>', views.delete_org_view,name='delete orgt'),
    #user
    path('users', views.users_view,name='all users'),
    path('users', views.create_user_view,name='create user'),
    path('events/<string:user>', views.update_user_view,name='update user'),
    #report
    path('report/<string:re>', views.specific_report_view,name='report'),
    path('report', views.create_report_view,name='create report'),
    path('report/<string:re>', views.update_report_view,name='update report'),
    path('report/<string:re`>', views.delete_report_view,name='delete report'),


    path('post', views.api_update_event_view, name='update'),

    ##path('', views.index, name='index'),
]