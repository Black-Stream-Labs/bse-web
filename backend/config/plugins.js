module.exports = ({ env }) => ({
  // ...
// SendMail
  email: {
    provider: 'sendmail',
    settings: {
      defaultFrom: 'john@threebros.design',
      defaultReplyTo: 'john@threebros.design',
    },
  },
// SMTP email
//  email: {
//     provider: 'smtp',
//     providerOptions: {
//       host: 'smtp.gmail.com', //SMTP Host
//       port: 465   , //SMTP Port
//       secure: true,
//       username: 'my.username@gmail.com',
//       password: 'my.password',
//       rejectUnauthorized: true,
//       requireTLS: true,
//       connectionTimeout: 1,
//     },
//     settings: {
//       from: 'my.username@gmail.com',
//       replyTo: 'my.username@gmail.com',
//     },
//   },

// NodeMailer
  // email: {
  //   provider: 'nodemailer',
  //   providerOptions: {
  //     host: env('SMTP_HOST', 'smtp.example.com'),
  //     port: env('SMTP_PORT', 587),
  //     auth: {
  //       user: env('SMTP_USERNAME'),
  //       pass: env('SMTP_PASSWORD'),
  //     },
  //     // ... any custom nodemailer options
  //   },
  //   settings: {
  //     defaultFrom: 'hello@example.com',
  //     defaultReplyTo: 'hello@example.com',
  //   },
  // },
  // ...
});
