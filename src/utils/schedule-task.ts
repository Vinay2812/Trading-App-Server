import cron from "node-cron";
import io from "../connections/socket.connection";
import { UPDATE_PUBLISHED_LIST } from "./socket-emits";
import { TradeTimings } from "./models";

interface TaskFunction {
  time: Date;
  task: cron.ScheduledTask;
  function: (...args: any[]) => void;
}

const taskFunctions: TaskFunction[] = [];

function createNewTask({
  time,
  function: taskFunction,
}: {
  time: Date;
  function: (...args: any[]) => void;
}) {
  const hours = time.getHours().toString().padStart(2, "0");
  const minutes = ((time.getMinutes() + 1) % 60).toString().padStart(2, "0");
  const cronExpression = `${minutes} ${hours} * * *`;

  const task = cron.schedule(cronExpression, () => {
    taskFunction();
  });
  return task;
}

export async function scheduleTasks() {
  taskFunctions.forEach(({ task }) => {
    task.stop();
  });
  taskFunctions.length = 0;

  // Schedule new tasks based on the provided time and function objects
  const timings = await TradeTimings.findFirst({
    select: {
      start_time: true,
      end_time: true,
    },
  });

  const tempDate = new Date();
  tempDate.setHours(0);
  tempDate.setMinutes(1);

  let timeFunctions = [
    {
      time: tempDate,
      function: () => io.emit(UPDATE_PUBLISHED_LIST),
    },
  ];

  if (timings) {
    timeFunctions = [
      ...timeFunctions,
      ...[
        {
          time: new Date(timings.start_time),
          function: () => io.emit(UPDATE_PUBLISHED_LIST),
        },
        {
          time: new Date(timings.end_time),
          function: () => io.emit(UPDATE_PUBLISHED_LIST),
        },
      ],
    ];
  }

  timeFunctions.forEach(({ time, function: taskFunction }) => {
    const task = createNewTask({ time, function: taskFunction });
    taskFunctions.push({ time, task, function: taskFunction });
  });
}

// Usage:
const timeFunctionArray = [
  {
    time: new Date(2023, 5, 28, 20, 10),
    function: () => {
      console.log("Task 1 function");
    },
  },
  {
    time: new Date(2023, 5, 28, 20, 9),
    function: () => {
      console.log("Task 2 function");
    },
  },
  {
    time: new Date(2023, 5, 28, 20, 11),
    function: () => {
      console.log("Task 3 function");
    },
  },
];

// scheduleTasks(timeFunctionArray);
