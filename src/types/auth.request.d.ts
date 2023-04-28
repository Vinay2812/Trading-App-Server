import { UserBankDetailsInterface, UserContactDetailsInterface, UserOnlineDetailsInterface } from "../models/users/users.model"

export type RegisterRequest = {
    userData: UserOnlineDetailsInterface,
    bankData: UserBankDetailsInterface[],
    contactData: Array<UserContactDetailsInterface>
}