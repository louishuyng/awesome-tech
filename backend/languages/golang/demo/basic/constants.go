package demo

import "fmt"

const Pi = 3.14

func Constants() {
	const World = "Hello world"
	fmt.Println("Demo Constants")

	fmt.Println("  Hello", World)
	fmt.Println("  Happy", Pi, "Day")

	const Truth = true
	fmt.Println("  Go rules?", Truth)
}
