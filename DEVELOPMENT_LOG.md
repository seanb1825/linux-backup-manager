# Linux Backup and Recovery Manager — Development Log

## Day 1 — October 6, 2026
**Focus:** Project planning and setup

I planned a Bash application for backing up directories, listing saved archives, checking backup integrity, and restoring files. I chose command-line arguments and identified the main Linux tools needed, including `tar`, `gzip`, and `sha256sum`.

## Day 2 — October 7, 2026
**Focus:** Backup creation and logging

I planned and began the backup command, including checking that a source directory exists, naming archives with timestamps, creating compressed archives, and recording operations in a log.

## Day 3 — October 8, 2026
**Focus:** Listing, verification, and recovery

I worked on listing saved backups, comparing SHA-256 checksums, and restoring an archive into a destination directory. I also considered how to handle invalid filenames, missing archives, and suspicious archive paths.

## Day 4 — October 9, 2026
**Focus:** Testing and documentation

I planned to test backup creation, listing, checksum verification, restoration, and invalid input, I also prepared usage documentation.
