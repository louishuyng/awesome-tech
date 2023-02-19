package demo

import "fmt"

func Pointers() {
	fmt.Println("Demo Pointers")

	i, j := 42, 2701

	p := &i
	fmt.Printf("  p:=&i => *p=%v\n", *p)
	*p = 21

	fmt.Printf("  *p=21 => i=%v\n", i)

	p = &j
	*p = *p / 37

	fmt.Printf("  p = &j; *p=*p /37 => i=%v\n", i)
}
