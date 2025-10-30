#!/usr/bin/env bash

# Populate Code/Codex config files by rendering their templates with secrets
# defined in ~/.bashrc. This script restores $VARIABLE placeholders in the
# TOML templates using the exported environment values before launching the
# CLIs.

set -euo pipefail

readonly VAR_NAMES=(
  CONTEXT7_API_KEY
  GITHUB_PERSONAL_ACCESS_TOKEN
)

get_bashrc_var() {
  local name="$1"
  local value

  value=$(/bin/bash -lc 'export PS1=dummy; source ~/.bashrc >/dev/null 2>&1; printf "%s" "${!1}"' bash "$name")

  if [[ -z "${value}" ]]; then
    printf 'Error: %s is not set in ~/.bashrc\n' "$name" >&2
    exit 1
  fi

  printf '%s' "$value"
}

if ! command -v envsubst >/dev/null 2>&1; then
  echo 'Error: envsubst is required but not installed.' >&2
  exit 1
fi

declare -A VAR_VALUES=()
for name in "${VAR_NAMES[@]}"; do
  VAR_VALUES["$name"]=$(get_bashrc_var "$name")
done

readonly TEMPLATE_TARGETS=(
  "$HOME/.code/config.template.toml:$HOME/.code/config.toml"
  "$HOME/.codex/config.template.toml:$HOME/.codex/config.toml"
)

for pair in "${TEMPLATE_TARGETS[@]}"; do
  IFS=':' read -r template target <<<"$pair"

  if [[ ! -f "$template" ]]; then
    printf 'Error: template not found: %s\n' "$template" >&2
    exit 1
  fi

  mkdir -p "$(dirname "$target")"

  CONTEXT7_API_KEY="${VAR_VALUES[CONTEXT7_API_KEY]}" \
  GITHUB_PERSONAL_ACCESS_TOKEN="${VAR_VALUES[GITHUB_PERSONAL_ACCESS_TOKEN]}" \
    envsubst '${CONTEXT7_API_KEY} ${GITHUB_PERSONAL_ACCESS_TOKEN}' < "$template" > "$target"

  printf 'Wrote %s\n' "$target"
done
