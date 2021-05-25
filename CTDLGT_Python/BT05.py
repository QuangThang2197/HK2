import numpy as np
import copy

N = 10
grid = np.zeros([N, N], dtype=int)
grid = grid.tolist()


def possible(grid, y, x):
    l = len(grid)

    for i in range(l):
        if grid[y][i] == 1:
            return False
    for i in range(l):
        if grid[i][x] == 1:
            return False

    for i in range(l):
        for j in range(l):
            if grid[i][j] == 1:
                if abs(i - y) == abs(j - x):
                    return False
    return True


def solve(grid):
    l = len(grid)

    for y in range(l):
        for x in range(l):
            if grid[y][x] == 0:
                if possible(grid, y, x):
                    grid[y][x] = 1
                    solve(grid)
                    if sum(sum(a) for a in grid) == l:
                        return grid
                    grid[y][x] = 0

    return grid


Solution = solve(copy.deepcopy(grid))
print(np.matrix(Solution))


def plot(grid):
    import seaborn as sns
    import matplotlib.pyplot as plt
    import string

    l = len(grid)
    Ly = list(range(1, l + 1))[::-1]
    ly = [str(i) for i in Ly]
    Lx = list(string.ascii_uppercase)
    lx = Lx[:l]

    plt.close('all')
    sns.set(font_scale=2)
    plt.figure(figsize=(10, 10))
    ax = plt.gca()
    ax.set_aspect(1)
    sns.heatmap(Solution, linewidths=.8, cbar=False, linecolor='blue',
                cmap='Reds', center=0.4, xticklabels=lx, yticklabels=ly)


plot(grid)