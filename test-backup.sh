#!/usr/bin/env bash
# Simple tests for Linux Backup and Recovery Manager.
set -u
SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
APP="$SCRIPT_DIR/backup-manager"
TEST_DIR="$(mktemp -d)"
trap 'rm -rf "$TEST_DIR"' EXIT

fail() { echo "TEST FAILED: $1"; exit 1; }
pass() { echo "PASS: $1"; }

mkdir -p "$TEST_DIR/source"
printf 'hello from the backup test\n' > "$TEST_DIR/source/example.txt"

"$APP" backup "$TEST_DIR/source" || fail "backup command"
ARCHIVE="$(find "$SCRIPT_DIR/backups" -maxdepth 1 -type f -name 'source_*.tar.gz' -printf '%f\n' | sort | tail -n 1)"
[[ -n "$ARCHIVE" ]] || fail "archive was not created"
pass "backup creates an archive"

"$APP" list | grep -F "$ARCHIVE" >/dev/null || fail "list command"
pass "list displays the archive"

"$APP" verify "$ARCHIVE" >/dev/null || fail "verify command"
pass "checksum verification"

"$APP" restore "$ARCHIVE" "$TEST_DIR/restored" >/dev/null || fail "restore command"
RESTORED="$(find "$TEST_DIR/restored" -type f -name example.txt -print -quit)"
[[ -n "$RESTORED" ]] || fail "restored file missing"
grep -Fx 'hello from the backup test' "$RESTORED" >/dev/null || fail "restored contents incorrect"
pass "restore reproduces the sample file"

if "$APP" backup "$TEST_DIR/no-such-folder" >/dev/null 2>&1; then
    fail "missing directory should return an error"
fi
pass "missing directory is rejected"

echo
echo "All basic tests passed."
echo "Note: test backups are stored in the project's backups/ folder."
