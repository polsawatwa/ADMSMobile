#serializers.py

from rest_framework import serializers
from .models import Collection

class CollectionSerializer (serializers.ModelSerializer):
    class Meta:
        model = Collection
        fields = ('id', 'title', 'sub_title', 'image_url', 'detail', 'status') # '__all__'