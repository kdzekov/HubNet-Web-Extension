ifeq ($(origin NETLOGO), undefined)
  NETLOGO=../..
endif

ifeq ($(origin SCALA_HOME), undefined)
  SCALA_HOME=../..
endif

SRCS=$(wildcard src/main/scala/*.scala)

hubnet-web.jar: $(SRCS) manifests/web.txt Makefile
	./bin/sbt compile
	jar cmf manifests/web.txt hubnet-web.jar -C target/scala-2.9.1.final/classes/ .