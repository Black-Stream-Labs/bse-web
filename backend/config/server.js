const forgotPasswordTemplate = require("./email-templates/forgot-password");

module.exports = ({ env }) => ({
  host: env("HOST", "0.0.0.0"),
  port: env.int("PORT", 1337),
  admin: {
    auth: {
      secret: env("ADMIN_JWT_SECRET", "d87bc7b707e44628a53382d4af1fd320"),
      url: "/dashboard",
    },
    forgotPassword: {
      from: "support@blackstreameducation.co.uk",
      replyTo: "support@blackstreameducation.co.uk",
      emailTemplate: forgotPasswordTemplate,
    },
  },
});
