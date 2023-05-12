import { Router } from "express";
import { validate } from "../middlewares/validator.middleware";
import {
  getTodos,
  getTodo,
  postTodo,
  updateSubTodo,
  updateTodo,
  deleteTodo,
  postSubTodo,
  deleteSubTodo,
} from "../controller/todo.controller";
import {
  getTodosReq,
  getTodoReq,
  postTodoReq,
  updateTodoReq,
  deleteTodoReq,
  postSubTodoReq,
  updateSubTodoReq,
  deleteSubTodoReq,
} from "../validators/todo.validator";

const router = Router();

// todos
router.get("/all/:user_id", validate(getTodosReq), getTodos);
router.get("/:todo_id", validate(getTodoReq), getTodo);
router.post("/", validate(postTodoReq), postTodo);
router.patch("/", validate(updateTodoReq), updateTodo);
router.delete("/", validate(deleteTodoReq), deleteTodo);

// sub-todos
router.post("/sub-todo", validate(postSubTodoReq), postSubTodo);
router.patch("/sub-todo", validate(updateSubTodoReq), updateSubTodo);
router.delete("/sub-todo", validate(deleteSubTodoReq), deleteSubTodo);

export default router;
