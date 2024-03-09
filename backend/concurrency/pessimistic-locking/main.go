package main

import (
	"fmt"
	"sync"
)

var count int = 0
var wg sync.WaitGroup
var mu sync.Mutex

func intCount() {
	mu.Lock()
	count++
	mu.Unlock()
	wg.Done()
}

func doCount() {
	for i := 0; i < 10000000; i++ {
		wg.Add(1)
		go intCount()
	}
}

func main() {
	count = 0
	doCount()
	wg.Wait()

	fmt.Println(count)
}
