import numpy as np
import statistics
import matplotlib.pyplot as plt
from scipy import stats
import math

data = np.random.normal(0, 1, 100)

class ProjectTwo:
    def __init__(self):
        self.data = data
        self.mean = statistics.mean(self.data)
        self.min = np.min(self.data)
        self.max = np.max(self.data)
        self.med = statistics.median(self.data)
        self.per1 = np.percentile(self.data, 25)
        self.per2 = np.percentile(self.data, 75)
        self.mode = statistics.mode(self.data)
        self.quantile = np.quantile(self.data, 0.02)

    def hist(self):
        plt.hist(self.data, density = 2)
        mu = 0
        sigma = math.sqrt(np.std(self.data))
        x = np.linspace(mu - 3 * sigma, mu + 3 * sigma, 100)
        plt.plot(x, stats.norm.pdf(x, mu, sigma))
        plt.show()

    def qq(self):
        z_value = (self.data - np.mean(self.data)) / (np.std(self.data))
        stats.probplot(z_value, dist='norm', plot=plt)
        plt.title('Normal Q-Q plot')
        plt.show()


pj = ProjectTwo()
print(data)
print('Gia tri trung binh la: ', pj.mean)
print('Gia tri trung vi la: ', pj.med)
print('Gia tri max la: ', pj.max)
print('Gia tri min la: ', pj.min)
print('Bach phan vi 0.25 la: ', pj.per1)
print('Bach phan vi 0.75 la: ', pj.per2)
print('Gia tri mode la: ', pj.mode)
print('Tu phan vi la: ', pj.quantile)

print(pj.hist())
print(pj.qq())






