# Linux Backup and Recovery Manager — Development Log

**Note:** These are planned entries. Update the dates, times, and descriptions to match the work actually completed.

## Day 1 — October 11, 2026
**Planned time:** 10:00 AM – 11:00 AM  
**Focus:** Project planning and setup

I planned a Bash application for backing up directories, listing saved archives, checking backup integrity, and restoring files. I chose command-line arguments and identified the main Linux tools needed, including `tar`, `gzip`, and `sha256sum`. I also planned the project folder structure.

## Day 2 — October 12, 2026
**Planned time:** 4:00 PM – 5:30 PM  
**Focus:** Backup creation and logging

I planned and began the backup command, including checking that a source directory exists, naming archives with timestamps, creating compressed archives, and recording operations in a log.

## Day 3 — October 14, 2026
**Planned time:** 3:30 PM – 5:00 PM  
**Focus:** Listing, verification, and recovery

I worked on listing saved backups, comparing SHA-256 checksums, and restoring an archive into a destination directory. I also considered how to handle invalid filenames, missing archives, and suspicious archive paths.

## Day 4 — October 15, 2026
**Planned time:** 5:00 PM – 6:30 PM  
**Focus:** Testing and documentation

I planned to test backup creation, listing, checksum verification, restoration, and invalid input. I also prepared usage documentation and a recording walkthrough to demonstrate the program operating in Linux.
