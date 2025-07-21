export default ({ env }) => ({
  upload: {
    config: {
      provider: 'cloudinary', // Always use Cloudinary (both local and production)
      providerOptions: {
        cloud_name: env('CLOUDINARY_NAME'),
        api_key: env('CLOUDINARY_KEY'),
        api_secret: env('CLOUDINARY_SECRET'),
      },
      actionOptions: {
        upload: {
          resource_type: 'auto', // Allow videos
        },
        uploadStream: {
          resource_type: 'auto',
        },
        delete: {},
      },
    },
  },
});
