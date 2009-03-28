Module Numerikus
Contains

  Function Hurmodszer(f, rangemin, rangemax, epsilon)
    Real(kind=8), Intent(in) :: rangemin, rangemax
    Real(kind=8) :: a, b, x, oldx, epsilon
    Integer :: i
    Interface
       Real(kind=8) Function f(x)
         Real(kind=8), Intent(In) :: x
       End Function f
    End Interface

    a = rangemin
    b = rangemax

    x = (b * f(a) - a * f(b)) / (f(a) - f(b))

    If (f(a) * f(x) < 0.0) Then
       b = x
    Else
       a = x
    End If

    Write(*,*) "1", x

    Do i = 2, 5000
       oldx = x
       x = (b * f(a) - a * f(b)) / (f(a) - f(b))

       If (f(a) * f(x) < 0.0) Then
          b = x
       Else
          a = x
       End If

       Write(*,*) i, x
       If (Abs(x - oldx) <= epsilon) Then
          Exit
       End If
    End Do

    If (i == 5000) Then
       Write(*,*) "A ciklus leallt 5000 iteracio utan,"
       Write(*,*) "a kapott eredmeny pontatlan lehet!"

    End If

    Hurmodszer = x

  End Function Hurmodszer

  Function Felezomodszer(f, rangemin, rangemax, epsilon)
    Implicit None
    Real(kind=8), Intent(in) :: rangemin, rangemax
    Real(kind=8) :: a, b, x, epsilon, Felezomodszer
    Integer :: i, n
    Interface
       Real(kind=8) Function f(x)
         Real(kind=8), Intent(In) :: x
       End Function f
    End Interface

    a = rangemin
    b = rangemax

    If (f(a) * f(b) > 0.0) Then
       Write(*,*) 'fv(a)*fv(b) > 0: Nincs gyoke.'
       Return
    End If

    ! Pontossag eleresehez szukseges iteraciok szama
    n = Ceiling(Log(Abs(b - a) / epsilon)/Log(2.0))

    Do i = 1, n
       x = (a + b) / 2

       If (f(a) * f(x) < 0.0) Then
          b = x
       Else
          a = x
       End If

       Write(*,*) i, x
    End Do

    Felezomodszer = x

  End Function Felezomodszer

End Module Numerikus
