def nhapDaThuc(n):
  dathuc = []
  for i in reversed(range((n+1))):
    a = int(input(f"nhap he so bac {i}:  "))
    dathuc.append(a)
  print('-' * 50)
  return dathuc


def bieuDienDaThuc(dathuc):
  chuoi = ""
  for (stt,i) in enumerate(reversed(dathuc)):
    if stt == 0:
      chuoi = str(i) + chuoi
    else:
      chuoi = f'{i}x^{stt} + {chuoi}'
  print(chuoi)


def congDaThuc(dathuc_1, dathuc_2):
  dathuctong = []
  chenlecbac = abs(len(dathuc_1) - len(dathuc_2))
  if len(dathuc_1) > len(dathuc_2):
    dathuc_2 = chenlecbac * [0] + dathuc_2
  else:
    if len(dathuc_2) > len(dathuc_1):
      dathuc_1 = chenlecbac * [0] + dathuc_1
  for stt in range(len(dathuc_1)):
    dathuctong.append(dathuc_1[stt]+dathuc_2[stt])
  bieuDienDaThuc(dathuctong)
  return dathuctong

n = int(input('Bac cao nhat cua A: '))
m = int(input('Bac cao nhat cua B: '))
A = nhapDaThuc(n)
B = nhapDaThuc(m)


bieuDienDaThuc(A)
bieuDienDaThuc(B)
print('-' * 50)

congDaThuc(A, B)