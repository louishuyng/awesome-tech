package demo

import "fmt"

func FunctionClosures() {
	fmt.Println("Demo Function Closures")
	adder := func() func(int) int {
		sum := 0

		return func(x int) int {
			sum += x
			return sum
		}
	}

	pos, neg := adder(), adder()

	for i := 0; i < 10; i++ {
		fmt.Println(
			"  ",
			pos(i),
			neg(-2*i),
		)
	}
}
