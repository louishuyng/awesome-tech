package demo

import "fmt"

const (
	Big   = 1 << 100
	Small = Big >> 99
)

func needInt(x int) int           { return x*10 + 1 }
func needFloat(x float64) float64 { return x * 0.1 }

func NumericConstants() {
	fmt.Println("Demo Numeric Constants")
	fmt.Printf("  Small Int: %v\n", needInt(Small))
	fmt.Printf("  Small Float: %v\n", needFloat(Small))
	fmt.Printf("  Big Float: %v\n", needFloat(Big))
}
