# Export Data Script for Supabase Migration
# This script exports your current SQLite data to JSON format

Write-Host "🔄 Starting data export process..." -ForegroundColor Green

# Check if export directory exists, create if not
if (!(Test-Path ".\export")) {
    New-Item -ItemType Directory -Path ".\export"
    Write-Host "✅ Created export directory" -ForegroundColor Green
}

# Install the import-export plugin if not already installed
Write-Host "📦 Installing Strapi import-export plugin..." -ForegroundColor Yellow
npm install strapi-plugin-import-export-entries

# Export the data
Write-Host "📤 Exporting data to JSON..." -ForegroundColor Yellow
npx strapi export --no-encrypt --file .\export\data.json --bypass-dependencies

if ($LASTEXITCODE -eq 0) {
    Write-Host "✅ Data exported successfully to .\export\data.json" -ForegroundColor Green
    Write-Host "📊 You can now proceed with Supabase migration" -ForegroundColor Cyan
} else {
    Write-Host "❌ Export failed. Make sure Strapi is not running and try again." -ForegroundColor Red
    Write-Host "💡 Try running 'npm run develop' first to ensure all dependencies are installed." -ForegroundColor Yellow
}

Write-Host ""
Write-Host "Next steps:" -ForegroundColor Cyan
Write-Host "1. Update your .env file with Supabase credentials" -ForegroundColor White
Write-Host "2. Run 'npm run develop' to create tables in Supabase" -ForegroundColor White
Write-Host "3. Run 'npx strapi import --file .\export\data.json' to import data" -ForegroundColor White 