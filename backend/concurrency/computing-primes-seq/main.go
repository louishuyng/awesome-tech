package main

import (
	"fmt"
	"math"
	"time"
)

// 100 million
var MAX_INT = 100000000
var totalPrimeNumbers int32 = 0

func checkPrime(x int) {
	if x&1 == 0 {
		return
	}

	for i := 3; i <= int(math.Sqrt(float64(x))); i += 2 {
		if x%i == 0 {
			return
		}
	}

	totalPrimeNumbers++
}

func main() {
	start := time.Now()

	for i := 2; i < MAX_INT; i++ {
		checkPrime(i)
	}

	fmt.Println("checking till", MAX_INT, "found", totalPrimeNumbers, "prime numbers. took", time.Since(start))
}
