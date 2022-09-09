import numpy
import numpy_ml
import scipy


def euclidean_distance(probe_biometric: list, reference_template: list):
    probe_biometric = numpy.asarray(probe_biometric)
    reference_template = numpy.asarray(reference_template)
    distance = numpy.linalg.norm(probe_biometric - reference_template)
    print(distance)
    return distance


def chebyshev_distance(probe_biometric: list, reference_template: list):
    probe_biometric = numpy.asarray(probe_biometric)
    reference_template = numpy.asarray(reference_template)
    distance = numpy_ml.utils.distance_metrics.chebyshev(probe_biometric, reference_template)
    print ("whoo", distance)
    return distance


def manhattan_distance(probe_biometric: list, reference_template: list):
    probe_biometric = numpy.asarray(probe_biometric)
    reference_template = numpy.asarray(reference_template)
    distance = numpy_ml.utils.distance_metrics.manhattan(probe_biometric, reference_template)
    print(distance)
    return int(distance)


def canberra_distance(probe_biometric: list, reference_template: list):
    probe_biometric = numpy.asarray(probe_biometric)
    reference_template = numpy.asarray(reference_template)
    distance = scipy.spatial.distance.canberra(probe_biometric, reference_template)
    print(distance)
    return distance



