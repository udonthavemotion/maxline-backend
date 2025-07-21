# Database Management Guide

## Issue Resolution: Missing Previous Entries

### What Happened
When you cloned the repository, Strapi created a fresh, empty database instead of using your previous data because:

1. **Database files are not tracked in Git** (excluded by `.gitignore`)
2. **No specific database configuration** in `.env` file
3. **Strapi defaults to `.tmp/data.db`** which gets recreated on each fresh clone

### Solution Applied
✅ **Restored your data**: Copied `strapi_backup_20250720_120401.db` to `.tmp/data.db`

## Database Files Overview

| File | Size | Purpose | Location |
|------|------|---------|----------|
| `.tmp/data.db` | 1.5MB | **Current active database** | `maxline-backend/.tmp/` |
| `strapi_backup_20250720_120401.db` | 1.5MB | **Latest backup** | `maxline-backend/` |
| `strapi_backup_20250719_222609.db` | 1.4MB | **Previous backup** | `database backup/` |

## Backup Management

### Using the Backup Script

```powershell
# List all available backups
.\backup-database.ps1 list

# Create a new backup (auto-named with timestamp)
.\backup-database.ps1 backup

# Create a backup with custom name
.\backup-database.ps1 backup "my-custom-backup.db"

# Restore from a specific backup
.\backup-database.ps1 restore "strapi_backup_20250720_120401.db"
```

### Manual Backup Process

```powershell
# Backup current database
Copy-Item ".tmp/data.db" "../database backup/strapi_backup_$(Get-Date -Format 'yyyyMMdd_HHmmss').db"

# Restore from backup
Copy-Item "strapi_backup_20250720_120401.db" ".tmp/data.db" -Force
```

## Preventing Future Issues

### Option 1: Configure Database Path (Recommended)

Add to your `.env` file:
```env
DATABASE_FILENAME=strapi_backup_20250720_120401.db
```

This tells Strapi to use your backup file directly instead of creating a new one.

### Option 2: Regular Backup Schedule

1. **Before major changes**: Always backup your database
2. **After adding content**: Create a backup
3. **Before switching machines**: Backup and transfer the file

### Option 3: Database in Repository (Advanced)

If you want to track the database in Git (not recommended for production):

1. Remove `.tmp` and `*.sqlite` from `.gitignore`
2. Commit your database file
3. **Warning**: This can cause merge conflicts and security issues

## Best Practices

### ✅ Do This
- **Regular backups**: Use the backup script before making changes
- **Test restores**: Verify your backups work
- **Document changes**: Note what content you've added
- **Use meaningful names**: Include dates in backup filenames

### ❌ Don't Do This
- **Delete backups**: Keep multiple versions
- **Ignore database size**: Large files indicate more content
- **Skip backups**: Always backup before major changes
- **Share database files**: They contain sensitive admin data

## Troubleshooting

### "Database is empty after clone"
1. Check if backup files exist
2. Restore using: `.\backup-database.ps1 restore "latest-backup.db"`
3. Verify file sizes match

### "Can't access admin panel"
1. Ensure database file exists in `.tmp/data.db`
2. Check file permissions
3. Restart Strapi: `npm run develop`

### "Content missing after update"
1. Check backup timestamps
2. Restore from most recent backup
3. Verify backup file integrity

## File Locations

```
maxlinebulldogs.com 721/
├── database backup/           # Backup storage
│   └── strapi_backup_*.db
├── maxline-backend/
│   ├── .tmp/
│   │   └── data.db           # Current active database
│   ├── strapi_backup_*.db    # Additional backups
│   ├── backup-database.ps1   # Backup script
│   └── .env                  # Environment configuration
```

## Next Steps

1. **Test your admin panel** - Verify all your previous entries are restored
2. **Create a new backup** - Use the script to save current state
3. **Configure database path** - Add `DATABASE_FILENAME` to `.env` if desired
4. **Set up regular backups** - Schedule automatic backups

Your data should now be restored and you can continue where you left off! 🎉 