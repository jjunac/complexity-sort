import csv

import argparse
import plotly.graph_objs as go
from plotly.offline import plot, iplot
import math


parser = argparse.ArgumentParser()
parser.add_argument("--csv",help="The csv that needs to be plotted",
default='../test.csv')
args = parser.parse_args()

def read_csv(csv_file):
    with open(csv_file,"r") as f:
        reader = csv.DictReader(f)
        d = {key:[] for key in reader.fieldnames}
        rows = [row for row in reader]
        for key in reader.fieldnames:
            print(key)
            for row in rows:
                d[key].append(row[key])
        return d

df = read_csv(args.csv)

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
