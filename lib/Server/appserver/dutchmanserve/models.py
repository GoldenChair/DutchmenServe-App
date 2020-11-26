from django.db import models

# Create your models here.
class User(models.Model):
    ##user_id = models.AutoField()
    first_name = models.CharField(max_length = 12)
    last_name = models.CharField(max_length = 20)
    username = models.CharField(max_length = 10)
    password = models.CharField(max_length = 150)
    email = models.EmailField(max_length = 254)
    #add interests, organizations, events
    def __str__(self):
        return self.username

class Interests(models.Model):
    interest = models.CharField(max_length = 30)
    def __str__(self):
        return self.interest


class Event(models.Model):
    interest1 = "ST"
    interest2 = "Food"
    interest3 = "Hou"
    interest4 = "Edu"
    interest5 = "Envir"
    interest6 = "Ani"
    interest7 = "HandW"
    interest8 = "OA"
    interest9 = "Dis"
    interest10 = "Vet"
    interest_choices = [
        (interest1,"Service Trips"),
        (interest2,"Food"),
        (interest3, "Housing"),
        (interest4, "Education"),
        (interest5, "Environment"),
        (interest6, "Animals"),
        (interest7, "Health & Wellness"),
        (interest8, "Older Adults"),
        (interest9, "Disabilities"),
        (interest10, "Veterans"),
    ]

    event_name = models.CharField(max_length=45)
    #event_id = models.AutoField(primary_key =True)
    date = models.DateTimeField('Date', null = True)
    location = models.CharField(max_length = 50, default = 'Lebanon Valley College', null = True)
    description = models.TextField(max_length=500, null=True)
    interests = models.ManyToManyField(Interests)

    ##interests = models.CharField(max_length = 5, choices = interest_choices, default = interest1)
    imagepath = models.FileField(null = True)
    deleted = models.BooleanField(default=False)
    registered = models.ManyToManyField(User)
    #need to add users
      

class Organization(models.Model):
    org_name = models.CharField(max_length = 30)
    ##org_id = models.AutoField
    description = models.TextField(max_length=400)
    email = models.EmailField(max_length = 254)
    ##Need officers and users


class Report(models.Model):
    ##Event event
    hours = models.PositiveIntegerField()
    ##User user
    # list of users
    #image?
     
