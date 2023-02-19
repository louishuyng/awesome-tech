package demo

import (
	"fmt"
	"math"
)

type Abser interface {
	Abs() float64
}

type I interface {
	M()
}

type T struct {
	S string
}

// This method means type T implements the interface I,
// but we don't need to explicitly declare that it does so.
func (t *T) M() {
	if t == nil {
		fmt.Println("  <nil>")
		return
	}
	fmt.Println(" ", t.S)
}

func Interfaces() {
	fmt.Println("Demo Interfaces")

	var a Abser

	f := MyFloat(-math.Sqrt2)
	v := Vertex{3, 4}

	a = f
	a = &v

	// In the following line, v is a Vertex (not *Vertex)
	// and does NOT implement Abser.
	// a = v

	fmt.Printf("  a.Abs()=%v\n", a.Abs())

	fmt.Println("Demo Interfaces implicitly")
	var i I = &T{"hello"}
	i.M()
}
