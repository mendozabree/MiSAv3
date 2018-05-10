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
            if (Page.IsPostBack == false)
            { 
                FillTable();
                ExpLink();

            }
        }


        void FillTable()
        {
            string expId = (string)(Session["epid"]);
            expID.Text = expId;
            int ExperimentID = Convert.ToInt32(expID.Text);
            string clientname = Context.User.Identity.GetUserName();
            DateTime DateNow = DateTime.Now;

            if (sqlCon.State == ConnectionState.Closed)
                sqlCon.Open();
            SqlCommand cmd = new SqlCommand("ViewMyReservations", sqlCon);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            sda.SelectCommand.Parameters.AddWithValue("@ExperimentID", ExperimentID);
            sda.SelectCommand.Parameters.AddWithValue("@name", clientname);
            sda.SelectCommand.Parameters.AddWithValue("@start", DateNow);
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
                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.HasRows)
                {
                    reader.Read();
                    LinkTextBox.Text = reader.GetString(0);
                }
            reader.Close();
        }

        void LaunchButtonVisible()
        {
            


        }
        protected void Launch_Click(object sender, EventArgs e)
        {

        }

        protected void CurrentReservations_DataBound(object sender, EventArgs e)
        {
            int rowCount = CurrentReservations.Rows.Count;

            if (rowCount == 0)
            {
                CurrentReservations.Visible = false;
                NewReservation.Visible = true;
            }
            else
            {
                NewReservation.Visible = false;
                CurrentReservations.Visible = true;


                string expId = (string)(Session["epid"]);
                expID.Text = expId;
                int ExperimentID = Convert.ToInt32(expID.Text);
                string clientname = Context.User.Identity.GetUserName();
                if (sqlCon.State == ConnectionState.Closed)
                    sqlCon.Open();
                SqlCommand cmd = new SqlCommand("VisibleButton", sqlCon);
                cmd.CommandType = CommandType.StoredProcedure;
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                sda.SelectCommand.Parameters.AddWithValue("@ExperimentID", ExperimentID);
                sda.SelectCommand.Parameters.AddWithValue("@start", DateTime.Now);
                sda.SelectCommand.Parameters.AddWithValue("@name", clientname);
                SqlDataReader reader = cmd.ExecuteReader();

                if (reader.HasRows)
                {
                    reader.Read();
                    Time1.Text = Convert.ToDateTime(reader["eventstart"]).ToString();
                    Time.Text = Convert.ToDateTime(reader["eventend"]).ToString();
                    DateTime ScheduledStart = Convert.ToDateTime(Time1.Text);
                    DateTime ScheduledEnd = Convert.ToDateTime(Time.Text);
                    if (ScheduledStart <= DateTime.Now && DateTime.Now <= ScheduledEnd)
                    {
                        Launch.Visible = true;
                    }
                }
                reader.Close();



            }
        }

        protected void Startlink_Click(object sender, EventArgs e)
        {
            string startTime = (sender as LinkButton).CommandArgument;
        }
    }
}