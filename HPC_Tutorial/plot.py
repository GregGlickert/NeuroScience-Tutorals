from bmtk.analyzer.spike_trains import plot_raster
import matplotlib.pyplot as plt

plot = plot_raster(config_file='simulation_config.json', group_by='pop_name', show=False)

plt.savefig('raster.png')