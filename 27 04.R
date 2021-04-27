# Cay Heap 
# Upheap: chen 1 phan tu vao cuoi cay
# So sanh child and parent va tien hanh dao vi tri neu vi pham heap

# Downheap
# Doi phan tu dau va cuoi
# tien hanh downheap
# so sanh phan tu dau (parent)
# trao doi parent va child


heap.building<-function(vec)
{
  len=length(vec)
  heap=vec
  for (j in len:1)
  {
    heap=modify.heap(heap,j)
  }
  return(heap)
}



is.heap<-function(heap,root_i)
{
  i=root_i
  res=T
  while(2*i<=length(heap)&res)
  {
    son=c(heap[2*i],heap[2*i+1])
    
    res=all(heap[i]<=son)
    i=i+1
  }
  return(res)
}


modify.heap<-function(heap,root_i)
{
  len=length(heap)
  flag=1
  
  while (root_i*2<=len&&flag==1)
  {
    left_i=root_i*2
    right_i=root_i*2+1
    flag=0
    son=c(heap[left_i],heap[right_i])
    
    min_ind=which.min(son)
    if (heap[root_i]>son[min_ind])
    {
      flag=1
      heap_ind=c(left_i,right_i)[min_ind]
      
      tmp=heap[heap_ind]
      heap[heap_ind]=heap[root_i]
      heap[root_i]=tmp
      
      root_i=heap_ind
    }
  }
  return(heap)
}

heap.sort<-function(heap)
{
  sorted=NULL
  len=length(heap)
  while(len>0)
  {
    sorted=c(sorted,heap[1])
    len=length(heap)
    heap[1]=heap[len]
    heap=heap[1:(len-1)]
    heap=modify.heap(heap,root_i=1)
    len=len-1
  }
  return(sorted)
}

vec=sample(1:100)
heap=heap.building(vec)
heap
heap.sort(heap)
















