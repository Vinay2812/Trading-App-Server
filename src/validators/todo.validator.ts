import * as Joi from "@hapi/joi";
import "joi-extract-type";

export const getTodosReq = Joi.object({
  params: {
    user_id: Joi.string().required(),
  },
}).required();

export const getTodoReq = Joi.object({
  params: {
    todo_id: Joi.string().required(),
  },
}).required();

export const postTodoReq = Joi.object({
  body: {
    userId: Joi.string().required(),
    title: Joi.string().required(),
    description: Joi.string().optional().min(0),
    status: Joi.string().required().valid("complete", "incomplete"),
    priority: Joi.string().required().valid("low", "medium", "high"),
    dueDate: Joi.date().required(),
  },
}).required();

export const updateTodoReq = Joi.object({
  body: {
    todoId: Joi.string().required(),
    title: Joi.string().required(),
    description: Joi.string().allow(null),
    status: Joi.string().required(),
    priority: Joi.string().required().valid("low", "medium", "high"),
    dueDate: Joi.date().required(),
  },
}).required();

export const deleteTodoReq = Joi.object({
  body: {
    todoId: Joi.string().required(),
  },
}).required();

export const postSubTodoReq = Joi.object({
  body: {
    todoId: Joi.string().required(),
    title: Joi.string().required(),
    description: Joi.string().allow(null),
    status: Joi.string().required(),
    priority: Joi.string().required().valid("low", "medium", "high"),
    dueDate: Joi.date().required(),
  },
}).required();

export const updateSubTodoReq = Joi.object({
  body: {
    subTodoId: Joi.string().required(),
    title: Joi.string().required(),
    description: Joi.string().allow(null),
    status: Joi.string().required(),
    priority: Joi.string().required().valid("low", "medium", "high"),
    dueDate: Joi.date().required(),
  },
}).required();

export const deleteSubTodoReq = Joi.object({
  body: {
    subTodoId: Joi.string().required(),
  },
}).required();
