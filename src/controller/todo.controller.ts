import { Request, Response, NextFunction } from "express";
import { SubTodos, Todos } from "../utils/models";
import createHttpError from "http-errors";
import { getRandomId } from "../utils/random";

export async function getTodo(req: Request, res: Response, next: NextFunction) {
  try {
    const { todoId } = req.params;
    const todo = await Todos.findFirst({
      where: {
        todoId,
      },
    });
    if (!todo) {
      throw createHttpError.NotFound("Opps!! Todo not found");
    }
    next({ message: "Todo found", data: { todo } });
  } catch (err: Error | any) {
    if (!err.statusCode) {
      err.statusCode = 500;
    }
    next(err);
  }
}

export async function postTodo(
  req: Request,
  res: Response,
  next: NextFunction
) {
  try {
    const { userId, title, description, status, priority, dueDate } = req.body;

    const todo = await Todos.create({
      data: {
        userId,
        todoId: getRandomId(),
        description,
        dueDate,
        priority,
        status,
        title,
      },
    });

    next({ message: "Todo created", data: { todo } });
  } catch (err: Error | any) {
    if (!err.statusCode) {
      err.statusCode = 500;
    }
    next(err);
  }
}

export async function updateTodo(
  req: Request,
  res: Response,
  next: NextFunction
) {
  try {
    const { todoId, title, description, status, priority, dueDate } = req.body;
    const todo = await Todos.update({
      data: {
        title,
        description,
        status,
        priority,
        dueDate,
      },

      where: {
        todoId,
      },
    });

    next({ message: `Todo updated successfully`, data: { todo } });
  } catch (err: Error | any) {
    if (!err.statusCode) {
      err.statusCode = 500;
    }
    next(err);
  }
}

export async function deleteTodo(
  req: Request,
  res: Response,
  next: NextFunction
) {
  try {
    const { todoId } = req.params;
    const todo = await Todos.delete({
      where: {
        todoId,
      },
    });
    next({ message: "Todo deleted successfully", data: { todo } });
  } catch (err: Error | any) {
    if (!err.statusCode) {
      err.statusCode = 500;
    }
    next(err);
  }
}

export async function getTodos(
  req: Request,
  res: Response,
  next: NextFunction
) {
  try {
    const allTodos = await Todos.findMany({
      where: {
        userId: req.params.user_id,
      },
    });

    const todoIds = allTodos.map((todo) => todo.todoId);

    const allSubTodos = await SubTodos.findMany({
      where: {
        todoId: {
          in: todoIds,
        },
      },
    });
    type ResponseType = {
      todo: (typeof allTodos)[0];
      subTodos: typeof allSubTodos;
    };

    let response: ResponseType[] = [];
    const todoMap = new Map<string, ResponseType>();

    for (const todo of allTodos) {
      if (todo.todoId) todoMap.set(todo.todoId, { todo, subTodos: [] });
    }

    for (const subTodo of allSubTodos) {
      const todo = todoMap.get(subTodo.todoId!);
      if (todo) {
        todo.subTodos.push(subTodo);
      }
    }

    response = Array.from(todoMap.values());

    next({ message: "Todos fetched", data: { todos: response } });
  } catch (err: Error | any) {
    if (!err.statusCode) {
      err.statusCode = 500;
    }
    next(err);
  }
}

export async function postSubTodo(
  req: Request,
  res: Response,
  next: NextFunction
) {
  try {
    const { todoId, title, description, status, priority, dueDate } = req.body;

    const subTodo = await SubTodos.create({
      data: {
        subTodoId: getRandomId(),
        todoId,
        title,
        description,
        status,
        priority,
        dueDate,
      },
    });

    next({ message: "SubTodo created", data: { subTodo } });
  } catch (err: Error | any) {
    if (!err.statusCode) {
      err.statusCode = 500;
    }
    next(err);
  }
}

export async function updateSubTodo(
  req: Request,
  res: Response,
  next: NextFunction
) {
  try {
    const { subTodoId, title, description, status, priority, dueDate } =
      req.body;
    const subTodo = await SubTodos.update({
      data: {
        title,
        description,
        status,
        priority,
        dueDate,
      },

      where: {
        subTodoId,
      },
    });
    next({ message: "SubTodo updated", data: { subTodo } });
  } catch (err: Error | any) {
    if (!err.statusCode) {
      err.statusCode = 500;
    }
    next(err);
  }
}

export async function deleteSubTodo(
  req: Request,
  res: Response,
  next: NextFunction
) {
  try {
    const { subTodoId } = req.params;
    const subTodo = await SubTodos.delete({
      where: {
        subTodoId,
      },
    });
    next({ message: "Sub-todo deleted", data: { subTodo } });
  } catch (err: Error | any) {
    if (!err.statusCode) {
      err.statusCode = 500;
    }
    next(err);
  }
}
