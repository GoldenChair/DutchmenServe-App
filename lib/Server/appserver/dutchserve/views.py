from django.shortcuts import render
from django.http import HttpResponse
from rest_framework import status
from rest_framework.decorators import api_view
from rest_framework.response import Response
from lib.Server.appserver.dutchserve.models import Event
from lib.Server.appserver.dutchserve.serializers import EventSerializer
# Create your views here.
def index(request):
    return HttpResponse("Hello, you got to Dutchman Serve.")

@api_view(['GET', ])
def api_detail_event_view(request,slug):
   return