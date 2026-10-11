# Linux Backup and Recovery Manager

A Bash command-line project for creating compressed backups, listing saved archives,
checking SHA-256 checksums, restoring files, and viewing an operation log.

## Requirements

- Linux with Bash
- `tar`
- `gzip`
- `sha256sum`
- Common utilities such as `date`, `find`, `awk`, and `du`

On Ubuntu, these are normally available by default.

## Setup

Open a terminal in this folder:

```bash
chmod +x backup-manager test-backup.sh
./backup-manager help
```

The program creates `backups/`, `logs/`, and `checksums/` folders as needed.
It does not normally require `sudo`.

## Commands

```bash
./backup-manager backup ~/Documents
./backup-manager list
./backup-manager verify documents_20261011_120000.tar.gz
./backup-manager restore documents_20261011_120000.tar.gz ~/RestoredFiles
./backup-manager history
./backup-manager help
```

Use the actual archive name printed by the backup command. Backup archives are stored
in this project's `backups/` folder. Restored content is extracted to the destination
directory. The archive contains the source directory itself, so a backup of `notes`
will restore into a `notes/` subdirectory beneath the destination.

## Test

Run:

```bash
./test-backup.sh
```

The test script creates a temporary sample directory and exercises backup, list,
verify, restore, and invalid-source behavior. It creates a test archive in `backups/`;
you can remove that archive and its matching checksum afterward if desired.

## How it works

- `tar` and `gzip` create compressed `.tar.gz` archives.
- A timestamp is included in each archive name.
- `sha256sum` records a checksum when an archive is created.
- `verify` compares the current checksum with the saved checksum and tests the gzip stream.
- `logs/backup.log` records operations and errors.

## Limitations

- This is a small educational project, not a replacement for professional backup software.
- Checksums are stored locally beside the project, so they do not protect against an attacker who can change both the archive and checksum.
- It does not encrypt backups, schedule automatic backups, or store copies off-site.
- Restoring can merge files into an existing directory; review the destination carefully.
- Always test recovery with sample data before trusting backups with important files.

## Project log

See `DEVELOPMENT_LOG.md` for the four-day development plan. Update it with the actual work
and dates as development happens.
