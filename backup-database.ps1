# Max Line Bulldogs Database Backup Script
# This script helps manage database backups and restores

param(
    [string]$Action = "backup",
    [string]$BackupName = ""
)

$DatabasePath = ".tmp/data.db"
$BackupDir = "../database backup"

# Create backup directory if it doesn't exist
if (!(Test-Path $BackupDir)) {
    New-Item -ItemType Directory -Path $BackupDir -Force
}

switch ($Action.ToLower()) {
    "backup" {
        if ([string]::IsNullOrEmpty($BackupName)) {
            $timestamp = Get-Date -Format "yyyyMMdd_HHmmss"
            $BackupName = "strapi_backup_$timestamp.db"
        }
        
        $BackupPath = Join-Path $BackupDir $BackupName
        
        if (Test-Path $DatabasePath) {
            Copy-Item $DatabasePath $BackupPath -Force
            Write-Host "✅ Database backed up to: $BackupPath" -ForegroundColor Green
        } else {
            Write-Host "❌ Database file not found at: $DatabasePath" -ForegroundColor Red
        }
    }
    
    "restore" {
        if ([string]::IsNullOrEmpty($BackupName)) {
            Write-Host "❌ Please specify a backup file name" -ForegroundColor Red
            exit 1
        }
        
        $BackupPath = Join-Path $BackupDir $BackupName
        
        if (Test-Path $BackupPath) {
            Copy-Item $BackupPath $DatabasePath -Force
            Write-Host "✅ Database restored from: $BackupPath" -ForegroundColor Green
        } else {
            Write-Host "❌ Backup file not found: $BackupPath" -ForegroundColor Red
        }
    }
    
    "list" {
        Write-Host "📋 Available backups:" -ForegroundColor Cyan
        Get-ChildItem $BackupDir -Filter "*.db" | ForEach-Object {
            $size = [math]::Round($_.Length / 1MB, 2)
            Write-Host "  📁 $($_.Name) ($size MB) - $($_.LastWriteTime)" -ForegroundColor Yellow
        }
    }
    
    default {
        Write-Host "Usage:" -ForegroundColor Cyan
        Write-Host "  .\backup-database.ps1 backup [filename]" -ForegroundColor White
        Write-Host "  .\backup-database.ps1 restore filename" -ForegroundColor White
        Write-Host "  .\backup-database.ps1 list" -ForegroundColor White
    }
} 