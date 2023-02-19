package demo

import (
	"fmt"
	"math"
)

type F float64

func (f F) M() {
	fmt.Println(" ", f)
}

func InterfaceValues() {
	var i I

	fmt.Println("Demo Interface Values")

	i = &T{"Hello"}
	describe(i)
	i.M()

	i = F(math.Pi)
	describe(i)
	i.M()

	fmt.Println("Demo Interface Values with nil underlying values")
	var t *T
	i = t
	describe(i)
	i.M()

	fmt.Println("Demo Nil Interface Values")
	var h I
	describe(h)
	// Calling a method on a nil interface is a run-time error
	// h.M()
}

func describe(i I) {
	fmt.Printf("  (%v, %T)\n", i, i)
}
