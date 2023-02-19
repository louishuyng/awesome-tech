package demo

import (
	"fmt"
	"math"
)

func compute(fn func(float64, float64) float64) float64 {
	return fn(3, 4)
}

func FunctionValues() {
	fmt.Println("Demo Function Values")

	hypot := func(x, y float64) float64 {
		return math.Sqrt(x*x + y*y)
	}

	fmt.Println("  hypot(5,12)=", hypot(5, 12))

	fmt.Println("  compute(hypot)=", compute(hypot))
	fmt.Println("  compute(math.Pow)=", compute(math.Pow))
}
