import { DataTypes, Model } from "sequelize";
import mssql from "../../connections/mssql.connection";

type TodoPriority = "low" | "medium" | "high";

export interface TodosInterface {
  userId: string;
  todoId?: string;
  title: string;
  description: string;
  status: string;
  priority: TodoPriority;
}

export interface SubTodosInterface {
  todoId: string;
  subTodoId?: string;
  title: string;
  description: string;
  status: string;
  priority: TodoPriority;
}

export const Todos = mssql.define<Model<TodosInterface>>("todos", {
  userId: { type: DataTypes.STRING },
  todoId: {
    type: DataTypes.UUID,
    defaultValue: DataTypes.UUIDV4,
    primaryKey: true,
  },
  title: { type: DataTypes.STRING },
  description: { type: DataTypes.STRING, allowNull: true },
  status: { type: DataTypes.STRING },
  priority: { type: DataTypes.STRING },
});

export const SubTodos = mssql.define<Model<SubTodosInterface>>("sub_todos", {
  todoId: { type: DataTypes.STRING },
  subTodoId: {
    type: DataTypes.UUID,
    defaultValue: DataTypes.UUIDV4,
    primaryKey: true,
  },
  title: { type: DataTypes.STRING },
  description: { type: DataTypes.STRING, allowNull: true },
  status: { type: DataTypes.STRING },
  priority: { type: DataTypes.STRING },
});
