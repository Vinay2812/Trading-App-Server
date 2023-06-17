import prisma from "../connections/prisma.connection";

/* Models */
export const AccountMaster = prisma.accountMaster;
export const DailyPublish = prisma.trDailypublish;
export const Todos = prisma.todos;
export const SubTodos = prisma.subTodos;
export const AdminProfile = prisma.adminProfile;
export const UserProfile = prisma.userOnlineDetails;
export const UserBankDetails = prisma.userBankDetails;
export const UserContactDetails = prisma.userContactDetails;
export const OrderBook = prisma.orderBook
export const OffDays = prisma.offDays;
export const TradeTimings = prisma.tradeTimings;

/* Views */
export const TenderBalanceView = prisma.tenderBalanceView;
export const DailyBalance = prisma.dailyBalance;
