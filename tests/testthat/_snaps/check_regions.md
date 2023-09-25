# check errors

    Code
      check_regions("Foo")
    Error <rlang_error>
      x Region 'Foo' is not in `regional_curve$region_name`.
      i Run `levels(RegionalCurves::regional_curves()$region_name)` for a list of valid regions.

---

    Code
      check_regions("Bar")
    Error <rlang_error>
      x Region 'Bar' is not in `regional_curve$region_name`.
      i Run `levels(RegionalCurves::regional_curves()$region_name)` for a list of valid regions.

---

    Code
      check_regions(c("Bar", "Foo"))
    Error <rlang_error>
      x Regions 'Bar and Foo' are not in `regional_curve$region_name`.
      i Run `levels(RegionalCurves::regional_curves()$region_name)` for a list of valid regions.

---

    Code
      check_regions(c("Bar", "Foo", "USA"))
    Error <rlang_error>
      x Regions 'Bar and Foo' are not in `regional_curve$region_name`.
      i Run `levels(RegionalCurves::regional_curves()$region_name)` for a list of valid regions.

---

    Code
      check_regions(7)
    Error <rlang_error>
      x `regions` must be a character vector.

