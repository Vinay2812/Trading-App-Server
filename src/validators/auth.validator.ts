import z from "zod";
import { OTP_LENGTH } from "../utils/constants";

export const registerReq = z
  .object({
    body: z
      .object({
        userData: z
          .object({
            company_name: z.string({
              required_error: "Company name is required",
            }),
            email: z
              .string({
                required_error: "Email is required",
              })
              .email({
                message: "Invalid email address",
              }),
            address: z.string({
              required_error: "Address is required",
            }),
            state: z.string({
              required_error: "State is required",
            }),
            district: z.string({
              required_error: "District is required",
            }),
            pincode: z
              .string({
                required_error: "Pincode is required",
              })
              .min(6, "Pincode must be of length 6")
              .max(6, "Pincode must be of length 6")
              .transform((val) => parseInt(val)),
            mobile: z
              .string({
                required_error: "Mobile number is required",
              })
              .min(10, "Mobile number must be of length 10")
              .max(10, "Mobile number must be of length 10"),
            whatsapp: z
              .union([
                z
                  .string({
                    required_error: "Mobile number is required",
                  })
                  .min(10, "Whatsapp number must be of length 10")
                  .max(10, "Whatsapp number must be of length 10"),
                z.string().min(0),
                z.undefined(),
              ])
              .optional()
              .default("")
              .transform((val) => (!val ? "" : val)),
            gst: z
              .union([
                z
                  .string()
                  .min(15, "GST number must be of length 15")
                  .max(15, "GST number must be of length 15"),
                z.string().min(0),
                z.undefined(),
              ])
              .optional()
              .default("")
              .transform((val) => (!val ? "" : val)),
            pan: z
              .string({
                required_error: "PAN number is required",
              })
              .min(10, "Pan number must be of length 10")
              .max(10, "Pan number must be of length 10"),
            fssai: z
              .string({
                required_error: "FSSAI number is required",
              })
              .default(""),
            tan: z
              .string({
                required_error: "TAN number is required",
              })
              .default(""),
            constitution_of_firm: z.string({
              required_error: "Constitution of firm is required",
            }),
            password: z
              .string({
                required_error: "Password is required",
              })
              .min(5, "Password must be of length 5"),
          })
          .required(),
        bankData: z
          .array(
            z
              .object({
                account_name: z.string({
                  required_error: "Account name is required",
                }),
                account_number: z
                  .string({
                    required_error: "Account number is required",
                  })
                  .regex(/^\d+$/, "Account number must only contain digits"),
                account_type: z.string({
                  required_error: "Account type is required",
                }),
                bank_name: z.string({
                  required_error: "Bank name is required",
                }),
                branch: z.string({
                  required_error: "Branch is required",
                }),
                ifsc: z.string({
                  required_error: "IFSC code is required",
                }),
              })
              .required()
          )
          .min(1, "Atleast one bank account is required"),
        contactData: z
          .array(
            z
              .object({
                full_name: z.string(),
                designation: z.string(),
                mobile: z
                  .string({
                    required_error: "Mobile number is required",
                  })
                  .min(10, "Mobile number must be of length 10")
                  .max(10, "Mobile number must be of length 10"),
                whatsapp: z
                  .union([
                    z
                      .string({
                        required_error: "Mobile number is required",
                      })
                      .min(10, "Whatsapp number must be of length 10")
                      .max(10, "Whatsapp number must be of length 10"),
                    z.string().min(0),
                    z.undefined(),
                  ])
                  .optional()
                  .default("")
                  .transform((val) => (!val ? "" : val)),
                email: z
                  .string({
                    required_error: "Email is required",
                  })
                  .email({
                    message: "Invalid email address",
                  }),
              })
              .required()
          )
          .min(1, "Atleast one contact is required"),
      })
      .required(),
  })
  .required();

export const validateOTPReq = z
  .object({
    body: z
      .object({
        email: z
          .string({
            required_error: "Email is required",
          })
          .email({
            message: "Invalid email address",
          }),
        otp: z
          .string({
            required_error: "OTP is required",
          })
          .min(OTP_LENGTH, `Otp length must be ${OTP_LENGTH}`)
          .max(OTP_LENGTH, `Otp length must be ${OTP_LENGTH}`),
      })
      .required(),
  })
  .required();

export const sendOTPReq = z
  .object({
    body: z
      .object({
        email: z
          .string({
            required_error: "Email is required",
          })
          .email({
            message: "Invalid email address",
          }),
      })
      .required(),
  })
  .required();

export const loginReq = z
  .object({
    body: z
      .object({
        mobile: z
          .string({
            required_error: "Mobile number is required",
          })
          .min(10, "Mobile number must be of length 10")
          .max(10, "Mobile number must be of length 10"),
        company_name: z.string({
          required_error: "Company name is required",
        }),
        password: z.string({
          required_error: "Password is required",
        }),
      })
      .required(),
  })
  .required();

export type RegisterRequest = z.infer<typeof registerReq>;
export type ValidateOTPRequest = z.infer<typeof validateOTPReq>;
export type SendOTPRequest = z.infer<typeof sendOTPReq>;
export type LoginRequest = z.infer<typeof loginReq>;
