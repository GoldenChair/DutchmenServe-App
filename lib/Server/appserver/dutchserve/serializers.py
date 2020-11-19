from rest_framework import serializers
from .models import Event
from .models import Organization
from .models import User
from .models import Report

class EventSerializer(serializers.ModelSerializer):
    class Meta:
        model = Event
        fields = ['eventName','pub_date','location','event_description','interests']

class OrganizationSerializer(serializers.ModelSerializer):
    class Meta:
        model = Organization
        fields = ['org_name','description','email']

class UserSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = ['first_name','last_name','username','password','email']

class ReportSerializer(serializers.ModelSerializer):
    class Meta:
        model = Report
        fields = ['hpurs']
