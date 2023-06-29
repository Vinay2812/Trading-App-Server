import z from "zod";

export const adminLoginReq = z
  .object({
    body: z
      .object({
        username: z.string({
          required_error: "Username is required",
        }),
        password: z.string({
          required_error: "Password is required",
        }),
      })
      .required(),
  })
  .required();

export const updateAuthorizationReq = z
  .object({
    body: z
      .object({
        userId: z.string({
          required_error: "User id is required",
          invalid_type_error: "User id must be a string",
        }),
        authorized: z
          .number({
            required_error: "Authorized is required",
          })
          .refine(
            (authorizeCode) => authorizeCode === 0 || authorizeCode === 1,
            "Invalid authorized code"
          ),
      })
      .required(),
    params: z
      .object({
        userId: z.string({
          required_error: "User id is required",
        }),
      })
      .required(),
  })
  .required();

export const addUserReq = z
  .object({
    body: z
      .object({
        userId: z.string({
          required_error: "User id is required",
        }),
      })
      .required(),
  })
  .required();

export const mapClientReq = z
  .object({
    body: z
      .object({
        userId: z.string({
          required_error: "User id is required",
        }),
        accoid: z.number({
          required_error: "Accoid is required",
        }),
      })
      .required(),
  })
  .required();

export const postPublishListReq = z
  .object({
    body: z
      .object({
        tender_no: z.number({
          required_error: "Tender number is required",
        }),
        tender_date: z
          .string({
            required_error: "Tender date is required",
          })
          .datetime()
          .transform((date) => new Date(date)),
        season: z.string({
          required_error: "Season is required",
        }),
        grade: z.string({
          required_error: "Grade is required",
        }),
        quantal: z.number({
          required_error: "Quantal is required",
        }),
        lifting_date: z
          .string({
            required_error: "Lifting date is required",
            invalid_type_error: "Lifting date must be a date",
          })
          .datetime()
          .transform((date) => new Date(date)),
        purchase_rate: z.number({
          required_error: "Purchase rate is required",
        }),
        mill_rate: z.number({
          required_error: "Mill rate is required",
        }),
        mc: z.number(),
        pt: z.number(),
        item_code: z.number(),
        ic: z.number(),
        tender_id: z.number({
          required_error: "Tender id is required",
        }),
        td: z.number(),
        unit: z
          .string({
            required_error: "Unit is required",
          })
          .refine((unit) => ["Q", "M", "L"].includes(unit), "Invalid unit"),
        sale_rate: z.number({
          required_error: "Sale rate is required",
          invalid_type_error: "Sale rate must be a number",
        }),
        publish_quantal: z.number({
          required_error: "Publish quantal is required",
          invalid_type_error: "Publish quantal must be a number",
        }),
        multiple_of: z.number({
          required_error: "Multiple of is required",
          invalid_type_error: "Multiple of must be a number",
        }),
        auto_confirm: z
          .string()
          .refine((ac) => ["Y", "N"].includes(ac), "Invalid auto confirm code"),
        tender_do: z.number(),
        type: z
          .string({
            required_error: "Submit type is required",
          })
          .refine((type) => ["F", "P"].includes(type)),
        mill_code: z.number(),
        payment_to: z.number(),
      })
      .required(),
  })
  .required();

export const updatePublishedListItemReq = z
  .object({
    body: z
      .object({
        tender_id: z.number({
          required_error: "Tender id is required",
          invalid_type_error: "Tender id must be a number",
        }),
        status: z
          .string({
            required_error: "Status is required",
            invalid_type_error: "Status must be a string",
          })
          .refine(
            (status) => ["Y", "N"].includes(status),
            "Invalid status type"
          ),
        sale_rate: z
          .string({
            required_error: "Sale rate is required",
          })
          .regex(/^\d+$/, "Sale rate must be a number")
          .transform((sr) => parseFloat(sr))
          .or(z.number()),
        published_qty: z
          .string({
            required_error: "Published qty is required",
          })
          .regex(/^\d+$/, "Published qty must be a number")
          .transform((sr) => parseFloat(sr))
          .or(z.number()),
        publish_date: z
          .string({
            required_error: "Pblish Date is required",
          })
          .datetime({
            message: "Inavlid date",
          }),
      })
      .required(),
  })
  .required();

