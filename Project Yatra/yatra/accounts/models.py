from django.db import models
from datetime import datetime

from django.contrib.auth.models import BaseUserManager, AbstractBaseUser

#Custom user manager class
class UserManager(BaseUserManager):
    def create_user(self, email, name, tc, password=None, password2=None):
        """
        Creates and saves a User with the given email, name, tc and password.
        """
        if not email:
            raise ValueError('Users must have an email address')

        user = self.model(
            email=self.normalize_email(email),
            name=name,
            tc=tc
        )

        user.set_password(password)
        user.save(using=self._db)
        return user

    def create_superuser(self, email, name,tc, password=None):
        """
        Creates and saves a superuser with the given email, name,tc and password.
        """
        user = self.create_user(
            email,
            password=password,
            name=name,
            tc=tc,
        )
        user.is_admin = True
        user.save(using=self._db)
        return user



#Custom User model
class User(AbstractBaseUser):
    email = models.EmailField(
        verbose_name='Email',
        max_length=255,
        unique=True,
    )
    name = models.CharField(max_length=200)
    tc=models.BooleanField()
    is_active = models.BooleanField(default=True)
    is_admin = models.BooleanField(default=False)
    created_at=models.DateTimeField(auto_now_add=True)
    Updated_at=models.DateTimeField(auto_now=True)


    objects = UserManager()

    USERNAME_FIELD = 'email'
    REQUIRED_FIELDS = ['name','tc']

    def __str__(self):
        return self.email

    def has_perm(self, perm, obj=None):
        "Does the user have a specific permission?"
        # Simplest possible answer: Yes, always
        return self.is_admin

    def has_module_perms(self, app_label):
        "Does the user have permissions to view the app `app_label`?"
        # Simplest possible answer: Yes, always
        return True

    @property
    def is_staff(self):
        "Is the user a member of staff?"
        # Simplest possible answer: All admins are staff
        return self.is_admin


class Interest(models.Model):
    name = models.CharField(max_length=255)
    description = models.TextField(max_length=100,null=True)

    def __str__(self):
        return self.name



class Country(models.Model):
    name = models.CharField(max_length=100)

    def __str__(self):
        return self.name

class Yatri(models.Model):
    user=models.OneToOneField(User,null=True,on_delete=models.CASCADE)
    first_name = models.CharField(max_length=100,null=True)
    last_name = models.CharField(max_length=100, null=True, blank=True)
    
    country = models.ForeignKey(Country, null=True, on_delete=models.SET_NULL)
    location= models.CharField(max_length=30, blank=True)
    interests=models.ManyToManyField(Interest,null=True)


    created_at=models.DateTimeField(auto_now_add=True)
    Updated_at=models.DateTimeField(auto_now=True)

    
    def __str__(self):
        return str(self.first_name)