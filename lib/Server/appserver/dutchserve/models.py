from django.db import models

# Create your models here.
class Event(models.Model):
    eventName = models.CharField(max_length = 200)

    def __str__(self):
        return self.eventName
