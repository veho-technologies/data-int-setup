# dbt Interview Project

This project uses dbt (data build tool) with SQLite for data transformation.

## Quick Start (Recommended - ~2 minutes)

### Option 1: Local Setup in a virtual environment. (Fastest setup)

If you prefer to run without docker, make alone should get you what you need:

```bash
# Check and install dependencies
make check-deps  # Will show what's missing

# Bootstrap the project
make init

# Activate the virtual environment
source .venv/bin/activate

# Now you can use dbt directly
dbt run
dbt test
```

### Option 2: Docker (Most isolated)

**Check if you already have Docker installed:**

```bash
docker --version && docker-compose --version
```

If both commands work, you're ready to go! Skip to the usage instructions below.

**If you don't have Docker installed:**

**macOS:**

1. **You have `docker` but not `docker-compose`:**

   - Install docker-compose: `brew install docker-compose`

2. **You have neither `docker` nor `docker-compose`:**
   - Install Rancher Desktop (open source, no account required):
     - `brew install --cask rancher`
     - Or download DMG from [Rancher Desktop releases](https://github.com/rancher-sandbox/rancher-desktop/releases)
   - Launch Rancher Desktop from Applications
   - Add `~/.rd/bin` to your PATH:
     - **zsh**: `echo 'export PATH="$HOME/.rd/bin:$PATH"' >> ~/.zshrc && source ~/.zshrc`
     - **bash**: `echo 'export PATH="$HOME/.rd/bin:$PATH"' >> ~/.bash_profile && source ~/.bash_profile`
   - Includes `docker` and `docker-compose` - works exactly like Docker Desktop

**Linux:**

- `sudo apt-get install docker.io docker-compose` (or your distro's equivalent)

**Once Docker is installed, this is the fastest way to get started:**

```bash
# Start the container (first time builds image, subsequent times are instant)
make docker

# Inside the container, initialize the database
make clean

# Run your dbt models
dbt run
```

---

## Typical Workflow

### Docker Workflow

```bash
# Start interactive container (first time builds image, subsequent times are instant)
make docker

# Inside container (dependencies already installed, no need for a venv in a container):
make clean                    # Initialize/reset database
dbt run                       # Run all models
dbt run --select <model_name> # Run specific model
dbt test                       # Run tests
```

### Local Workflow

```bash
# First time setup
make init

# Regular development
source .venv/bin/activate      # activate the venv
make clean                     # Reset database and reload seeds (or: bin/start.sh)
dbt run                        # Run your dbt models
dbt run --select <model_name>  # Run specific model
dbt test                       # Run tests

# Note: make run, make test, etc. also work if you prefer
```
