package demo

import (
	"fmt"
	"math"
)

func TypeConversions() {
	x, y := 3, 4

	var f float64 = math.Sqrt(float64(x*x + y*y))

	var z uint = uint(f)

	fmt.Println("Demo Type conversions")
	fmt.Printf("  %v %v %v\n", x, y, z)
}
