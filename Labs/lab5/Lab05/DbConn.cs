﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

namespace Lab05
{
    public class DbConn
    {
        public String connStr = "Data Source=ecnmssqldev.ecn.purdue.edu;Initial Catalog=zCGT456_ramakri7;Integrated Security=True";
        public SqlDataAdapter dbSDA;
        public DataSet dbDS;
        public SqlDataReader dbDR;
        public SqlConnection dbConnection;
        public SqlCommand dbCmd;

        public DbConn()
        {
            // Nothing here
        } // End of constructor

        public System.Data.DataSet createDataSet(String sqlPassedIn)
        {
            dbConnection = new SqlConnection(connStr);
            dbConnection.Open();
            dbCmd = new SqlCommand(sqlPassedIn, dbConnection);
            dbSDA = new SqlDataAdapter();
            dbSDA.SelectCommand = dbCmd;
            dbDS = new DataSet();
            dbSDA.Fill(dbDS);
            return dbDS;
        } // End of createDataSet

        public System.Data.SqlClient.SqlDataReader createDataReader(String sqlPassedIn)
        {
            dbConnection = new SqlConnection(connStr);
            dbConnection.Open();
            dbCmd = new SqlCommand(sqlPassedIn, dbConnection);
            dbDR = dbCmd.ExecuteReader();
            return dbDR;
        } // End of createDataReader

    } // End of class
} // End of namespace