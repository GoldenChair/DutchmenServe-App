from rest_framework import serializers
from lib.Server.appserver.dutchserve.models import Event

class EventSerializer(serializers.ModelSerializer):
    class Meta:
        model = Event
        fields = ['eventName']