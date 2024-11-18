#user api view

from rest_framework import generics

from user.serialisers import UserSerialiser

class CreateUserView(generics.CreateAPIView):
    #new user in sys creation
    serializer_class = UserSerialiser
    
