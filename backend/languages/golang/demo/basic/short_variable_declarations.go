package demo

import "fmt"

func ShortVariableDeclarations() {
	var i, j int = 1, 2
	k := 3

	c, python, java := true, false, "no!"

	fmt.Printf("Demo ShortVariableDeclarations i=%v j=%v k=%v c=%v python=%v java=%v \n", i, j, k, c, python, java)
}
