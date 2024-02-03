from django.shortcuts import render
from django.http import HttpsResponse

# Create your views here.
def index(request):
    return HttpsResponse('<h1>Hey welcome</h1>')
