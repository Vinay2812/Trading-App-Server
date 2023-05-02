import { processQueryOutput } from "../../utils/query";
import {
  SubTodosInterface,
  SubTodos,
  TodosInterface,
  Todos,
} from "./todo.model";

export async function getTodoByQuery(query: any = { where: {} }) {
  const data = await Todos.findOne(query);
  return processQueryOutput.forFindOne<TodosInterface>(data);
}

export async function getTodosByQuery(query: any = { where: {} }) {
  const data = await Todos.findAll(query);
  return processQueryOutput.forFindAll<TodosInterface>(data);
}

export async function getSubTodosByQuery(query: any = { where: {} }) {
  const data = await SubTodos.findAll(query);
  return processQueryOutput.forFindAll<SubTodosInterface>(data);
}

export async function createTodoByQuery(
  values: TodosInterface,
  options: any = { returning: true }
) {
  const data = await Todos.create(values, options);
  return processQueryOutput.forInsert<TodosInterface>(data);
}

export async function createSubTodoByQuery(values: SubTodosInterface) {
  const data = await SubTodos.create(values);
  return processQueryOutput.forInsert<SubTodosInterface>(data);
}

export async function updateTodoByQuery(
  values: any,
  query: any = { where: {} }
) {
  const [rows, data] = await Todos.update(values, query);
  let processedOutput = processQueryOutput.forUpdate(data);
  return { rows_affected: rows, data: processedOutput };
}

export async function updateSubTodoByQuery(
  values: any,
  query: any = { where: {} }
) {
  const [rows, data] = await SubTodos.update(values, query);
  let processedOutput = processQueryOutput.forUpdate(data);
  return { rows_affected: rows, data: processedOutput };
}

export async function deleteTodoByQuery(query: any = { where: {} }) {
  const data = await Todos.destroy(query);
  return data;
}

export async function deleteSubTodoByQuery(query: any = { where: {} }) {
  const data = await SubTodos.destroy(query);
  return data;
}

export async function getTodoCountByQuery(query: any = { where: {} }) {
  const data = await Todos.count(query);
  return data;
}

export async function getSubTodoCountByQuery(query: any = { where: {} }) {
  const data = await SubTodos.count(query);
  return data;
}
