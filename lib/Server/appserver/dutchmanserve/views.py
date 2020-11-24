from django.shortcuts import render
from django.http import HttpResponse
from rest_framework import status
from rest_framework.response import Response
from rest_framework.decorators import api_view
from .models import Event
from .serializers import EventSerializer
from .models import Organization
from .serializers import OrganizationSerializer
from .models import User
from .serializers import UserSerializer
from .models import Report
from .serializers import ReportSerializer

# Create your views here.
def index(request):
    return HttpResponse("Hello, world. You're at the dutchmanserve index.")

## EVENTS
##GET all events
@api_view(['GET'])
def event_view(request):
    #return HttpResponse("Hello, world. You're at the dutchmanserve index.")
    try:
        event_post = Event.objects.all()
    except Event.DoesNotExist:
        return Response(status=status.HTTP_404_NOT_FOUND)
    if request.method == 'GET':
        serializer = EventSerializer(event_post, many = True)
        t = {'id':'test'}
        return Response(t)
#Get specific event
@api_view(['GET'])
def specific_event_view(request, pk, format = None):
    #return HttpResponse("Hello, world. You're at the dutchmanserve index.")
    try:
        event_post = Event.objects.get(event_name = pk)
    except Event.DoesNotExist:
        return Response(status=status.HTTP_404_NOT_FOUND)
    
    if request.method == 'GET':
        serializer = EventSerializer(event_post, many = False)
        return Response(serializer.data)
#add an event
@api_view(['POST',])
def create_event_view(request):
    #return HttpResponse("Hello, world. You're at the dutchmanserve index.")
    if request.method == 'POST':
        serializer = EventSerializer(data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
#update event
@api_view(['PUT',])
def update_event_view(request, pk):
    #return HttpResponse("Hello, world. You're at the dutchmanserve index.")
    try:
        event_post = Event.objects.get(id = pk)
    except Event.DoesNotExist:
        return Response(status=status.HTTP_404_NOT_FOUND)
    if request.method == 'PUT':
        serializer = EventSerializer(event_post,data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
#delete event
@api_view(['DELETE',])
def delete_event_view(request, pk):
    #return HttpResponse("Hello, world. You're at the dutchmanserve index.")
    try:
        event_post = Event.objects.get(id = pk)
    except Event.DoesNotExist:
        return Response(status=status.HTTP_404_NOT_FOUND)
    
    if request.method == 'DELETE':
        event_post.delete()
        return Response(status=status.HTTP_204_NO_CONTENT)


###ORGANIZATIONS
@api_view(['GET'])
def org_view(request):
    #return HttpResponse("Hello, world. You're at the dutchmanserve index.")
    try:
        org_post = Organization.objects.all()
    except Organization.DoesNotExist:
        return Response(status=status.HTTP_404_NOT_FOUND)
    
    if request.method == 'GET':
        serializer = OrganizationSerializer(org_post, many = True)
        return Response(serializer.data)
#Get specific org
@api_view(['GET'])
def specific_org_view(request, pk, format = None):
    #return HttpResponse("Hello, world. You're at the dutchmanserve index.")
    try:
        org_post = Event.objects.get(id = pk)
    except Organization.DoesNotExist:
        return Response(status=status.HTTP_404_NOT_FOUND)
    
    if request.method == 'GET':
        serializer = OrganizationSerializer(org_post, many = False)
        return Response(serializer.data)
#add an org
@api_view(['POST',])
def create_org_view(request):
    #return HttpResponse("Hello, world. You're at the dutchmanserve index.")

    if request.method == 'POST':
        serializer = OrganizationSerializer(data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
#update org
@api_view(['PUT',])
def update_org_view(request, pk):
    #return HttpResponse("Hello, world. You're at the dutchmanserve index.")
    try:
        org_post = Organization.objects.get(id = pk)
    except Organization.DoesNotExist:
        return Response(status=status.HTTP_404_NOT_FOUND)
    if request.method == 'PUT':
        serializer = OrganizationSerializer(org_post,data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
#delete organization
@api_view(['DELETE',])
def delete_org_view(request, pk):
    #return HttpResponse("Hello, world. You're at the dutchmanserve index.")
    try:
        org_post = Organization.objects.get(id = pk)
    except Event.DoesNotExist:
        return Response(status=status.HTTP_404_NOT_FOUND)
    
    if request.method == 'DELETE':
        org_post.delete()
        return Response(status=status.HTTP_204_NO_CONTENT)

## USErs
@api_view(['GET'])
def users_view(request):
    #return HttpResponse("Hello, world. You're at the dutchmanserve index.")
    try:
        user_post = User.objects.all()
    except Organization.DoesNotExist:
        return Response(status=status.HTTP_404_NOT_FOUND)
    
    if request.method == 'GET':
        serializer = OrganizationSerializer(user_post, many = True)
        return Response(serializer.data)
#Add user
@api_view(['POST',])
def create_user_view(request):
    #return HttpResponse("Hello, world. You're at the dutchmanserve index.")

    if request.method == 'POST':
        serializer = UserSerializer(data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
#update user
@api_view(['PUT',])
def update_user_view(request, pk):
    #return HttpResponse("Hello, world. You're at the dutchmanserve index.")
    try:
        user_post = User.objects.get(id = pk)
    except User.DoesNotExist:
        return Response(status=status.HTTP_404_NOT_FOUND)
    if request.method == 'PUT':
        serializer = UserSerializer(user_post,data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
#portal.lvc.edu
## Report
##GET all reports
@api_view(['GET'])
def reports_view(request):
    #return HttpResponse("Hello, world. You're at the dutchmanserve index.")
    try:
        report_post = Report.objects.all()
    except Report.DoesNotExist:
        return Response(status=status.HTTP_404_NOT_FOUND)
    
    if request.method == 'GET':
        serializer = EventSerializer(report_post, many = True)
        return Response(serializer.data)
#Get specific report
@api_view(['GET'])
def specific_report_view(request, pk, format = None):
    #return HttpResponse("Hello, world. You're at the dutchmanserve index.")
    try:
        report_post = Report.objects.get(id = pk)
    except Report.DoesNotExist:
        return Response(status=status.HTTP_404_NOT_FOUND)
    
    if request.method == 'GET':
        serializer = ReportSerializer(report_post, many = False)
        return Response(serializer.data)
#add a report
@api_view(['POST',])
def create_report_view(request):
    #return HttpResponse("Hello, world. You're at the dutchmanserve index.")
    if request.method == 'POST':
        serializer = ReportSerializer(data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
#update report
@api_view(['PUT',])
def update_report_view(request, pk):
    #return HttpResponse("Hello, world. You're at the dutchmanserve index.")
    try:
        report_post = Report.objects.get(id =pk)
    except Report.DoesNotExist:
        return Response(status=status.HTTP_404_NOT_FOUND)
    if request.method == 'PUT':
        serializer = Report(report_post,data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
#delete report
@api_view(['DELETE',])
def delete_report_view(request, pk):
    #return HttpResponse("Hello, world. You're at the dutchmanserve index.")
    try:
        report_post = Report.objects.get(id =pk)
    except Report.DoesNotExist:
        return Response(status=status.HTTP_404_NOT_FOUND)
    
    if request.method == 'DELETE':
        report_post.delete()
        return Response(status=status.HTTP_204_NO_CONTENT)
