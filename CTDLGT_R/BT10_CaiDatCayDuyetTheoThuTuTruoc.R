install.packages('data.tree')
library(data.tree)
# thiet lap cay
A <- Node$new("A")
B <- A$AddChild("B")
C <- B$AddChild("C")
D <- B$AddChild("D")
E <- A$AddChild("E")
F <- E$AddChild("F")
G <- E$AddChild("G")
H <- A$AddChild("H")
I <- H$AddChild("I")
J <- H$AddChild("J")
K <- H$AddChild("K")
print(A)

A$Get('level')

