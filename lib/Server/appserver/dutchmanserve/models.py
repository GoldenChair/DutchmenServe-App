from django.db import models

# Create your models here.


class Interests(models.Model):
    interest = models.CharField(max_length = 30)
    def __str__(self):
        return self.interest


#User models 
class User(models.Model):
    #fields in the User model
    ##user_id = models.AutoField()
    firstName = models.CharField(max_length = 12, null = True, blank = True)
    lastName = models.CharField(max_length = 20, null = True, blank = True)
    username = models.CharField(max_length = 10, null = True, blank = True)
    password = models.CharField(max_length = 150, null = True, blank = True)
    emailAddress = models.EmailField(max_length = 254, null = True, blank = True)
    ##events = models.ForeignKey(Event, on_delete=models.SET_NULL)
    interests = models.ManyToManyField(Interests, null =True, blank = True)
    ##organizations = models.ForeignKey(Organization, on_delete=models.SET_NULL)

    def __str__(self):
        return self.username


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

    eventName = models.CharField(max_length=45, null =True)
    #event_id = models.AutoField(primary_key =True)
    date = models.DateTimeField('Date', null = True)
    location = models.CharField(max_length = 50, default = 'Lebanon Valley College', null = True)
    description = models.TextField(max_length=500, null=True)
    interests = models.ManyToManyField(Interests, null = True, blank = True)

    ##interests = models.CharField(max_length = 5, choices = interest_choices, default = interest1)
    imagepath = models.FileField(null = True, blank = True)
    deleted = models.BooleanField(default=False)
    registered = models.ManyToManyField(User, null = True, blank = True)
    #need to add users
    def __str__(self):
        return self.eventName

class Organization(models.Model):
    orgName = models.CharField(max_length = 30, null = True)
    ##org_id = models.AutoField
    description = models.TextField(max_length=400, null= True, blank = True)
    email = models.EmailField(max_length = 254, null = True, blank = True)
    officers = models.ManyToManyField(User, related_name='Officers', null = True, blank = True)
    users = models.ManyToManyField(User, related_name='members', null = True, blank = True)
    deleted = models.BooleanField(default=False, null=True)
    imagepath = models.FileField(null = True, blank= True)
    ##Need officers and users
    def __str__(self):
        return self.orgName

class Report(models.Model):
    event = models.ForeignKey(Event,null =True, on_delete= models.SET_NULL)
    
    ##Event event
    hours = models.IntegerField(null = True, blank = True)
    user = models.ForeignKey(User, null = True, on_delete=models.SET_NULL)
    additional = models.ManyToManyField(User, related_name='People', blank = True)
    deleted = models.BooleanField(default=False, blank=True)
    imagepath = models.FileField(null = True, blank= True)
    ##User user
    # list of users
    #image?
     