# Variables
VENV           = $(HOME)/.venv/nikola
VENV_BIN       = $(VENV)/bin
VENV_PYTHON    = $(VENV_BIN)/python
VENV_PIP       = $(VENV_BIN)/pip

# Recipes

# Define the default recipe
default: auto ;

# Make the virtual environment
.PHONY:	 venv
venv:
	rm -rf "$(VENV)";
	mkdir -p $(HOME)/.venv/;
	python -m venv $(VENV);
	$(VENV_PIP) install -U pip setuptools wheel;
	$(VENV_PIP) install -U "Nikola[extras]";

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

.PHONY: clean
clean:
	$(VENV_PYTHON) $(VENV_BIN)/nikola clean;
