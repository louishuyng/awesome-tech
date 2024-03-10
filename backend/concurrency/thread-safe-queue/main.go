package main

import (
	"fmt"
	"math/rand"
	"sync"
)

type ConcurrentQueue struct {
	queue []int32
	mu    sync.Mutex
}

func (cq *ConcurrentQueue) Enqueue(item int32) {
	cq.mu.Lock()
	defer cq.mu.Unlock()

	cq.queue = append(cq.queue, item)
}

func (cq *ConcurrentQueue) Dequeue() int32 {
	cq.mu.Lock()
	defer cq.mu.Unlock()

	if len(cq.queue) == 0 {
		panic("Queue is empty")
	}

	item := cq.queue[0]
	cq.queue = cq.queue[1:]
	return item
}

func (cq *ConcurrentQueue) Size() int {
	cq.mu.Lock()
	defer cq.mu.Unlock()

	return len(cq.queue)
}

var wgE sync.WaitGroup
var wgD sync.WaitGroup

func main() {
	q1 := ConcurrentQueue{
		queue: make([]int32, 0),
	}

	for i := 0; i < 1000000; i++ {
		wgE.Add(1)

		go func() {
			q1.Enqueue(rand.Int31())
			wgE.Done()
		}()
	}

	for i := 0; i < 1000000; i++ {
		wgD.Add(1)

		go func() {
			q1.Dequeue()
			wgD.Done()
		}()
	}

	wgE.Wait()
	wgD.Wait()

	fmt.Println(q1.Size())
}
