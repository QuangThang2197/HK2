import pandas as pd

df = pd.read_csv('danh-sach-sinh-vien.csv')
df_random7 = df.sample(n=7)
print(df_random7)

export_csv = df_random7.to_csv(r'C:\Users\RED\PycharmProjects\random7.csv',index=False)
