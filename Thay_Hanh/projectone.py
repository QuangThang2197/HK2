import math

class ProjectOne:
    def __init__(self):
        x1 = []
        x2 = []
        n = int(input('Nhap do dai mang: '))
        for i in range(n):
            x1.append(int(input('Nhap phan tu trong x1: ')))
        print('Mang 1: ',x1)
        for i in range(n):
            x2.append(int(input('Nhap phan tu trong x2: ')))
        print('Mang 2: ', x2)
        self.x1 = x1
        self.x2 = x2
    def GTTB(self):
        return sum(self.x1) / len(self.x1), sum(self.x2) / len(self.x2)

    def mode(self):
        y1 = {}
        for i1 in self.x1:
            if not i1 in y1:
                y1[i1] = 1
            else:
                y1[i1] += 1
        y2 = {}
        for i2 in self.x2:
            if not i2 in y2:
                y2[i2] = 1
            else:
                y2[i2] += 1
        return [k for k, v in y1.items() if v == max(y1.values())], [k for k, v in y2.items() if v == max(y2.values())]

    def phuong_sai(self):
        m1 = sum(self.x1)/len(self.x1)
        m2 = sum(self.x2)/len(self.x2)
        var1 = sum((i - m1) ** 2 for i in self.x1) / len(self.x1)
        var2 = sum((i - m2) ** 2 for i in self.x2) / len(self.x2)
        return var1 ,var2

    def do_lech_chuan(self):
        m1 = sum(self.x1)/len(self.x1)
        m2 = sum(self.x2)/len(self.x2)
        return math.sqrt(sum((i - m1) ** 2 for i in self.x1) / len(self.x1)), \
               math.sqrt(sum((i - m2) ** 2 for i in self.x2) / len(self.x2))


pj = ProjectOne()
print('Gia tri trung binh 2 mang lan luot la: ', pj.GTTB())
print('Gia tri mode cua 2 mang lan luot la: ', pj.mode())
print('Gia tri phuong sai cua 2 mang lan luot la: ', pj.phuong_sai())
print('Do lech chuan cua 2 mang lan luot la: ', pj.do_lech_chuan())