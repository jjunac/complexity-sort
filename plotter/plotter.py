import csv

import plotly.plotly as py
import plotly.graph_objs as go
from plotly.offline import download_plotlyjs, init_notebook_mode, plot, iplot
import numpy as np
import pandas as pd
import plotly.figure_factory as FF
import math

# help(plotly.offline.iplot)
df = pd.read_csv('../lib/complexity/test.csv')

print(df)
# sample_data_table = FF.create_table(df.head())
# plot(sample_data_table, filename='sample-data-table')
traces = []
for k in df:
    if k != "array size":
        trace = go.Scatter(
            x=df['array size'], y=df[k],  # Data
            mode='lines+text', name=f"{k}")
        traces.append(trace)

layout = go.Layout(title='Simple Plot from csv data',
                     xaxis=dict(
                        type='log',
                        autorange=True
                    ),
                    yaxis=dict(
                        type='log',
                        autorange=True
                    ),
                   plot_bgcolor='rgb(230, 230,230)')
#
fig = go.Figure(data=traces, layout=layout)

# # Plot data in the notebook
plot(fig, filename='simple-plot-from-csv')
