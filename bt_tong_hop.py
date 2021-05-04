import pandas as pd
import networkx as nx
import matplotlib.pyplot as plt


# BT01. Tháp Hà Nội

def TowerOfHanoi(n, from_rod, to_rod, aux_rod):
    if n == 1:
        print("Move disk 1 from rod", from_rod, "to rod", to_rod)
        return
    TowerOfHanoi(n - 1, from_rod, aux_rod, to_rod)
    print("Move disk", n, "from rod", from_rod, "to rod", to_rod)
    TowerOfHanoi(n - 1, aux_rod, to_rod, from_rod)

n = int(input('Nhap so dia: '))
TowerOfHanoi(n, 'A', 'C', 'B')

# BT02. Ước số chung lớn nhất

def uscln(a, b):
    if a < 0 or b < 0:
        return None
    if b == 0:
        return a
    return uscln(b, a % b)

a = int(input("Nhập số nguyên dương a = "))
b = int(input("Nhập số nguyên dương b = "))
print("Ước số chung lớn nhất của", a, "và", b, "là:", uscln(a, b))

# BT03. Tính giai thừa của 1 số

def tinhgiaithua(n):
    giai_thua = 1;
    if n < 0:
        return ('Không tồn tại')
    elif n == 0 or n == 1:
        return giai_thua
    else:
        for i in range(2, n + 1):
            giai_thua = giai_thua * i
        return giai_thua


n = int(input("Nhập số nguyên dương n = "))
print("Giai thừa của", n, "là", tinhgiaithua(n))

# BT09. Cài đặt hàng đợi - queue
from collections import deque
d = deque([1,2,3,4])

for x in d:
    print(x)
d.remove(3)
print(d)

# BT12. Cài đặt đồ thị vô hướng

df = pd.DataFrame({'from': ['A', 'B', 'C', 'D'], 'to': ['B', 'C', 'A', 'B']})

G = nx.from_pandas_edgelist(df, 'from', 'to', create_using=nx.DiGraph())

nx.draw(G, with_labels=True, node_size=1500, alpha=0.3, arrows=True)
plt.title("Directed")
plt.show()

# BT13. Cài đặt đồ thị có hướng

df = pd.DataFrame({'from': ['A', 'B', 'C', 'D'], 'to': ['B', 'C', 'A', 'B']})

G = nx.from_pandas_edgelist(df, 'from', 'to', create_using=nx.Graph())

nx.draw(G, with_labels=True, node_size=1500, alpha=0.3, arrows=True)
plt.title("UN-Directed")
plt.show()

# BT16.  Cài đặt thuật toán sắp xếp nổi bọt

def bubblesort(list):
    for iter_num in range(len(list)-1,0,-1):
        for idx in range(iter_num):
            if list[idx]>list[idx+1]:
                temp = list[idx]
                list[idx] = list[idx+1]
                list[idx+1] = temp


list = [19,2,31,45,6,11,121,27]
bubblesort(list)
print(list)

# BT17.  Cài đặt thuật toán sắp xếp nhanh - quick sort

def partition(arr, low, high):
    i = (low - 1)
    pivot = arr[high]

    for j in range(low, high):
        if arr[j] <= pivot:
            i = i + 1
            arr[i], arr[j] = arr[j], arr[i]

    arr[i + 1], arr[high] = arr[high], arr[i + 1]
    return (i + 1)

def quickSort(arr, low, high):
    if len(arr) == 1:
        return arr
    if low < high:
        pi = partition(arr, low, high)
        quickSort(arr, low, pi - 1)
        quickSort(arr, pi + 1, high)

arr = [10, 7, 8, 9, 1, 5]
n = len(arr)
quickSort(arr, 0, n - 1)
print("Sorted array is:")
for i in range(n):
    print("%d" % arr[i])

# BT18.  Cài đặt thuật toán heap sort

def heapify(arr, n, i):
    largest = i
    l = 2 * i + 1
    r = 2 * i + 2

    if l < n and arr[i] < arr[l]:
        largest = l

    if r < n and arr[largest] < arr[r]:
        largest = r

    if largest != i:
        arr[i], arr[largest] = arr[largest], arr[i]
        heapify(arr, n, largest)

def heapSort(arr):
    n = len(arr)
    for i in range(n // 2 - 1, -1, -1):
        heapify(arr, n, i)
    for i in range(n - 1, 0, -1):
        arr[i], arr[0] = arr[0], arr[i]
        heapify(arr, i, 0)

arr = [12, 11, 13, 5, 6, 7]
heapSort(arr)
n = len(arr)
print("Sorted array is")
for i in range(n):
    print("%d" % arr[i])


# BT19.  Cài đặt thuật toán sắp xếp trộn - merge sort

def merge_sort(unsorted_list):
    if len(unsorted_list) <= 1:
        return unsorted_list
    middle = len(unsorted_list) // 2
    left_list = unsorted_list[:middle]
    right_list = unsorted_list[middle:]

    left_list = merge_sort(left_list)
    right_list = merge_sort(right_list)
    return list(merge(left_list, right_list))


def merge(left_half,right_half):

    res = []
    while len(left_half) != 0 and len(right_half) != 0:
        if left_half[0] < right_half[0]:
            res.append(left_half[0])
            left_half.remove(left_half[0])
        else:
            res.append(right_half[0])
            right_half.remove(right_half[0])
    if len(left_half) == 0:
        res = res + right_half
    else:
        res = res + left_half
    return res

unsorted_list = [64, 34, 25, 12, 22, 11, 90]

print(merge_sort(unsorted_list))
