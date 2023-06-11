import z from "zod";

export const updatePasswordReq = z
  .object({
    body: z
      .object({
        userId: z.string({
          required_error: "userId is required",
        }),
        password: z
          .string({
            required_error: "Password is required",
          })
          .min(5, "Please enter string password"),
      })
      .required(),
  })
  .required();

export const getUserReq = z
  .object({
    query: z
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
      })
      .required(),
  })
  .required();

export const getOnlineUserCompaniesReq = z
  .object({
    params: z.object({
      mobile: z
        .string({
          required_error: "Mobile number is required",
        })
        .min(10, "Mobile number must be of length 10")
        .max(10, "Mobile number must be of length 10"),
    }),
  })
  .required();

export const getUserByIdReq = z
  .object({
    params: z.object({
      userId: z.string({
        required_error: "userId is required",
      }),
    }),
  })
  .required();

export const getUserFromAccountMasterReq = z
  .object({
    params: z
      .object({
        accoid: z
          .string({
            required_error: "accoid is required",
          })
          .regex(/^\d+$/, "accoid must be a number"),
      })
      .required(),
  })
  .required();

export const getUserProfileReq = z
  .object({
    params: z
      .object({
        userId: z.string({
          required_error: "User id is required",
        }),
      })
      .required(),
  })
  .required();

export const buyOrderReq = z
  .object({
    body: z
      .object({
        tender_id: z.number({
          required_error: "Tender id is required",
        }),
        tender_no: z.number({
          required_error: "Tender no is required",
        }),
        userId: z.string({
          required_error: "User id is required",
        }),
        accoid: z.number({
          required_error: "Accoid is required",
        }),
        order_remark: z.string({
          required_error: "Order remark is required",
        }),
        qty: z.number({
          required_error: "Quantity is required",
        }),
        selling_type: z.string({
          required_error: "Selling type is required",
        }),
        sale_rate: z.number({
          required_error: "Sale rate is required",
        }),
        mill_rate: z.number({
          required_error: "Mill rate is required",
        }),
        purc_rate: z.number({
          required_error: "Purchase rate is required",
        }),
        order_confirmed: z
          .string({
            required_error: "Order confirmed is required",
          })
          .refine((val) => val === "Y" || val === "N", {
            message: "Order confirmed must be Y or N",
          }),
        confirm_remark: z.string({
          required_error: "Confirm remark is required",
        }),
      })
      .required(),
  })
  .required();

export type UpdatePasswordRequest = z.infer<typeof updatePasswordReq>;
export type GetUserRequest = z.infer<typeof getUserReq>;
export type GetOnlineUserCompaniesRequest = z.infer<
  typeof getOnlineUserCompaniesReq
>;
export type GetUserByIdRequest = z.infer<typeof getUserByIdReq>;
export type GetUserFromAccountMasterRequest = z.infer<
  typeof getUserFromAccountMasterReq
>;
export type GetUserProfile = z.infer<typeof getUserProfileReq>;
export type BuyOrderRequest = z.infer<typeof buyOrderReq>;
