class Stack:

    def __init__(self):
        self.stack = []

    def add(self, dataval):
# Sử dụng phương pháp nối thêm danh sách để thêm phần tử
        if dataval not in self.stack:
            self.stack.append(dataval)
            return True
        else:
            return False
# Sử dụng chế độ xem trước để nhìn vào đầu ngăn xếp

    def peek(self):
	    return self.stack[-1]

AStack = Stack()
AStack.add("Mon")
AStack.add("Tue")
AStack.peek()
print(AStack.peek())

print('-'*10)

AStack.add("Wed")
AStack.add("Thu")
print(AStack.peek())
