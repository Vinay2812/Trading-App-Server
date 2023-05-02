import { Request, Response, NextFunction } from "express";
import {
  createSubTodoByQuery,
  createTodoByQuery,
  deleteTodoByQuery,
  getSubTodosByQuery,
  getTodosByQuery,
  updateTodoByQuery,
} from "../models/todo/service";
import { Op } from "sequelize";
import { SubTodosInterface, TodosInterface } from "../models/todo/todo.model";

export async function getTodo(req: Request, res: Response, next: NextFunction) {
  try {
    const { todoId } = req.params;
    const todo = await getTodosByQuery({
      where: {
        todoId,
      },
    });
    next({ message: "Todo found", data: { todo } });
  } catch (err) {
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
    const { userId, title, description, status, priority, subTodos } = req.body;

    const todo = await createTodoByQuery({
      userId,
      title,
      description,
      status,
      priority,
    });

    next({ message: "Todo created", data: { todo } });
  } catch (err) {
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
    const { todoId, title, description, status, priority } = req.body;
    const todo = await updateTodoByQuery(
      {
        title,
        description,
        status,
        priority,
      },
      {
        where: {
          todoId,
        },
      }
    );
    next({ message: "Todo updated", data: { todo } });
  } catch (err) {
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
    const todo = await deleteTodoByQuery({
      where: {
        todoId,
      },
    });
    next({ message: "Todo deleted", data: { todo } });
  } catch (err) {
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
    const allTodos = await getTodosByQuery({
      where: {
        userId: req.params.user_id,
      },
    });

    const todoIds = allTodos.map((todo) => todo.todoId);

    const allSubTodos = await getSubTodosByQuery({
      where: {
        todoId: {
          [Op.in]: todoIds,
        },
      },
    });
    type ResponseType = {
      todo: TodosInterface;
      subTodos: SubTodosInterface[];
    };

    let response: ResponseType[] = [];
    const todoMap = new Map<string, ResponseType>();

    for (const todo of allTodos) {
      todoMap.set(todo.todoId, { todo, subTodos: [] });
    }

    for (const subTodo of allSubTodos) {
      const todo = todoMap.get(subTodo.todoId);
      if (todo) {
        todo.subTodos.push(subTodo);
      }
    }

    response = Array.from(todoMap.values());

    next({ message: "Todos fetched", data: { todos: response } });
  } catch (err) {
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
    const { todoId, title, description, status, priority } = req.body;

    const subTodo = await createSubTodoByQuery({
      todoId,
      title,
      description,
      status,
      priority,
    });

    next({ message: "SubTodo created", data: { subTodo } });
  } catch (err) {
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
    const { subTodoId, title, description, status, priority } = req.body;
    const subTodo = await updateTodoByQuery(
      {
        title,
        description,
        status,
        priority,
      },
      {
        where: {
          subTodoId,
        },
      }
    );
    next({ message: "SubTodo updated", data: { subTodo } });
  } catch (err) {
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
    const subTodo = await deleteTodoByQuery({
      where: {
        subTodoId,
      },
    });
    next({ message: "SubTodo deleted", data: { subTodo } });
  } catch (err) {
    if (!err.statusCode) {
      err.statusCode = 500;
    }
    next(err);
  }
}
