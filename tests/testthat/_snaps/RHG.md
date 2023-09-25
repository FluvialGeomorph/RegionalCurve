# check errors

    Code
      RHG(1, 1, "depth")
    Error <rlang_error>
      x `regions` must be a character vector.

---

    Code
      RHG("MA", "Yo Mamma", "depth")
    Error <rlang_error>
      x `drainageArea` must be a numeric vector.

---

    Code
      RHG("MA", 1, 1)
    Error <rlang_error>
      x `dimensionType` must be a character vector.
      i You supplied: numeric

---

    Code
      RHG("Yo Mamma", 1, "depth")
    Error <rlang_error>
      x Region 'Yo Mamma' is not in `regional_curve$region_name`.
      i Run `levels(RegionalCurves::regional_curves()$region_name)` for a list of valid regions.

---

    Code
      RHG("MA", 1, "Yo Mamma")
    Error <rlang_error>
      x `dimensionType` must be one of 'area', 'depth', 'width', or 'discharge'.
      i You supplied: Yo Mamma

---

    Code
      RHG(c("MA", "Yo Mamma"), c(1, 1), c("depth", "depth"))
    Error <rlang_error>
      x Region 'Yo Mamma' is not in `regional_curve$region_name`.
      i Run `levels(RegionalCurves::regional_curves()$region_name)` for a list of valid regions.

---

    Code
      RHG(c("MA", "MA"), c(1, 1), c("depth", "Yo Mamma"))
    Error <rlang_error>
      x `dimensionType` must be one of 'area', 'depth', 'width', or 'discharge'.
      i You supplied: Yo Mamma

---

    Code
      RHG(c("MA", "MA"), 1, "depth")
    Error <rlang_error>
      x Arguments are not of matching length.
      i `region`: 2
      i `drainageArea`: 1
      i `dimensionType`: 1

---

    Code
      RHG("MA", c(1, 1), "depth")
    Error <rlang_error>
      x Arguments are not of matching length.
      i `region`: 1
      i `drainageArea`: 2
      i `dimensionType`: 1

---

    Code
      RHG("MA", 1, c("depth", "depth"))
    Error <rlang_error>
      x Arguments are not of matching length.
      i `region`: 1
      i `drainageArea`: 1
      i `dimensionType`: 2

