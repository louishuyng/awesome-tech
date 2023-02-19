package main

import (
	basic "BackendGolang/demo/basic"
	flow_controls "BackendGolang/demo/flow_controls"
	mai "BackendGolang/demo/methods_and_interfaces"
	more_types "BackendGolang/demo/more_types"
	"fmt"
)

func main() {
	fmt.Println("Welcome to the playgrond!")

	basic.Packages()
	basic.Functions()
	basic.NameReturnValues()
	basic.Variables()
	basic.ShortVariableDeclarations()
	basic.BasicTypes()
	basic.ZeroValues()
	basic.TypeConversions()
	basic.Constants()
	basic.Constants()
	basic.NumericConstants()

	flow_controls.For()
	flow_controls.If()
	flow_controls.Switch()
	flow_controls.Defer()
	flow_controls.StackingDefer()

	more_types.Pointers()
	more_types.Struct()
	more_types.Arrays()
	more_types.Slices()
	more_types.Range()
	more_types.Maps()
	more_types.FunctionValues()
	more_types.FunctionClosures()

	mai.Methods()
	mai.PointerReceiver()
	mai.Interfaces()
	mai.InterfaceValues()
	mai.EmptyInterface()
	mai.TypeAssertions()
	mai.TypeSwitches()
	mai.Stringers()
	mai.Errors()
}
