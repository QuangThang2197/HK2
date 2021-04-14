from scipy import stats
import seaborn as sns
import matplotlib.pyplot as plt
import random

random.seed(20) #for results to be recreated
N = 50 #number of samples to take from each population
a = [random.gauss(55,20) for x in range(N)] #take N samples from population A
b = [random.gauss(50,15) for x in range(N)] #take N samples from population B
print(a)
print(b)

sns.kdeplot(a, shade=True)
sns.kdeplot(b, shade=True)
plt.title("Independent Sample T-Test")



tStat, pValue = stats.ttest_ind(a, b, equal_var = False) #run independent sample T-Test
print("P-Value:{0} T-Statistic:{1}".format(pValue,tStat)) #print the P-Value and the T-Statistic
if (pValue < 0.05):
    print("Có bằng chứng để bác bỏ giả thuyết H0")
else:
    print("Chưa có bằng chứng để bác bỏ giả thuyết H0")

plt.show()