package demo

import "fmt"

func TypeAssertions() {
	fmt.Println("Demo Type Assertions")

	var i interface{} = "hello"

	s := i.(string)
	fmt.Printf("  s=%v\n", s)

	s, ok := i.(string)
	fmt.Printf("  s=%v ok=%v\n", s, ok)

	f, ok := i.(float64)
	fmt.Printf("  f=%v ok=%v\n", f, ok)

	// f = i.(float64) // panic
	// fmt.Println(f)
}
