import { ErrorRequestHandler } from "express";

const ApiResponse: ErrorRequestHandler = (err, req, res, next) => {
  if (err.status) {
    res.status(err.status).json({
      success: false,
      error: err,
      status: err.status,
      message: err.status === 422 ? err.message[0] : err.message,
      data: null,
    });
    return;
  }
  res.status(200).json({
    success: true,
    error: null,
    status: 200,
    message: err.message || "",
    data: err.data || null,
  });
};

export { ApiResponse };