export const updatePublishedItemStatusReq = z
  .object({
    body: z.object({
      tender_id: z.number({
        required_error: "Tender id is required",
        invalid_type_error: "Tender id must be a number",
      }),
      status: z
        .string({
          required_error: "Status is required",
          invalid_type_error: "Status must be a string",
        })
        .refine((status) => ["Y", "N"].includes(status)),
    }),
  })
  .required();

export const updateAllTradeReq = z
  .object({
    body: z.object({
      status: z.string().refine((status) => ["Y", "N"].includes(status)),
    }),
  })
  .required();

export const updateSingleSaleRateReq = z
  .object({
    body: z.object({
      tender_id: z.number(),
      sale_rate: z.number(),
    }),
  })
  .required();

export const updateAllSaleRateReq = z
  .object({
    body: z.object({
      sale_rate: z.number(),
    }),
  })
  .required();

export const modifySingleTradeReq = z
  .object({
    body: z.object({
      tender_id: z.number(),
      published_qty: z.number(),
      sale_rate: z.number(),
    }),
  })
  .required();

export const getOrderListReq = z.object({
  query: z.object({
    userId: z.string().optional(),
    order_confirmed: z.enum(["Y", "N", "R"]).optional(),
  }),
});

export const updateTradeTimingsReq = z.object({
  body: z.object({
    startTime: z
      .string()
      .datetime()
      .optional()
      .default(
        new Date(
          new Date().getFullYear(),
          new Date().getMonth(),
          new Date().getDay(),
          10,
          0,
          0,
          0
        ).toISOString()
      ),
    endTime: z
      .string()
      .datetime()
      .optional()
      .default(
        new Date(
          new Date().getFullYear(),
          new Date().getMonth(),
          new Date().getDay(),
          10,
          0,
          0,
          0
        ).toISOString()
      ),
    offDays: z.array(
      z.enum(
        [
          "Monday",
          "Tuesday",
          "Wednesday",
          "Thursday",
          "Friday",
          "Saturday",
          "Sunday",
        ],
        {
          invalid_type_error: "Not a valid day",
        }
      )
    ),
  }),
});

export const updatePendingOrderReq = z.object({
  body: z.object({
    order_id: z.number({
      required_error: "Order id is required",
    }),
    confirm_remark: z
      .string()
      .nullish()
      .transform((val) => val ?? ""),
    order_remark: z
      .string()
      .nullish()
      .transform((val) => val ?? ""),
    order_confirmed: z.enum(["Y", "N", "R"], {
      required_error: "Order approved status is required",
      invalid_type_error: "Please provide a valid input",
    }),
  }),
});

export type AdminLoginRequest = z.infer<typeof adminLoginReq>;
export type UpdateAuthorizationRequest = z.infer<typeof updateAuthorizationReq>;
export type AddUserRequest = z.infer<typeof addUserReq>;
export type MapClientRequest = z.infer<typeof mapClientReq>;
export type PostPublishListRequest = z.infer<typeof postPublishListReq>;
export type UpdatePublishedListItemRequest = z.infer<
  typeof updatePublishedListItemReq
>;
export type UpdatePublishedItemStatusRequest = z.infer<
  typeof updatePublishedItemStatusReq
>;
export type UpdateAllTradeRequest = z.infer<typeof updateAllTradeReq>;
export type UpdateSingleSaleRateRequest = z.infer<
  typeof updateSingleSaleRateReq
>;
export type UpdateAllSaleRateRequest = z.infer<typeof updateAllSaleRateReq>;
export type ModifySingleTradeRequest = z.infer<typeof modifySingleTradeReq>;
export type OrderListRequest = z.infer<typeof getOrderListReq>;
export type UpdateTradeTimingsRequest = z.infer<typeof updateTradeTimingsReq>;
export type UpdatePendingOrderRequest = z.infer<typeof updatePendingOrderReq>;
