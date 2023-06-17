import { RequestHandler } from "express";
import { OffDays, TradeTimings } from "../utils/models";
import { getDayOfWeek, isTimeInRange } from "../utils/date";


export const validateTime: RequestHandler = async (req, res, next) => {
  try {
    const offDays = (
      await OffDays.findMany({
        select: {
          day: true,
        },
      })
    ).map(({ day }) => day);

    const tradeTimings = await TradeTimings.findFirst({
      select: {
        start_time: true,
        end_time: true,
      },
    });
    const now = new Date();
    let startTime = new Date(
      now.getFullYear(),
      now.getMonth(),
      now.getDate(),
      10,
      0,
      0,
      0
    );

    let endTime = new Date(
      now.getFullYear(),
      now.getMonth(),
      now.getDate(),
      17,
      0,
      0,
      0
    );
    if (tradeTimings) {
      startTime = tradeTimings.start_time;
      endTime = tradeTimings.end_time;
    }

    const currTime = new Date();

    if (
      offDays.includes(getDayOfWeek(currTime)) ||
      !isTimeInRange(startTime, endTime, currTime)
    ) {
    //   await DailyPublish.deleteMany({});
    //   io.emit(UPDATE_ORDER_LIST);
    //   io.emit(UPDATE_PUBLISHED_LIST);
    //   io.emit(UPDATE_PUBLISH_LIST);
      console.log("Deleted published list");
    }
    next();
  } catch (err: any) {
    if (!err.status) err.status = 500;
  }
};
