# Executables
BIN := node_modules/.bin
DUO := $(BIN)/duo
MYTH := $(BIN)/myth

# Source wildcards
CSS = reset.css

# Default
all: build/reset.css

# Create the build directory.
build: 
	@mkdir -p $@

build/reset.css: $(CSS) node_modules build
	@$(DUO) $< | $(MYTH) > $@


# Install npm dependencies and ensure mtime is updated.
node_modules: package.json
	@npm install
	@touch $@

# Cleanup previous build
clean:
	rm -rf build components

.PHONY: all clean