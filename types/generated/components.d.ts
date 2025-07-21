import type { Schema, Struct } from '@strapi/strapi';

export interface TextStats extends Struct.ComponentSchema {
  collectionName: 'components_text_stats';
  info: {
    displayName: 'stats';
    icon: 'briefcase';
  };
  attributes: {
    label: Schema.Attribute.String;
    text: Schema.Attribute.String;
  };
}

declare module '@strapi/strapi' {
  export module Public {
    export interface ComponentSchemas {
      'text.stats': TextStats;
    }
  }
}
