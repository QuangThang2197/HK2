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


# BT12. Cài đặt đồ thị vô hướng

df = pd.DataFrame({'from': ['A', 'B', 'C', 'D'], 'to': ['B', 'D', 'A', 'A']})

G = nx.from_pandas_edgelist(df, 'from', 'to', create_using=nx.DiGraph())

nx.draw(G, with_labels=True, node_size=1500, alpha=0.3, arrows=True)
plt.title("Directed")
plt.show()

# BT13. Cài đặt đồ thị có hướng

df = pd.DataFrame({'from': ['A', 'B', 'C', 'D'], 'to': ['B', 'D', 'A', 'A']})

G = nx.from_pandas_edgelist(df, 'from', 'to', create_using=nx.Graph())

nx.draw(G, with_labels=True, node_size=1500, alpha=0.3, arrows=True)
plt.title("UN-Directed")
plt.show()

# BT14.  Cài đặt thuật toán sắp xếp chọn

def insertion_sort(InputList):
    for i in range(1, len(InputList)):
        j = i-1
        nxt_element = InputList[i]

		
        while (InputList[j] > nxt_element) and (j >= 0):
            InputList[j+1] = InputList[j]
            j=j-1
        InputList[j+1] = nxt_element

list = [19,2,31,45,30,11,121,27]
insertion_sort(list)
print(list)

# BT15.  Cài đặt thuật toán sắp xếp chèn
def selection_sort(input_list):

    for idx in range(len(input_list)):

        min_idx = idx
        for j in range( idx +1, len(input_list)):
            if input_list[min_idx] > input_list[j]:
                min_idx = j
        input_list[idx], input_list[min_idx] = input_list[min_idx], input_list[idx]


l = [19,2,31,45,30,11,121,27]
selection_sort(l)
print(l)

# BT16.  Cài đặt thuật toán sắp xếp nổi bọt

def bubblesort(list):
    for iter_num in range(len(list)-1,0,-1):
        for i in range(iter_num):
            if list[i]>list[i+1]:
                temp = list[i]
                list[i] = list[i+1]
                list[i+1] = temp


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


