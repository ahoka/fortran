Module Simpson
contains

Function simpson(f, rangemin, rangemax, epsilon)
  Real(Kind=8), Intent(in) :: rangemin, rangemax, epsilon
  Real(Kind=8) :: a, b, i
  Interface
     Function f(x)
       Real(Kind=8) :: x
     End Function f
  End Interface

  a = rangemin
  b = rangemax

  h = (a + b) / 2

  ! maybe make this more parallel friendly
  dx = f(a) + f(b) + 4*f(a + h) + 4*f(b - h)

  do i = a + 2*h, b - 2*h, h
     dx = dx + f(i)
  end do

  simpson = h/2 * dx
  
End Function simpson

End Module Simpson
