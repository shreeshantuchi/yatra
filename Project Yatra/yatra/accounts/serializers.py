from rest_framework import serializers
from accounts.models import User,Yatri
from django.db import models
from django.utils.http import urlsafe_base64_decode,urlsafe_base64_encode
from django.contrib.auth.tokens import PasswordResetTokenGenerator
from django.utils.encoding import force_bytes




class UserRegistrationSerializer(serializers.ModelSerializer):
    #we are writing this becuz we need ot confirm password field in our 
    #Registration request
    password2=serializers.CharField(style={'input_type=password'},write_only=True) 
    class Meta:
        model= User
        fields=['email','name','tc','password','password2' ]
        extra_kwargs={
            'password':{'write_only':True}
        }

    #Validatin Password and Confirm pPassword while Registration
    def validate(self,attrs):
        password=attrs.get('password')
        password2=attrs.get('password2')
        if password != password2:
            raise serializers.ValidationError("password and Confirm Password dosen't match")
        return attrs

    #because its a custom user we need to defince create
    def create(self, validate_data):
        return User.objects.create_user(**validate_data)


class UserLoginSerializer(serializers.ModelSerializer):
    email = serializers.EmailField(
        max_length=255,
    )    
    class Meta:
        model=User
        fields=['email','password']


class UserProfileSearializer(serializers.ModelSerializer):
    class Meta:
        model =User
        fields=['id','name','email']


class UserChangePasswordSearializer(serializers.Serializer):
    password=serializers.CharField(max_length=255,style={'input_type':'password'},write_only=True)
    password2=serializers.CharField(max_length=255,style={'input_type':'password'},write_only=True)

    class Meta:
        fields=['password','password2']


    def validate(self,attrs):
        password=attrs.get('password')
        password2=attrs.get('password2')
        user=self.context.get('user')
        if password != password2:
            raise serializers.ValidationError("password and Confirm Password dosen't match")
        user.set_password(password)
        user.save()
        return attrs


class SendPasswordResetEmailSerializer(serializers.Serializer):
    email = serializers.EmailField(
        max_length=255,
    )  

    class Meta:
        fields=['email']

    def validate(self,attrs):
        email=attrs.get('email')
        if User.objects.filter(email=email).exists():
            user=User.objects.get(email=email)
            uid=urlsafe_base64_encode(force_bytes(user.id))
            print('Encoed UID',uid)
            token=PasswordResetTokenGenerator().make_token(user)
            print('passowrResetToken',token)
            link='http://localhost:300/api/user/reset/'+uid+'/'+token
            print('passowordResetlink',link)

            #send email code 
            return attrs
        else:
            raise serializers.ValidationError('You are not a Registered user')




class YatriSerializer(serializers.ModelSerializer):
    class Meta:
        model = Yatri
        fields = '__all__'