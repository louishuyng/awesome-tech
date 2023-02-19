package demo

import "fmt"

type Vertex struct {
	X int
	Y int
}

func Struct() {
	fmt.Println("Demo Struct")

	v := Vertex{1, 2}

	fmt.Printf("  Vertex%v\n", v)

	v.X = 4

	fmt.Println("Demo Fields")
	fmt.Printf("  v.X=%v\n", v.X)

	fmt.Println("Demo Pointers to structs")
	p := &v
	p.X = 1e9
	(*p).Y = 1e8

	fmt.Printf("  v=%v", v)

	fmt.Println("Demo Struct Literals")

	var v1 Vertex = Vertex{1, 2}
	var v2 = Vertex{X: 1}
	v3 := Vertex{}
	p = &Vertex{1, 2}

	fmt.Printf("  v1=%v p=%v v2=%v v3=%v\n", v1, p, v2, v3)
}
