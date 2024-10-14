#!/bin/bash
set -euxo pipefail

poetry run cruft-iai check
poetry run mypy --ignore-missing-imports cruft/
poetry run isort --check --diff cruft/ tests/
poetry run black --check cruft/ tests/
poetry run flake8 cruft/ tests/
