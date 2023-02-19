package demo

import "fmt"

func Defer() {
	defer fmt.Print(" world\n")

	fmt.Println("Demo Defer")
	fmt.Print("  Hello")
}
