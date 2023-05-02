import { Router } from "express";
import { validateRequest } from "../middlewares/validator.middleware";
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
router.get("/all/:user_id", validateRequest(getTodosReq), getTodos);
router.get("/:todo_id", validateRequest(getTodoReq), getTodo);
router.post("/", validateRequest(postTodoReq), postTodo);
router.patch("/", validateRequest(updateTodoReq), updateTodo);
router.delete("/", validateRequest(deleteTodoReq), deleteTodo);

// sub-todos
router.post("/sub-todo", validateRequest(postSubTodoReq), postSubTodo);
router.patch("/sub-todo", validateRequest(updateSubTodoReq), updateSubTodo);
router.delete("/sub-todo", validateRequest(deleteSubTodoReq), deleteSubTodo);

export default router;
