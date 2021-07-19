lst <- list(1, 2, 3, 4, 5)    # 1 list co 5 gia tri
lst <- vector("list", 10000)  # 10000 gia tri NULL
lst[[1]] <- 1
lst[[10000]] <- 10000  # lst gio la 1, NULL, ..., NULL, 10000
lst
