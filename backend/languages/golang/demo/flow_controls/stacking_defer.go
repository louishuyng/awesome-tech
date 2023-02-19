package demo

import "fmt"

func StackingDefer() {
	fmt.Println("Demo Stacking Defer")

	fmt.Println("  counting")

	for i := 0; i < 10; i++ {
		if i == 0 {
			defer fmt.Printf("  i=%v\n", i)
		} else {
			defer fmt.Printf("  i=%v", i)
		}

	}

	fmt.Println("  done")
}
