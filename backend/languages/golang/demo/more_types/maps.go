package demo

import "fmt"

func Maps() {
	type Vertex struct {
		Lat, Long float64
	}

	fmt.Println("Demo Maps")

	var m map[string]Vertex

	m = make(map[string]Vertex)
	m["Bell Labs"] = Vertex{
		40.68433, -74.39967,
	}

	fmt.Printf("  %v\n", m["Bell Labs"])

	fmt.Println("Demo Maps literals")

	m = map[string]Vertex{
		"Bell Labs": {
			40.68433, -74.39967,
		},
		"Google": {
			37.42202, -122.08408,
		},
	}

	fmt.Printf("  %v\n", m)

	fmt.Println("Demo Mutating Maps")

	h := make(map[string]int)

	h["Answer"] = 42
	fmt.Println("  The value:", h["Answer"])

	delete(h, "Answer")
	fmt.Println("  The value:", h["Answer"])

	elem, ok := h["Answer"]
	fmt.Println("  The value:", elem, "Present?", ok)
}
