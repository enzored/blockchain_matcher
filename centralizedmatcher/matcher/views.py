from django.shortcuts import render
from django.http import JsonResponse
from . import utils
import ast


# Create your views here.
def euclidean_distance(request):
    print(request)
    probe_biometric = request.POST['probe_biometric']
    reference_template = request.POST['reference_template']
    distance = utils.euclidean_distance(ast.literal_eval(probe_biometric), ast.literal_eval(reference_template))
    return JsonResponse({"result": distance})


def canberra_distance(request):
    print(request)
    probe_biometric = request.POST['probe_biometric']
    reference_template = request.POST['reference_template']
    distance = utils.canberra_distance(ast.literal_eval(probe_biometric), ast.literal_eval(reference_template))
    return JsonResponse({"result": distance})


def chebyshev_distance(request):
    print(request)
    probe_biometric = request.POST['probe_biometric']
    reference_template = request.POST['reference_template']
    distance = utils.chebyshev_distance(ast.literal_eval(probe_biometric), ast.literal_eval(reference_template))
    return JsonResponse({"result": str(distance)})


def manhattan_distance(request):
    print(request)
    probe_biometric = request.POST['probe_biometric']
    reference_template = request.POST['reference_template']
    distance = utils.manhattan_distance(ast.literal_eval(probe_biometric), ast.literal_eval(reference_template))
    return JsonResponse({"result": distance})
