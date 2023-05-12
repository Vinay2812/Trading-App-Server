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
    params: z.object({
      accoid: z.number({
        required_error: "accoid is required",
        invalid_type_error: "accoid must be a number",
      }),
    }),
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
