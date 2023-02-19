package demo

import (
	"fmt"
	"math"
)

func (v *Vertex) Scale(f float64) {
	v.X = v.X * f
	v.Y = v.Y * f
}

func ScaleFunction(v *Vertex, f float64) {
	v.X = v.X * f
	v.Y = v.Y * f
}

func AbsFunc(v Vertex) float64 {
	return math.Sqrt(v.X*v.X + v.Y*v.Y)
}

func PointerReceiver() {
	v := Vertex{5, 6}
	v.Scale(10)

	fmt.Println("Test Pointer Receiver")
	fmt.Printf("  v=%v\n", v)

	v = Vertex{5, 6}
	fmt.Println("Test Pointer & Functions")
	ScaleFunction(&v, 10)
	fmt.Printf("  v=%v\n", v)

	fmt.Println("Test Methods and Pointer indirection(1)")
	v = Vertex{5, 6}
	v.Scale(2)
	fmt.Printf("  v=%v\n", v)

	p := &Vertex{5, 4}
	p.Scale(2)
	fmt.Printf("  p.Scale(2) => p=%v\n", p)

	ScaleFunction(p, 2)

	fmt.Printf("  ScaleFunction(p,2) => p=%v\n", p)

	fmt.Println("Test Methods and Pointer indirection(2)")
	p = &Vertex{5, 4}

	fmt.Printf(" p.Abs()=%v\n", p.Abs())
	fmt.Printf(" AbsFunc(*p)=%v\n", AbsFunc(*p))
}
