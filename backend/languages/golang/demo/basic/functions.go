package demo

import (
	"fmt"
)

func add(x int, y int) int {
	return x + y
}

func minus(x, y int) int {
	return x - y
}

func swap(x, y string) (string, string) {
	return y, x
}

func Functions() {
	fmt.Printf("Demo Add Function 42 + 13 = %d \n", add(42, 13))
	fmt.Printf("Demo Minus Function 42 - 13 = %d \n", minus(42, 13))
	fmt.Print("Demo Swap Function a, b => ")
	fmt.Println(swap("a", "b"))
}
