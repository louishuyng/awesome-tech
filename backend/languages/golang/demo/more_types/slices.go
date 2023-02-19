package demo

import (
	"fmt"
	"strings"
)

func printSlice(s []int) {
	fmt.Printf("  len=%d cap=%d %v\n", len(s), cap(s), s)
}

func printSliceInfo(s string, x []int) {
	fmt.Printf("  %s len=%d cap=%d %v\n",
		s, len(x), cap(x), x)
}

func Slices() {
	fmt.Println("Demo Slices")

	primies := [6]int{2, 3, 5, 7, 11, 13}

	var s []int = primies[1:4]

	fmt.Printf("  s=%v\n", s)

	fmt.Println("Demo Slices reference to array")

	names := [4]string{
		"John",
		"Paul",
		"George",
		"Ringo",
	}
	fmt.Printf("  names=%v\n", names)
	a := names[0:2]
	b := names[1:3]
	fmt.Printf("  a=%v\n", a)
	fmt.Printf("  b=%v \n", b)

	b[0] = "XXX"
	fmt.Println("b[0] = 'XXX'")
	fmt.Printf("  a=%v\n", a)
	fmt.Printf("  b=%v \n", b)
	fmt.Printf("  names=%v\n", names)

	fmt.Println("Demo Slices literals")
	q := []int{2, 3, 5, 7, 11, 13}
	fmt.Printf("  q=%v\n", q)

	h := []struct {
		i int
		b bool
	}{
		{2, true},
		{3, true},
		{4, false},
	}

	fmt.Printf("  h=%v\n", h)

	fmt.Println("Demo Slices defaults")
	k := []int{2, 3, 5, 7, 11, 13}

	k = k[1:4]
	fmt.Printf("  k=%v\n", k)

	k = k[:2]
	fmt.Printf("  k=%v\n", k)

	k = k[1:]
	fmt.Printf("  k=%v\n", k)

	fmt.Println("Demo Slices length and capacity")
	k = []int{2, 3, 5, 7, 11, 13}
	printSlice(k)
	// Slice the slice to give it zero length.
	k = k[:0]
	printSlice(k)

	// Extend its length.
	k = k[:4]
	printSlice(k)

	// Drop its first two values.
	k = k[2:]
	printSlice(k)

	fmt.Println("Demo Nil slices")
	var t []int
	printSlice(t)
	if t == nil {
		fmt.Println("  t slice is nil!")
	}

	fmt.Println("Demo Creating a slice with make")
	p := make([]int, 5)
	printSliceInfo("p", p)

	l := make([]int, 0, 5)
	printSliceInfo("l", l)

	c := l[:2]
	printSliceInfo("c", c)

	d := c[2:5]
	printSliceInfo("d", d)

	fmt.Println("Demo Slices of slices")
	// Create a tic-tac-toe board.
	board := [][]string{
		{"_", "_", "_"},
		{"_", "_", "_"},
		{"_", "_", "_"},
	}

	// The players take turns.
	board[0][0] = "X"
	board[2][2] = "O"
	board[1][2] = "X"
	board[1][0] = "O"
	board[0][2] = "X"

	for i := 0; i < len(board); i++ {
		fmt.Printf("  %s\n", strings.Join(board[i], " "))
	}

	fmt.Println("Demo Appending to a slice")
	var n []int
	printSlice(n)

	// append works on nil slices.
	n = append(n, 0)
	printSlice(n)

	// The slice grows as needed.
	n = append(n, 1)
	printSlice(n)

	// We can add more than one element at a time.
	n = append(n, 2, 3, 4)
	printSlice(n)
}
