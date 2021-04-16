file = read.csv("Temperature.csv", header = TRUE)
ket_qua = matrix(nrow = 16, ncol = 12)
unique(file$Year)

file1 = file[file$Year == 1990,]
ket_qua[1,] = tapply(file1$Temperature, INDEX = file1$Month, FUN = mean, na.rm = TRUE)

file2 = file[file$Year == 1991,]
ket_qua[2,] = tapply(file2$Temperature, INDEX = file2$Month, FUN = mean, na.rm = TRUE)

file3 = file[file$Year == 1992,]
ket_qua[3,] = tapply(file3$Temperature, INDEX = file3$Month, FUN = mean, na.rm = TRUE)

file4 = file[file$Year == 1993,]
ket_qua[4,] = tapply(file4$Temperature, INDEX = file4$Month, FUN = mean, na.rm = TRUE)

file5 = file[file$Year == 1994,]
ket_qua[5,] = tapply(file5$Temperature, INDEX = file5$Month, FUN = mean, na.rm = TRUE)

file6 = file[file$Year == 1995,]
ket_qua[6,] = tapply(file6$Temperature, INDEX = file6$Month, FUN = mean, na.rm = TRUE)

file7 = file[file$Year == 1996,]
ket_qua[7,] = tapply(file7$Temperature, INDEX = file7$Month, FUN = mean, na.rm = TRUE)

file8 = file[file$Year == 1997,]
ket_qua[8,] = tapply(file8$Temperature, INDEX = file8$Month, FUN = mean, na.rm = TRUE)

file9 = file[file$Year == 1998,]
ket_qua[9,] = tapply(file9$Temperature, INDEX = file9$Month, FUN = mean, na.rm = TRUE)

file10 = file[file$Year == 1999,]
ket_qua[10,] = tapply(file10$Temperature, INDEX = file10$Month, FUN = mean, na.rm = TRUE)

file11 = file[file$Year == 2000,]
ket_qua[11,] = tapply(file11$Temperature, INDEX = file11$Month, FUN = mean, na.rm = TRUE)

file12 = file[file$Year == 2001,]
ket_qua[12,] = tapply(file12$Temperature, INDEX = file12$Month, FUN = mean, na.rm = TRUE)

file13 = file[file$Year == 2002,]
ket_qua[13,] = tapply(file13$Temperature, INDEX = file13$Month, FUN = mean, na.rm = TRUE)

file14 = file[file$Year == 2003,]
ket_qua[14,] = tapply(file14$Temperature, INDEX = file14$Month, FUN = mean, na.rm = TRUE)

file15 = file[file$Year == 2004,]
ket_qua[15,] = tapply(file15$Temperature, INDEX = file15$Month, FUN = mean, na.rm = TRUE)

file16 = file[file$Year == 2005,]
ket_qua[16,] = tapply(file16$Temperature, INDEX = file16$Month, FUN = mean, na.rm = TRUE)
