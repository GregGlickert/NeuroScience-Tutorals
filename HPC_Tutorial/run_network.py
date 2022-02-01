# -*- coding: utf-8 -*-
import os, sys
from bmtk.simulator import bionet
import math
from bmtk.simulator.bionet.pyfunction_cache import add_weight_function
import numpy as np

np.random.seed(123412)

def gaussianLL(edge_props, source, target):
    src_tuning = source['tuning_angle']
    tar_tuning = target['tuning_angle']
    w0 = edge_props["syn_weight"]
    sigma = edge_props["weight_sigma"]

    delta_tuning = abs(abs(abs(180.0 - abs(float(tar_tuning) - float(src_tuning)) % 360.0) - 90.0) - 90.0)
    return w0 * math.exp(-(delta_tuning / sigma) ** 2)

add_weight_function(gaussianLL)

def run(config_file):
    conf = bionet.Config.from_json(config_file, validate=True)
    conf.build_env()

    graph = bionet.BioNetwork.from_config(conf)
    sim = bionet.BioSimulator.from_config(conf, network=graph)
    sim.run()
    bionet.nrn.quit_execution()


if __name__ == '__main__':
    if __file__ != sys.argv[-1]:
        run(sys.argv[-1])
    else:
        run('simulation_config.json')
