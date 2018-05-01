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
    public partial class MakeReservation : System.Web.UI.Page
    {
        SqlConnection sqlCon = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            FillTable();
            ExpLink();
        }


        void FillTable()
        {
            string expId = (string)(Session["epid"]);
            expID.Text = expId;
            int ExperimentID = Convert.ToInt32(expID.Text);
            string clientname = Context.User.Identity.GetUserName();

            if (sqlCon.State == ConnectionState.Closed)
                sqlCon.Open();
            SqlCommand cmd = new SqlCommand("ViewMyReservations", sqlCon);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            sda.SelectCommand.Parameters.AddWithValue("@ExperimentID", ExperimentID);
            sda.SelectCommand.Parameters.AddWithValue("@name", clientname);
            DataTable dtbl = new DataTable();
            sda.Fill(dtbl);
            sqlCon.Close();

            CurrentReservations.DataSource = dtbl;
            CurrentReservations.DataBind();
        }
        void ExpLink()
        {
            string expId = (string)(Session["epid"]);
            expID.Text = expId;
            int ExperimentID = Convert.ToInt32(expID.Text);

            if (sqlCon.State == ConnectionState.Closed)
                sqlCon.Open();
            SqlCommand cmd = new SqlCommand("LabLaunch", sqlCon);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            sda.SelectCommand.Parameters.AddWithValue("@ExperimentID", ExperimentID);
            DataTable dtbl = new DataTable();
            sda.Fill(dtbl);
            sqlCon.Close();

            Link.DataSource = dtbl;
            Link.DataBind();
        }
        protected void Launch_Click(object sender, EventArgs e)
        {
            string labLink = (sender as LinkButton).CommandArgument;
            LinkTextBox.Text = labLink;
        }
    }
}