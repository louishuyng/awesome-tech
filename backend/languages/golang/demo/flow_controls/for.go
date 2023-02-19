package demo

import "fmt"

func For() {
	fmt.Println("Demo For")
	sum := 0

	for i := 0; i < 10; i++ {
		sum += i
	}

	fmt.Printf("  sum=%v\n", sum)

	fmt.Println("Demo For continued")

	sum = 1

	for sum < 100 {
		sum += sum
	}

	fmt.Printf("  sum=%v\n", sum)
}
