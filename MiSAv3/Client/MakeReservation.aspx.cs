using Microsoft.AspNet.Identity;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.Common;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MiSAv3.Client
{
    public partial class ClientReservations : System.Web.UI.Page
    {
        SqlConnection sqlCon = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            FillTable();
        }

        void FillTable()
        {
            string clientname = Context.User.Identity.GetUserName();
            if (sqlCon.State == ConnectionState.Closed)
                sqlCon.Open();
            DbCommand cmd = sqlCon.CreateCommand();
            SqlCommand command = new SqlCommand ( "SELECT * FROM event WHERE clientname LIKE @name;");
            command.Parameters.AddWithValue("@name", clientname);

            DbDataReader reader = cmd.ExecuteReader();
            DataTable dtbl = new DataTable();
            dtbl.Load(reader);
            sqlCon.Close();
            CurrentReservations.DataSource = dtbl;
            CurrentReservations.DataBind();
        }
    }
}