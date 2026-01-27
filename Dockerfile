FROM python:3.11-slim

# Install system dependencies
RUN apt-get update && apt-get install -y \
    sqlite3 \
    make \
    git \
    && rm -rf /var/lib/apt/lists/*

# Install uv for fast Python package management
RUN pip install --no-cache-dir uv

# Set working directory
WORKDIR /app

# Copy project files
COPY dbt_project.yml profiles.yml Makefile ./
COPY models/ ./models/
COPY seeds/ ./seeds/
COPY macros/ ./macros/
COPY tests/ ./tests/
COPY bin/ ./bin/

# Copy packages.yml if it exists
COPY packages.yml* ./

# Create sqlite directory
RUN mkdir -p sqlite

# Install dbt dependencies
RUN uv pip install --system dbt-core dbt-sqlite

# Run dbt deps to install package dependencies (if packages.yml exists)
RUN dbt deps || true

# Make bin scripts executable
RUN chmod +x bin/start.sh

# Default command
CMD ["/bin/bash"]
