package demo

import (
	"fmt"
	"time"
)

type MyError struct {
	When time.Time
	What string
}

func (e *MyError) Error() string {
	return fmt.Sprintf("at %v, %s", e.When, e.What)
}

func runError() error {
	return &MyError{
		time.Now(),
		"it din't work",
	}
}

type ErrNegativeSqrt float64

func (e ErrNegativeSqrt) Error() string {
	return fmt.Sprintf("cannot Sqrt negative number: %v", float64(e))
}

func Sqrt(x float64) (float64, error) {
	if x < 0 {
		return 0, ErrNegativeSqrt(x)
	}
	return 0, nil
}

func Errors() {
	fmt.Println("Demo Errors")

	if err := runError(); err != nil {
		fmt.Println(" ", err)
	}

	if value, error := Sqrt(-2); error != nil {
		fmt.Println(" ", value, error)
	}
}
