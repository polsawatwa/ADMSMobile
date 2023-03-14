#serializers.py

from rest_framework import serializers
from .models import User
from .models import Collection

class UserSerializer (serializers.ModelSerializer):
    class Meta:
        model = User
        fields = ('id', 'username', 'password') # '__all__'

class CollectionSerializer (serializers.ModelSerializer):
    class Meta:
        model = Collection
        fields = ('id', 'title', 'sub_title', 'image_url', 'detail', 'status') # '__all__'