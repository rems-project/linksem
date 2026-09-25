# Claude: this Makefile is written by Claude (25 September 2026).
# Regenerate linksem's src/generated_arm64_cpucaps.lem from the kernel's cpucaps list.
LINUX_DIR = ../../../re-linux
CPUCAPS   = $(LINUX_DIR)/arch/arm64/tools/cpucaps
TARGET    = ../../src/generated_arm64_cpucaps.lem
SOURCE    = $(shell cd $(LINUX_DIR) && git describe --always --dirty 2>/dev/null || echo unknown)

$(TARGET): $(CPUCAPS) gen-arm64-cpucaps-for-lem.awk
	awk -f gen-arm64-cpucaps-for-lem.awk -v source="re-linux $(SOURCE), arch/arm64/tools/cpucaps" $(CPUCAPS) > $@

all: $(TARGET)
.PHONY: all
