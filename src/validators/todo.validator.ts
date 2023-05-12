import z from "zod";

export const getTodosReq = z
  .object({
    params: z
      .object({
        user_id: z.string({
          required_error: "User id is required",
        }),
      })
      .required(),
  })
  .required();

export const getTodoReq = z
  .object({
    params: z
      .object({
        todo_id: z.string({
          required_error: "Todo id is required",
        }),
      })
      .required(),
  })
  .required();

export const postTodoReq = z
  .object({
    body: z
      .object({
        userId: z.string(),
        title: z.string(),
        description: z
          .string()
          .min(0)
          .nullable()
          .transform((text) => (!text ? "" : text)),
        status: z
          .string({
            required_error: "Status is required",
          })
          .refine((val) => val === "complete" || val === "incomplete"),
        priority: z
          .string({
            required_error: "Priority is required",
          })
          .refine((val) => val === "low" || val === "medium" || val === "high"),
        dueDate: z
          .string({
            required_error: "Due date is required",
          })
          .transform((d) => new Date(d)),
      })
      .required(),
  })
  .required();

export const updateTodoReq = z
  .object({
    body: z
      .object({
        todoId: z.string({
          required_error: "Todo id is required",
        }),
        title: z.string({
          required_error: "Title is required",
        }),
        description: z
          .string()
          .min(0)
          .nullable()
          .transform((text) => (!text ? "" : text)),
        status: z
          .string({
            required_error: "Status is required",
          })
          .refine((val) => val === "complete" || val === "incomplete"),
        priority: z
          .string({
            required_error: "Priority is required",
          })
          .refine((val) => val === "low" || val === "medium" || val === "high"),
        dueDate: z
          .string({
            required_error: "Due date is required",
          })
          .transform((d) => new Date(d)),
      })
      .required(),
  })
  .required();

export const deleteTodoReq = z
  .object({
    body: z
      .object({
        todoId: z.string({
          required_error: "Todo id is required",
        }),
      })
      .required(),
  })
  .required();

export const postSubTodoReq = z
  .object({
    body: z
      .object({
        todoId: z.string({
          required_error: "Todo id is required",
        }),
        title: z.string({
          required_error: "Title is required",
        }),
        description: z
          .string()
          .min(0)
          .nullable()
          .transform((text) => (!text ? "" : text)),
        status: z
          .string({
            required_error: "Status is required",
          })
          .refine((val) => val === "complete" || val === "incomplete"),
        priority: z
          .string({
            required_error: "Priority is required",
          })
          .refine((val) => val === "low" || val === "medium" || val === "high"),
        dueDate: z
          .string({
            required_error: "Due date is required",
          })
          .transform((d) => new Date(d)),
      })
      .required(),
  })
  .required();

export const updateSubTodoReq = z
  .object({
    body: z
      .object({
        subTodoId: z.string({
          required_error: "Sub todo id is required",
        }),
        title: z.string({
          required_error: "Title is required",
        }),
        description: z
          .string()
          .min(0)
          .nullable()
          .transform((text) => (!text ? "" : text)),
        status: z
          .string({
            required_error: "Status is required",
          })
          .refine((val) => val === "complete" || val === "incomplete"),
        priority: z
          .string({
            required_error: "Priority is required",
          })
          .refine((val) => val === "low" || val === "medium" || val === "high"),
        dueDate: z
          .string({
            required_error: "Due date is required",
          })
          .transform((d) => new Date(d)),
      })
      .required(),
  })
  .required();

export const deleteSubTodoReq = z
  .object({
    body: z
      .object({
        subTodoId: z.string({
          required_error: "Sub todo id is required",
        }),
      })
      .required(),
  })
  .required();
