FC=	g95

PROG=	numerikus
SRCS=	numerikus_felezo.f95 numerikus_prog.f95
OBJS=	${SRCS:S/.f95$/.o/}

all: ${PROG}

$(PROG): ${OBJS}
	${FC} ${OBJS} -o $@

${OBJS}: ${SRCS}
	${FC} ${SRCS} -c

clean:
	-rm ${PROG} *.o core *.core *.mod