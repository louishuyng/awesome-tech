package demo

import (
	"fmt"
	"math"
)

func sqrt(x float64) string {
	if x < 0 {
		return sqrt(-x) + "i"
	}

	return fmt.Sprint(math.Sqrt(x))
}

func pow(x, n, lim float64) float64 {
	if v := math.Pow(x, n); v < lim {
		return v
	} else {
		fmt.Printf("  %g >= %g\n", v, lim)
	}

	return lim
}

func If() {
	fmt.Println("Demo If")
	fmt.Printf("  sqrt(2)=%v sqrt(-4)=%v\n", sqrt(2), sqrt(-4))
	fmt.Println("Demo If with a short statement")
	fmt.Printf("  pow(3, 2, 10)=%v pow(3, 3, 20)=%v\n", pow(3, 2, 10), pow(3, 3, 20))
}
