#!/bin/bash

# Script to clean SQLite directory and prepare for fresh dbt seed and run
# Usage:
#   ./start.sh          - Clean SQLite directory only
#   ./start.sh --init   - Full bootstrap: venv setup, install deps, clean DB, seed

SQLITE_DIR="sqlite"
VENV_DIR=".venv"

clean_sqlite() {
    echo "Cleaning SQLite directory..."
    
    # Remove all files in the sqlite directory
    if [ -d "$SQLITE_DIR" ]; then
        rm -f "$SQLITE_DIR"/*
        echo "Deleted all files in $SQLITE_DIR/"
    else
        echo "Warning: $SQLITE_DIR directory does not exist. Creating it..."
        mkdir -p "$SQLITE_DIR"
    fi
    
    # Initialize empty SQLite database and set to WAL mode
    DB_PATH="$SQLITE_DIR/interview.db"
    echo "Initializing empty database at $DB_PATH..."
    sqlite3 "$DB_PATH" "PRAGMA journal_mode=WAL;"
    echo "Database initialized with WAL mode enabled"
    
    # Run dbt seed
    echo ""
    echo "Running dbt seed..."
    dbt seed
    echo "Seeds loaded"
}

# Check if running in Docker
IS_DOCKER=false
if [ -f /.dockerenv ] || [ -n "$DOCKER_CONTAINER" ]; then
    IS_DOCKER=true
fi

# Check for --init flag
if [ "$1" == "--init" ]; then
    if [ "$IS_DOCKER" = true ]; then
        echo "=== Bootstrapping development environment (Docker) ==="
        echo ""
        echo "Running in Docker - dbt is already installed system-wide"
    else
        echo "=== Bootstrapping development environment ==="
        echo ""
        
        # Deactivate venv if in one
        if [ -n "$VIRTUAL_ENV" ]; then
            echo "Deactivating current virtual environment..."
            deactivate 2>/dev/null || true
            echo "Deactivated"
        fi
        
        # Delete existing .venv directory
        if [ -d "$VENV_DIR" ]; then
            echo "Removing existing $VENV_DIR directory..."
            rm -rf "$VENV_DIR"
            echo "Removed"
        fi
        
        # Create new venv with uv
        echo "Creating new virtual environment with uv..."
        uv venv "$VENV_DIR"
        echo "Virtual environment created"
        
        # Activate the venv (for this script's execution only)
        source "$VENV_DIR/bin/activate"
        
        # Install dbt and sqlite adapter
        echo "Installing dbt and sqlite adapter..."
        uv pip install dbt-core dbt-sqlite
        echo "Installed"
    fi
    
    # Run dbt deps
    echo "Running dbt deps..."
    dbt deps
    echo "Dependencies installed"
    
    # Clean SQLite, initialize, and seed
    echo ""
    clean_sqlite
    
    echo ""
    echo "=== Bootstrap complete! ==="
else
    # Default behavior: clean SQLite and seed
    clean_sqlite
    echo ""
    echo "SQLite directory is now clean and ready for:"
    echo "  dbt run"
fi
