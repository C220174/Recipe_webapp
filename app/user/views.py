#user api view

from rest_framework import generics
from rest_framework.authtoken.views import ObtainAuthToken
from rest_framework.settings import api_settings

from user.serialisers import (
    UserSerialiser,
    AuthTokenSerialiser,
)

class CreateUserView(generics.CreateAPIView):
    #new user in sys creation
    serializer_class = UserSerialiser

class CreateTokenView(ObtainAuthToken):
    #create new auth token for user
    serializer_class = AuthTokenSerialiser
    renderer_classes = api_settings.DEFAULT_RENDERER_CLASSES