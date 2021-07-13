import pandas as pd
import networkx as nx
import matplotlib.pyplot as plt

df = pd.DataFrame({'from': ['A', 'B', 'C', 'D'], 'to': ['B', 'D', 'A', 'A']})

G = nx.from_pandas_edgelist(df, 'from', 'to', create_using=nx.DiGraph())

nx.draw(G, with_labels=True, node_size=1500, alpha=0.3, arrows=True)
plt.title("Directed")
plt.show()
