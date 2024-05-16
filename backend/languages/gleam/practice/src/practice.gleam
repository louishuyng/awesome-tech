import basic/assignments
import basic/blocks
import basic/constants
import basic/float
import basic/int
import basic/list
import basic/number_format
import basic/string

import function/anonymous_functions
import function/deprecations
import function/documentation_comments
import function/function_captures
import function/functions
import function/generic_functions
import function/high_order_functions
import function/labelled_arguments
import function/pipelines

import flow_control/alternative_patterns
import flow_control/case_expression
import flow_control/guards
import flow_control/list_patterns
import flow_control/list_recursion
import flow_control/multiple_subjects
import flow_control/pattern_aliases
import flow_control/recursion
import flow_control/string_patterns
import flow_control/tail_calls
import flow_control/variable_patterns

import data_types/bit_arrays
import data_types/custom_types
import data_types/generic_custom_types
import data_types/nil
import data_types/record_accessors
import data_types/record_updates
import data_types/records
import data_types/results
import data_types/tuples

import standard_library/dict_module
import standard_library/list_module
import standard_library/option_module
import standard_library/result_module

import gleam/io

pub fn main() {
  io.println("Hello from practice!")
  // === Basic ===
  // string.main()
  // int.main()
  // float.main()
  // number_format.main()
  // assignments.main()
  // blocks.main()
  // list.main()
  // constants.main()

  // === Function ===
  // functions.main()
  // high_order_functions.main()
  // anonymous_functions.main()
  // function_captures.main()
  // generic_functions.main()
  // pipelines.main()
  // labelled_arguments.main()
  // deprecations.main()

  // === Flow Control ===
  // case_expression.main()
  // variable_patterns.main()
  // string_patterns.main()
  // list_patterns.main()
  // recursion.main()
  // tail_calls.main()
  // list_patterns.main()
  // multiple_subjects.main()
  // alternative_patterns.main()
  // pattern_aliases.main()
  // guards.main()

  // === Data Types ===
  // tuples.main()
  // custom_types.main()
  // records.main()
  // record_accessors.main()
  // record_updates.main()
  // io.debug(generic_custom_types.name)
  // io.debug(generic_custom_types.level)
  // nil.main()
  // results.main()
  // bit_arrays.main()

  // === Standard Library ===
  // list_module.main()
  // result_module.main()
  // dict_module.main()
  // option_module.main()
}
