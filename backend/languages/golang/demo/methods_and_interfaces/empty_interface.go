package demo

import "fmt"

func EmptyInterface() {
	fmt.Println("Demo Empty Interface")

	var i interface{}

	var describe = func(i interface{}) {
		fmt.Printf("  (%v, %T)\n", i, i)
	}

	describe(i)
}
