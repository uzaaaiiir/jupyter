# Variables
VENV_DIR = venv
ACTIVATE = $(VENV_DIR)/Scripts/activate

# Default target
.DEFAULT_GOAL := help

# Help
help:
	@echo "Available commands:"
	@echo "  make activate   - Activate virtual environment"
	@echo "  make deactivate - Deactivate virtual environment"
	@echo "  make freeze     - Save dependencies to requirements.txt"
	@echo "  make jupyter    - Run Jupyter Lab"
	@echo "  make notebook   - Run Jupyter Notebook"
	@echo "  make setup      - Setup virtual environment and install dependencies"
	@echo "  make clean      - Remove virtual environment"

# Variables
VENV_DIR = venv
PYTHON = $(VENV_DIR)/Scripts/python
PIP = $(VENV_DIR)/Scripts/pip
JUPYTER = $(VENV_DIR)/Scripts/jupyter

# Default target
.DEFAULT_GOAL := help

# Help
help:
	@echo "Available commands:"
	@echo "  make setup      - Setup virtual environment and install dependencies"
	@echo "  make freeze     - Save dependencies to requirements.txt"
	@echo "  make jupyter    - Run Jupyter Lab"
	@echo "  make notebook   - Run Jupyter Notebook"
	@echo "  make clean      - Remove virtual environment"

	@echo "Activate & deactivate virtual environment"
	@echo "Run venv/Scripts/activate to activate the virtual environment."

# Setup virtual environment and install dependencies
setup:
	@echo "Setting up virtual environment..."
	@if not exist $(VENV_DIR) python -m venv $(VENV_DIR)
	@$(PIP) install -r requirements.txt
	@echo "Setup complete."

# Freeze dependencies to requirements.txt
freeze:
	@echo "Freezing dependencies to requirements.txt..."
	@$(PIP) freeze > requirements.txt
	@echo "Dependencies saved to requirements.txt."

# Run Jupyter Lab
jupyter:
	@echo "Starting Jupyter Lab..."
	@$(JUPYTER) lab

# Run Jupyter Notebook
notebook:
	@echo "Starting Jupyter Notebook..."
	@$(JUPYTER) notebook

# Clean virtual environment
clean: 
	@if exist $(VENV_DIR) rmdir /s /q $(VENV_DIR)
	@echo "Virtual environment removed."
