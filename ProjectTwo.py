import numpy as np
import statistics
import matplotlib.pyplot as plt
from scipy import stats
import math

data = np.random.normal(0, 1, 100)

class ProjectTwo:
    def __init__(self):
        self.data = data

    def mean(self):
        mean = statistics.mean(self.data)
        return mean

    def min(self):
        min = np.min(self.data)
        return min

    def max(self):
        max = np.max(self.data)
        return max

    def std(self):
        std = np.std(self.data)
        return std

    def med(self):
        med = statistics.median(self.data)
        return med

    def percentile(self):
        percentile1 = np.percentile(self.data, 25)
        percentile2 = np.percentile(self.data, 75)
        return percentile1, percentile2

    def mode(self):
        mode = statistics.mode(self.data)
        return mode

    def quantile(self):
        quantile = np.quantile(self.data, 0.02)
        return quantile

    def hist(self):
        plt.hist(self.data, density = 2)

        mu = 0
        sigma = math.sqrt(np.std(self.data))
        x = np.linspace(mu - 3 * sigma, mu + 3 * sigma, 100)
        plt.plot(x, stats.norm.pdf(x, mu, sigma))
        return plt.show()

    def qq(self):
        z_value = (self.data - np.mean(self.data)) / (np.std(self.data))
        stats.probplot(z_value, dist='norm', plot=plt)
        plt.title('Normal Q-Q plot')
        return plt.show()


pj = ProjectTwo()
print(data)
print('Gia tri trung binh la: ', pj.mean())
print('Gia tri trung vi la: ', pj.med())
print('Gia tri max la: ', pj.max())
print('Gia tri min la: ', pj.min())
print('Bach phan vi la: ', pj.percentile())
print('Gia tri mode la: ', pj.mode())
print('Tu phan vi la: ', pj.quantile())

print(pj.hist())






