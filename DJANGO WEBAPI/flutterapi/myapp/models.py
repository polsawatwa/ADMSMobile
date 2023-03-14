from django.db import models
class Collection(models.Model):
    title = models.CharField(max_length=100)
    sub_title = models.CharField(max_length=100)
    image_url = models.TextField(null=True, blank=True)
    detail = models.TextField(null=True, blank=True)
    status = models.IntegerField(default=1)

# Create your models here.
    def __str__(self):
        return self.title
    