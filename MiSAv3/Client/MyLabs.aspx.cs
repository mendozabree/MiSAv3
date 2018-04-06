using System;
using System.Configuration;
using System.Data;
using System.Data.Common;
using System.Data.SqlClient;
using MiSAv3.Models;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MiSAv3.Client
{
    public partial class MyLabs : System.Web.UI.Page
    {
        SqlConnection sqlCon = new SqlConnection(ConfigurationManager.ConnectionStrings["misa"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            FillTable();

        }

        void FillTable()
        {
            if (sqlCon.State == ConnectionState.Closed)
                sqlCon.Open();
            DbCommand cmd = sqlCon.CreateCommand();
            cmd.CommandText = "SELECT * FROM ExperimentDetails WHERE ExperimentStatus = 'Active'";

            DbDataReader reader = cmd.ExecuteReader();
            DataTable dtbl = new DataTable();
            dtbl.Load(reader);
            sqlCon.Close();
            ExperimentsTable.DataSource = dtbl;
            ExperimentsTable.DataBind();
        }

        protected void Reserve_Click(object sender, EventArgs e)
        {

            ViewExperimentsPanel.Visible = false;
            
        }
    }
}