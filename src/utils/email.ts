import { createTransport } from "nodemailer";
import { MAIL_EMAIL, MAIL_PASSWORD } from "./config";

const MAIL_SETTINGS = {
  service: "gmail",
  auth: {
    user: MAIL_EMAIL,
    pass: MAIL_PASSWORD,
  },
};

export default async function sendEmail(email: string, otp: string) {
  const transporter = createTransport(MAIL_SETTINGS);
  try {
    const res = await transporter.sendMail({
      from: MAIL_SETTINGS.auth.user,
      to: email,
      subject: "Email verification",
      html: `
                <div style="max-width: 90%; margin: auto; padding-top: 20px">
                    <p style="display: block; margin-bottom: 8px;">
                        Please enter the sign up OTP to get started
                    </p>
                    <span> OTP: <b> ${otp} </b></span>
                </div>
            `,
    });
    return res;
  } catch (err: Error | any) {
    return err;
  }
}
