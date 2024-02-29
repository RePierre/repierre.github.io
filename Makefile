# Variables
VENV           = $(HOME)/.venv/nikola
VENV_BIN       = $(VENV)/bin
VENV_PYTHON    = $(VENV_BIN)/python

# Recipes

# Run nikola auto
.PHONY: auto
auto:
	$(VENV_PYTHON) $(VENV_BIN)/nikola auto;
