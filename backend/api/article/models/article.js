"use strict";
// const slugify = require("slugify");
/**
 * Read the documentation (https://strapi.io/documentation/developer-docs/latest/development/backend-customization.html#lifecycle-hooks)
 * to customize this model
 */

// const getUniqueSlug = async (title, num = 0) => {
//   let input = `${title}`;
//   if (num > 0) {
//     input = `${title}-${num}`;
//   }
//   const slug = slugify(input, {
//     lower: true,
//   });
//   const [article] = await strapi.services.article.find({
//     slug: slug,
//   });
//   if (!article) {
//     return slug;
//   } else {
//     return getUniqueSlug(title, num + 1);
//   }
// };

module.exports = {
  // lifecycles: {
  //   async beforeCreate(data) {
  //     if (data.title) {
  //       data.slug = await getUniqueSlug(data.title);
  //     }
  //   },
  //   async beforeUpdate(params, data) {
  //     if (data.title) {
  //       data.slug = await getUniqueSlug(data.title);
  //     }
  //   },
  // },
};
