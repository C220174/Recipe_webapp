#user api view

from rest_framework import generics, authentication, permissions
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

class ManageUserView(generics.RetrieveUpdateAPIView):
    #manage authenticated user
    serializer_class = UserSerialiser
    authentication_classes = [authentication.TokenAuthentication]
    permission_classes = [permissions.IsAuthenticated]

    def get_object(self):
        #retrieve and return authenticated user
        return self.request.user