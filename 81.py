# Project Euler, Problem #81
# Lucas Garron
# Date: September 02, 2014

import csv
import networkx as nx

######## Read Input

with open("input/81.csv") as f:
  arr = [map(int, line) for line in csv.reader(f)]

mRows = len(arr)
nCols = len(arr[0])

######## Construct Graph

G = nx.DiGraph()

def add_edges(offsetFromX, offsetFromY, offsetToX, offsetToY):
  for   i in range(mRows - max(offsetFromX, offsetToX)):
    for j in range(nCols - max(offsetFromY, offsetToY)):
      G.add_edge(
                  (i + offsetFromX, j + offsetFromY),
                  (i + offsetToX  , j + offsetToY  ),
        weight=arr[i + offsetToX  ][j + offsetToY  ]
      )

add_edges(0,0, 1,0)
add_edges(0,0, 0,1)

source = (0, 0)
target = (mRows-1, nCols-1)

# Note: Assumes there are no negative edges.
path = nx.shortest_path(
  G,
  source=source,
  target=target,
  weight="weight"
)

# Start with weight from first node.
length = arr[source[0]][source[1]]
for i in range(len(path) - 1):
  fromNode = path[i]
  toNode = path[i+1]
  length += G.get_edge_data(fromNode, toNode)["weight"]
  # print(G.get_edge_data(fromNode, toNode)["weight"])

print length
