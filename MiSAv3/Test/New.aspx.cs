using Microsoft.AspNet.Identity;
using MiSAv3.Client;
using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;


namespace MiSAv3.Test
{
    public partial class Duty : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string expId = (string)(Session["epid"]);

            if (!IsPostBack)
            {
                TextBoxStart.Text = Convert.ToDateTime(Request.QueryString["start"]).ToString("M/d/yyyy HH:mm");
                TextBoxEnd.Text = Convert.ToDateTime(Request.QueryString["end"]).ToString("M/d/yyyy HH:mm");
                ExpId.Text = expId;
            }
        }
        protected void ButtonOK_Click(object sender, EventArgs e)
        {

            DateTime start = Convert.ToDateTime(TextBoxStart.Text);
            DateTime end = Convert.ToDateTime(TextBoxEnd.Text);
            int ExpID = Convert.ToInt32(ExpId.Text);

            dbInsertEvent(start, end, TextBoxName.Text=Context.User.Identity.GetUserName(), ExpID);
            Modal.Close(this, "OK");
        }

        private void dbInsertEvent(DateTime start, DateTime end, string name, int ExpID)
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("INSERT INTO [event] (eventstart, eventend, name, ExperimentID) VALUES(@start, @end, @name, @ExperimentID)", con);
                //cmd.Parameters.AddWithValue("id", id);
                cmd.Parameters.AddWithValue("start", start);
                cmd.Parameters.AddWithValue("end", end);
                cmd.Parameters.AddWithValue("name", name);
                cmd.Parameters.AddWithValue("ExperimentID", ExpID);

                cmd.ExecuteNonQuery();
            }
        }

        protected void ButtonCancel_Click(object sender, EventArgs e)
        {
            Modal.Close(this);
        }
    }
}