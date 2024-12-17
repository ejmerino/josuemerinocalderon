from django.db import models

class Player(models.Model):
    number = models.IntegerField(default=0)
    name = models.CharField(max_length=100)
    position = models.CharField(max_length=50)
    goals = models.IntegerField()
    assists = models.IntegerField()

    def __str__(self):
        return self.name
