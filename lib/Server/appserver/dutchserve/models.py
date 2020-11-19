from django.db import models

from django.utils.text import slugify


# Create your models here.
class Event(models.Model):
    eventName             = models.CharField(max_length = 200)
    slug                  = models.SlugField(blank=True)

    def __str__(self):
        return self.eventName
