from django.shortcuts import render
from django.http import HttpResponse
from rest_framework import status
from rest_framework.response import Response
from rest_framework.decorators import api_view
from .models import Event
from .serializers import EventSerializer

# Create your views here.
def index(request):
    return HttpResponse("Hello, world. You're at the dutchmanserve index.")

@api_view(['GET',])
def api_detail_event_view(request):
    return HttpResponse("Hello, world. You're at the dutchmanserve index.")
#    try:
#        event_post = Event.objects.all()
#    except Event.DoesNotExist:
#        return Response(status=status.HTTP_404_NOT_FOUND)
#    
#    if request.method == 'GET':
#        serializer = EventSerializer(event_post, many = True)
#        return Response(serializer.data)

@api_view(['POST',])
def api_update_event_view(request):
    return HttpResponse("Hello, world. You're at the dutchmanserve index.")

#    if request.method == 'POST':
#        serializer = EventSerializer(data=request.data)
#        if serializer.is_valid():
#            serializer.save()
#            return Response(serializer.data, status=status.HTTP_201_CREATED)
#        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)