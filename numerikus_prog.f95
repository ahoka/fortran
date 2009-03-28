Module fuggvenyek
contains

  Function fv1(x)
    Implicit None
    Real(kind=8) :: fv1, x

    fv1 = x**3 - 27

  End Function fv1

  Function fv2(x)
    Implicit None
    Real(kind=8) :: fv2, x

    fv2 = x**2 - 4

  End Function fv2

End Module fuggvenyek

Program Gyokkereses
  Use Numerikus
  Use fuggvenyek
  Implicit none

  Real(kind=8) :: a, b, r1, r2
  Integer :: n

  a = 1.0
  b = 6.0

  r2 = hurmodszer(fv2, a, b, 1E-6_8)
  r1 = felezomodszer(fv2, a, b, 1E-6_8)

End Program Gyokkereses
