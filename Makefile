#!/usr/bin/make -f

## This is the default target, which will be run when `make` is invoked without arguments
default: all

## This target will run both the `fmt` and `build` targets
all: fmt build

## This target will build the project using mdbook
build:
	@mdbook build

## This target will setup the necessary tools for the project
setup:
	@rustup component add rustfmt
	@cargo install mdbook
	@cargo install mdbook-linkcheck
	@brew install markdownlint-cli

## This target will format the markdown files
fmt:
	@markdownlint --fix src/**

## This target will lint the markdown files
lint:
	@markdownlint src/**

.PHONY: default all build setup fmt lint
