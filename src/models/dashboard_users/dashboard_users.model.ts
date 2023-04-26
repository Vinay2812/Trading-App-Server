import mssql from "../../connections/mssql.connection";
import { DataTypes, Model } from "sequelize";

type DashboardAccessType = "read-only" | "read-write";

export interface DashboardUserInterface {
    email: string;
    access_type: DashboardAccessType;
}

export const DashboardUser = mssql.define<Model<DashboardUserInterface>>(
    "dashboard_users",
    {
        email: {
            type: DataTypes.STRING,
            allowNull: false,
            primaryKey: true,
        },
        access_type: {
            type: DataTypes.STRING,
            allowNull: false,
        },
    },
    {
        timestamps: false,
        freezeTableName: true,
        tableName: "dashboard_users",
    }
);
