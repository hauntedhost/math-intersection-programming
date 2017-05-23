fun doFac(0, f) = f
  | doFac(n, f) = doFac(n - 1, f * n)

fun fac(n) = doFac(n, 1)
