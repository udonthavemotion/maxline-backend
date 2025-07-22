# Max Line Bulldogs - Backend

A modern Strapi CMS for managing bulldogs, studs, puppies, and breeding programs with integrated Supabase database and Cloudinary media storage.

## 🚀 Quick Start

### 1. Environment Setup

Copy the example environment file and update with your values:

```bash
# Database - Supabase Direct Connection URI (PREFERRED)
DATABASE_URL=postgresql://postgres:maxlinebulldogs%4012.@db.ktjakhfvyypdrzibxtbj.supabase.co:5432/postgres
DATABASE_CLIENT=postgres
```

> **Note**: The `@` symbol in the password is encoded as `%40` and the final `.` is preserved as required.

### 2. Install Dependencies

```bash
npm install
```

### 3. Run Development Server

```bash
npm run develop
```

## 🗄️ Database Configuration

### Supabase Integration

The project uses **Supabase Direct Connection URI** for optimal performance and Strapi Cloud compatibility:

- **Production**: Uses `DATABASE_URL` connection string with SSL enabled
- **Local Development**: Falls back to individual database variables if needed
- **SSL**: Automatically configured with `rejectUnauthorized: false` for Supabase

### Configuration Priority

1. ✅ **DATABASE_URL** (Direct URI) - Recommended for production
2. 🔄 Individual parameters (`DATABASE_HOST`, `DATABASE_PORT`, etc.) - Fallback

## 📁 Content Types

- **Studs**: Male breeding dogs with DNA, fees, and gallery images
- **Puppies**: Available puppies with status, pricing, and photos
- **Testimonials**: Customer reviews and feedback
- **Homepage**: Dynamic homepage content and hero sections
- **Breeding Program**: Breeding information and gallery

## 🖼️ Media Management

- **Cloudinary Integration**: Unified media storage and optimization
- **Image Uploads**: Automatic processing and CDN delivery
- **Gallery Support**: Multiple images per stud/puppy

## 🔐 API Access

- **Admin Panel**: Full CMS access at `http://localhost:1337/admin`
- **API Endpoints**: RESTful API at `http://localhost:1337/api/`
- **Public Token**: Read-only access for frontend integration

## 🌐 Deployment

### Strapi Cloud Ready

The configuration is optimized for Strapi Cloud deployment:

- ✅ Supabase Direct URI connection
- ✅ SSL/TLS compatibility  
- ✅ Environment variable support
- ✅ Media upload integration

### Environment Variables Required

```bash
DATABASE_URL=postgresql://postgres:password@host:5432/postgres
DATABASE_CLIENT=postgres
CLOUDINARY_NAME=your_cloud_name
CLOUDINARY_KEY=your_api_key  
CLOUDINARY_SECRET=your_api_secret
APP_KEYS=your_app_keys
JWT_SECRET=your_jwt_secret
```

## 📊 Database Management

### Backup & Restore

```bash
# Create backup
npm run backup:create

# Restore from backup  
npm run backup:restore
```

### Migration

For switching from individual database parameters to Direct Connection URI, see `SUPABASE_MIGRATION_GUIDE.md`.

## 🔧 Development

### Scripts

```bash
npm run develop      # Development with hot reload
npm run start        # Production mode
npm run build        # Build admin panel
npm run strapi       # Strapi CLI commands
```

### API Testing

Access the API documentation at:
- REST API: `http://localhost:1337/api/`
- Admin: `http://localhost:1337/admin`

---

**For detailed Supabase setup and migration instructions, see `SUPABASE_MIGRATION_GUIDE.md`**
