from rest_framework import serializers
from dutchserve.models import Event

class EventSerializer(serializers.ModelSerializer):
    class Meta:
        model = Event
        fields = ['eventName']