import pandas as pd
import numpy as np
from matplotlib import pyplot as plt
from scipy import stats
import seaborn as sns
import statsmodels.api as sm

plt.rcParams['figure.figsize'] = [16, 9]
plt.rcParams['figure.dpi'] = 50
plt.rcParams.update({'font.size': 18})

data_in = pd.read_csv('data.csv')
screen = data_in['Screen Size']
weight = data_in['Weight']
brightness = data_in['Brightness']

class ProjectThree():
    def __init__(self, data):
        self.data = data
        self.data_chuan_hoa = np.array(data)
        self.mu = np.mean(self.data_chuan_hoa)
        self.sigma = np.std(self.data_chuan_hoa)
        self.data_chuan_hoa = (self.data - self.mu / self.sigma)
    def dist(self):
        sns.distplot(self.data, color='red')

    def qq_plot(self):
        x = np.random.normal(self.mu, self.sigma, 1000)
        sm.qqplot(x, stats.t, fit=True, line='45')
        plt.show()

pj = ProjectThree(screen)
