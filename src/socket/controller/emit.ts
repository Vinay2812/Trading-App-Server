import io from "../../connections/socket.connection";
import logger from "../../utils/logger";


export async function updatePublishedList() {
  try {
    const req_success = await io.emitWithAck("/published-list/update");
    return req_success;
  } catch (error) {
    logger.error("Some receivers didn't sent the acknowledgement\n" + error);
  }
}

export async function updateOnePublishedListItemSaleRate(sale_rate: number, tender_id: number) {
  try {
    const req_success = await io.emitWithAck(
      "/published-list/update/sale_rate",
      { tender_id, sale_rate }
    );
    return req_success;
  } catch (err) {
    logger.error("Some receivers didn't sent the acknowledgement\n" + err);
  }
}

export async function updateTradingOption() {
  try {
    const req_success = await io.emitWithAck(
      "/published-list/update/trading-status"
    );
    return req_success;
  } catch (err) {
    logger.error("Some receivers didn't sent the acknowledgement\n" + err);
  }
}

export async function updateUserAuthorization(userId: string, accoid: number) {
  try {
    // const socketId = user_to_socket_map.get(userId);
    // const req_success = await io
    //   .to(socketId)
    //   .emitWithAck("/client/update-authorization", accoid);
    // return req_success;
    return true
  } catch (err) {
    logger.error("Some receivers didn't sent the acknowledgement\n" + err);
  }
}
