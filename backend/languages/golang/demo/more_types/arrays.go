package demo

import "fmt"

func Arrays() {
	fmt.Println("Demo Arrays")

	var a [2]string
	a[0] = "Hello"
	a[1] = "World"

	fmt.Printf("  a[0]=%v a[1]=%v\n", a[0], a[1])

	primies := [6]int{2, 3, 5, 7, 11, 13}

	fmt.Printf("  primies=%v\n", primies)
}
