library(data.tree)
# thiet lap cay
A <- Node$new("A")      # A là đầu tiên
B <- A$AddChild("B")    # B là con của A
C <- B$AddChild("C")    # c là con của B
D <- B$AddChild("D")    # D là con của B
E <- A$AddChild("E")    # E là con của A
F <- E$AddChild("F")    # F là con của E
G <- E$AddChild("G")    # G là con của E
H <- A$AddChild("H")    # H là con của A
I <- H$AddChild("I")    # I là con của H
J <- H$AddChild("J")    # J là con của H
K <- H$AddChild("K")    # K là con của H

print(A)
A$Get('level', traversal = "post-order")

