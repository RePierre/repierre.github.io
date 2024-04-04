# Variables
VENV           = $(HOME)/.venv/nikola
VENV_BIN       = $(VENV)/bin
VENV_PYTHON    = $(VENV_BIN)/python

# Recipes

# Define the default recipe
.PHONY: default
default: auto ;

# Run nikola auto
.PHONY: auto
auto:
	$(VENV_PYTHON) $(VENV_BIN)/nikola auto;

# Run nikola build
.PHONY: build
build:
	$(VENV_PYTHON) $(VENV_BIN)/nikola build;

# Run nikola serve
.PHONY: serve
serve: build
	$(VENV_PYTHON) $(VENV_BIN)/nikola serve;


# Run nikola github_deploy
.PHONY: deploy
deploy: build
	$(VENV_PYTHON) $(VENV_BIN)/nikola github_deploy;
