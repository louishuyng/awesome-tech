package demo

import "fmt"

func ZeroValues() {
	var i int
	var f float64
	var b bool
	var s string

	fmt.Println("Demo Zero Values")
	fmt.Printf("  %v %v %v %q\n", i, f, b, s)
}
