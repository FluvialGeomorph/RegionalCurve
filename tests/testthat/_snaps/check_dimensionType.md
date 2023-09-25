# check errors

    Code
      check_dimensionType("Area")
    Error <rlang_error>
      x `dimensionType` must be one of 'area', 'depth', 'width', or 'discharge'.
      i You supplied: Area

---

    Code
      check_dimensionType("height")
    Error <rlang_error>
      x `dimensionType` must be one of 'area', 'depth', 'width', or 'discharge'.
      i You supplied: height

---

    Code
      check_dimensionType(7)
    Error <rlang_error>
      x `dimensionType` must be a character vector.
      i You supplied: numeric

---

    Code
      check_dimensionType(c("area", "Yo Mamma"))
    Error <rlang_error>
      x `dimensionType` must be one of 'area', 'depth', 'width', or 'discharge'.
      i You supplied: Yo Mamma

