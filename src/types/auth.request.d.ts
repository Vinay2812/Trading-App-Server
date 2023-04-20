import { UserBankDetailsInterface, UserContactDetailsInterface, UserOnlineDetailsInterface } from "../models/users/users.model"

export type RegisterRequest = {
    userData: UserOnlineDetailsInterface,
    bankData: Array<UserBankDetailsInterface>,
    contactData: Array<UserContactDetailsInterface>
}